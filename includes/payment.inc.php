<?php
session_start();
use PHPMailer\PHPMailer\PHPMailer;
if(isset($_POST['pay_but']) && isset($_SESSION['userId'])) {
    require '../helpers/init_conn_db.php';  
    $flight_id = $_SESSION['flight_id'];
    $price = $_SESSION['price'];
    $passengers = $_SESSION['passengers'];
    $pass_id = $_SESSION['pass_id'];
    $type = $_SESSION['type'];
    $class = $_SESSION['class'];
    $ret_date = $_SESSION['ret_date'];
    $card_no = $_POST['cc-number'];
    $expiry = $_POST['cc-exp'];  
    $sql = 'INSERT INTO payment (passenger_id,expire_date,amount,flight_id,card_no) 
        VALUES (?,?,?,?,?)';            
    $stmt = mysqli_stmt_init($conn);
    if(!mysqli_stmt_prepare($stmt,$sql)) {
        header('Location: ../payment.php?error=sqlerror');
        exit();            
    } else {
        mysqli_stmt_bind_param($stmt,'isiis',$_SESSION['userId'],
            $expiry,$price,$flight_id,$card_no);          
        mysqli_stmt_execute($stmt);       
        $stmt = mysqli_stmt_init($conn);
        $flag = false;
        for($i=0;$i < $passengers;$i++) {
            $sql = 'SELECT * FROM flight WHERE flight_id=?';
            $stmt = mysqli_stmt_init($conn);
            if(!mysqli_stmt_prepare($stmt,$sql)) {
                header('Location: ../payment.php?error=sqlerror');
                exit();            
            } else {
                mysqli_stmt_bind_param($stmt,'i',$flight_id);            
                mysqli_stmt_execute($stmt);
                $result = mysqli_stmt_get_result($stmt);
                if($row = mysqli_fetch_assoc($result)) {
                    $source = $row['source'];
                    $dest = $row['destination'];
                        
                    $stmt = mysqli_stmt_init($conn);
                    $sql = 'INSERT INTO ticket (passenger_id,flight_id
                        ,cost,class,user_id
                        ) VALUES (?,?,?,?,?)';            
                    if(!mysqli_stmt_prepare($stmt,$sql)) {
                        header('Location: ../payment.php?error=sqlerror');
                        exit();            
                    } else {
                        $pid = $pass_id + $i;
                        mysqli_stmt_bind_param($stmt,'iiisi',$pid,
                            $flight_id,$price,$class,$_SESSION['userId']);            
                        mysqli_stmt_execute($stmt);  
                        // echo mysqli_stmt_error($stmt), $class   ;           
                        $flag = true;
                    }                                                                       
                  
                }
                else  {
                    header('Location: ../payment.php?error=sqlerror');
                    exit();                     
                }
            }   
        } 
        if($type === 'round' && $flag === true) {
            $flag = false;
            for($i=$pass_id;$i<=$passengers+$pass_id;$i++) {
                $sql = 'SELECT * FROM flight WHERE source=? AND destination=? AND
                    DATE(departure)=?';
                $stmt = mysqli_stmt_init($conn);
                if(!mysqli_stmt_prepare($stmt,$sql)) {
                    header('Location: ../payment.php?error=sqlerror');
                    exit();            
                } else {
                    mysqli_stmt_bind_param($stmt,'sss',$dest,$source,$ret_date);            
                    mysqli_stmt_execute($stmt);
                    $result = mysqli_stmt_get_result($stmt);
                    if($row = mysqli_fetch_assoc($result)) {                        
                        $flight_id = $row['flight_id'];
                            
                        $stmt = mysqli_stmt_init($conn);
                        $sql = 'INSERT INTO ticket (passenger_id,flight_id
                            ,cost,class,user_id
                            ) VALUES (?,?,?,?,?)';            
                        if(!mysqli_stmt_prepare($stmt,$sql)) {
                            header('Location: ../payment.php?error=sqlerror');
                            exit();            
                        } else {
                            mysqli_stmt_bind_param($stmt,'iiisi',$i,
                                $flight_id,$price,$class,$_SESSION['userId']);            
                            mysqli_stmt_execute($stmt);  
                            // echo mysqli_stmt_error($stmt);           
                            $flag = true;
                        }                                                                       
                      
                    }
                    else  {
                        header('Location: ../payment.php?error=noret');
                        exit();                     
                    }
                }   
            }             
        }
        if($flag) {
            unset($_SESSION['flight_id']);
            unset($_SESSION['passengers']);
            unset($_SESSION['pass_id']);
            unset($_SESSION['price']);
            unset($_SESSION['class']);    
            unset($_SESSION['type']);     
            unset($_SESSION['ret_date']);               
            header('Location: ../pay_success.php');
            exit();    
 
        } else {
            header('Location: ../payment.php?error=sqlerror');
            exit();               
        }
    }            
  
    mysqli_stmt_close($stmt);
    mysqli_close($conn);        

} else {
    header('Location: ../payment.php');
    exit();  
}    
