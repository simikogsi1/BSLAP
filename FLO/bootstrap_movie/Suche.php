<?php

$stmt = $pdo->prepare("SELECT Titel, ErscheinDat, ProdName FROM Film right inner join Produktionsfirma on Produktionsfirma.ProdID=Film.ProdID WHERE ProdName LIKE ?");
$stmt->execute([$suche]); 
while ($row = $stmt->fetch()) {
    echo $row['name']."<br />\n";
}


?>