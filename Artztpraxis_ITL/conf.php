<?php
/* Verbindunf zur Datenbank */
$server = 'localhost:3306';
$user = 'root'; 
$pwd = '368946'; 
$db = 'adresse'; 

try {
  $con = new PDO('mysql:host='.$server.';dbname='.$db.';charset=utf8', $user, $pwd);
  // Exception-Handling für PDO muss explizit eingeschaltet werden:
  $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  } catch (Exception $e)
  {
  echo 'Error - Verbindung Datenank: '.$e->getCode().': '.$e->getMessage().'<br>';
  }