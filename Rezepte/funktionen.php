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