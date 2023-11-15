<?php
echo '<h1>Strassen</h1>';
/* Straßennamen erfassen, Ort und PLZ aus Liste auswählen*/
/*Sowohl das Formular als auch die Datenverarbeitung werden auf dieser Seite behandelt*/

echo '<br>';

if (isset($_POST['save'])){
    //Daten speichern
    global $con;
    $orplid = $_POST['orplid'];
    $strasse = $_POST['strasse'];
    $insertStmt1 = 'INSERT INTO adresse.strasse (str_name) VALUES (?)';
    $insertStmt2 = 'INSERT INTO adresse.strasse_ort_plz VALUES (?, ?)';

    try {
        // 1. Strasse speichern
        /* als Funktion verwenden:

    $stmt = $con->prepare($insertStmt1);
    $stmt->execute([$strasse]);
    $strid = $con->lastInsertId();
        */

        $array1 = array($strasse);
        $stmt = makeStatement($insertStmt1, $array1);
        $strid = $con->lastInsertId();

        $array2 = array($strid, $orplid);
        $stmt2=makeStatement($insertStmt2, $array2);
        echo '<h3>Strasse wurde erfasst</h3>';

    } catch (Exception $e) {
        switch ($e->getCode()) {
            case
            23000:
                echo '<h4>Der Straßenname existiert bereits!</h4>';
                break;
            default:
                echo 'Error - Strasse: '.$e->getCode().': '.$e->getMessage().'<br>';
        }
    }



} else {
    // Formular aneigen
    ?>
    <form method="POST">
        <label for="strasse">
            Straßenname:
        </label>
            <br>
        <input type="text" id="strasse" name="strasse" placeholder="z.B. Wiener Strasse" required <br>
        <!-- to do: select-option -->
        <?php
        global $con;
        $query =    'select orpl_id, plz_nr as "PLZ", ort_name as "ort" 
                        from ort_plz natural join (ort, plz) 
                        order by ORT';
        $stmt = $con-> prepare($query);
        $stmt->execute();

        echo '<br><br>
        <p>Wo:<br>
        <select name="orplid">';
        while($row = $stmt->fetch(PDO::FETCH_NUM))
        {
            echo '<option value="'.$row[0].'">'.$row[1].' '.$row[2];
        }
        echo '</p></select>';
        ?>
<br><br>
        <input type="submit" name="save" value="Speichern">
    </form>
    <?php
}

?>
