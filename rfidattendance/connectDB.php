<?php
/* Database connection settings */
	$servername = "localhost";
    $username = "root";		//put your phpmyadmin username.(default is "root")
    $password = "";			//if your phpmyadmin has a password put it here.(default is "root")
    $dbname = "rfidattendance";
    
	$conn = mysqli_connect($servername, $username, $password, $dbname);
	
	if (!$conn) {
        die("Database Connection failed: ");
    }
   // echo "Connected!";
?>