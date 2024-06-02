<?php
$servername = "php-db.cownduljo9z3.us-east-1.rds.amazonaws.com";
$db_username = "admin";
$db_password = "Anvip2003";
$db_name = 'tresflight';

$conn = mysqli_connect($servername, $db_username, $db_password,$db_name);

if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}
// echo "Connection sucess";

