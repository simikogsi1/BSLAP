<?php

function makeTable($query)
{
    global $con;
    try {
        $stmt = $con->prepare($query);
        $stmt->execute();


        $meta = array();

        echo '<table class="table">
<tr>';
        $colCount = $stmt->columnCount();
        for ($i = 0; $i < $colCount; $i++) {
            $meta[] = $stmt->getColumnMeta($i);
            echo '<th>' . $meta[$i]['name'] . '</th>';
        }

        echo '</tr>';


        while ($row = $stmt->fetch(PDO::FETCH_NUM)) {
            echo '<tr>';
            foreach ($row as $r) {
                echo '<td>' . $r . '</td>';
            }
            echo '</tr>';
        }

        echo '</table>';
    } catch (Exception $e) {
        echo 'Error - Tabellen Adressen: ' . $e->getCode() . ': ' . $e->getCode() . '<br>';
    }
}

function makeStatement($query, $executeArray = NULL)
{
    global $con;


    $stmt = $con->prepare($query);
    $stmt->execute($executeArray);
    return $stmt;
}

?>
<?php
function makeTableColouredLastRow($query1)
{
    global $con;
    try {
        $stmt = $con->prepare($query1);
        $stmt->execute();
        /* Tabelle mit "dynamischer" Spaltenbezeichnung mittels meta-Daten */
        $meta = array();
        echo '<table class="table">
    <tr>';
        $colCount = $stmt->columnCount();
        $rowCount = $stmt->rowCount();

        for ($i = 0; $i < $colCount; $i++) {
            $meta[] = $stmt->getColumnMeta($i);
            echo '<th>' . $meta[$i]['name'] . '</th>';
        }
        echo '</tr>';
        $i = 0;
        while ($row = $stmt->fetch(PDO::FETCH_NUM)) {
            if (++$i === $rowCount) {
                echo '<tr>';
                foreach ($row as $r) {
                    echo '<td style="background-color:#ffdf7e;">' . $r . '</td>';
                }
            } else {
                echo '<tr>';
                foreach ($row as $r) {
                    echo '<td>' . $r . '</td>';
                }
            }
            echo '</tr>';

        }
        echo '</table>';


    } catch (Exception $e) {
        echo $e->getCode() . ': ' . $e->getMessage() . '<br>;';
    }
}

?>

