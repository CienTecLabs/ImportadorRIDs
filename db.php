<?php
$HOST = "127.0.0.1";
$USER = "root";
$PASS = "";
$DB = "rid";

//PDO connection
try {
    $conn = new PDO("mysql:host=$HOST;dbname=$DB", $USER, $PASS);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "Connection failed: " . $e -> getMessage();
}