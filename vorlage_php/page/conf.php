<?php
/* Verbindunf zur Datenbank */
$server = 'localhost:3306';
$user = 'root'; 
$pwd = ''; 
$db = 'adresse'; 

try {
  $con = new PDO('mysql:host='.$server.';dbname='.$db.';charset=utf8', $user, $pwd);
  // Exception-Handling für PDO muss explizit eingeschaltet werden:
  $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  } catch (Exception $e)
  {
  echo 'Error - Verbindung: '.$e->getCode().': '.$e->getMessage().'<br>';
  }