<?php

$database = new mysqli("localhost", "root", "arzelzolina10", "medical");
if ($database->connect_error) {
    die("Connection failed:  " . $database->connect_error);
}
