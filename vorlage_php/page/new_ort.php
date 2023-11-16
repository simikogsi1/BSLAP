<?php
echo '<h1>Neuen Ort  Hinzufügen</h1>';

echo '<br>';

if (isset($_POST['save'])){

    global $con;

    if(isset($_POST))
        $ortsname = $_POST['ort'];

    $ort = (isset($_POST['ortsname'])) ? htmlspecialchars($_POST["ortsname"]) : "";

    $insertStmt1 = 'INSERT INTO ort (ort_name) VALUES (?)';
    try {
        $array1 = array($ortsname);
        $stmt = makeStatement($insertStmt1, $array1);
        $strid = $con->lastInsertId();

        echo '<h3>Wollen Sie den neuen ort "'.$ortsname.'" in der Datenbank wirklich anlegen?</h3>';?>
        <form method="POST">
            <input type="submit" name="ja" value="Ja">
            <a href="?seite=new_ort" class="btn" role="button">
            <input type="submit" name="nein" value="Nein">
            </a>
<?php

echo '<input type="hidden" name="ortsname" value="'.$ortsname.'" </input>';
?>
        </form>
        <?php
        }
        catch (Exception $e)
        {
            echo 'Error - Neuer Ort: ' . $e->getCode() . ': ' . $e->getCode() . '<br>';
            }

}
?>
<?php
$query1 = 'select ort_id as "ORT ID",
    ort_name as "Ort"
    from ort;';

if (isset($_POST['ja'])){
    try{
        makeTableColouredLastRow($query1);
    }
catch (Exception $e)
 {

        echo 'Fehler: ' . $e->getCode() . ': ' . $e->getMessage() . '<br>';
     echo '<button onclick="javascript:history.go(-1)">Änderung abgebrochen.</button>';
 }
}



?>
<form method="POST">
    <label for="ort">
        Neuer Ort:
    </label>
    <br>
    <input type="text" id="ort" name="ort" placeholder="z.B. Wiener Strasse" required <br>
    <!-- to do: select-option -->
        <br><br>

    <?php
    $query = 'select ort_id as "ORT ID",
    ort_name as "Ort"
    from ort;';

    makeTable($query);




    ?>
        <input type="submit" name="save" value="Ändern">
    </form>