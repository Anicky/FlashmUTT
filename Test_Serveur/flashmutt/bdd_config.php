<?php

define("HOST", "mysql.hostinger.fr");
define("BASE", "u365147021_if11");
define("USER", "u365147021_if11");
define("PASS", "if11utt");

date_default_timezone_set('Europe/Paris');

$bdd = new PDO("mysql:host=" . HOST . ";dbname=" . BASE, USER, PASS);
$bdd->query("SET NAMES 'utf8'");
?>