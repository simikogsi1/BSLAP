<?php
/**
 * Author: Christoph Pollhammer
 * Year: 2015
 * Company: Pixelart.at
 * Hobby: www.hauraus.at
 */

// Start PDO
$DB = new PDO('mysql:host=localhost;dbname=filmverwaltung', 'root', '');

/**
 * defaults
 */
$result = array();
$searchResult = array();

/**
 * produktionsfirma
 */
if(isset($_POST['produktionsfirma']) && !empty($_POST['produktionsfirma'])) {
    // get results
    $sth = $DB->prepare("
        SELECT
            filme.Titel,
            DATE_FORMAT(filme.`Erscheinungs-Datum`,'%d.%m.%Y') as `Erscheinungs-Datum`,
            produktionsfirma.Bezeichnung AS Produktionsfirma
        FROM filme
            left join produktionsfirma ON produktionsfirma.Produktionsfirma_ID = filme.Produktionsfirma_ID
        WHERE produktionsfirma.Bezeichnung like :search
        ");
    $sth->bindValue(':search', '%' . $_POST['produktionsfirma'] . '%');
    $sth->execute();
    $result = $sth->fetchAll(PDO::FETCH_ASSOC);
    
    // foundet Produktionsfirma
    foreach($result as $item) {
        $searchResult[$item['Produktionsfirma']] = $item['Produktionsfirma'];
    }
}

/**
 * schauspieler
 */
if(isset($_POST['schauspieler']) && !empty($_POST['schauspieler'])) {
    // get results
    $sth = $DB->prepare("
        SELECT
           filme.Titel,
           DATE_FORMAT(filme.`Erscheinungs-Datum`,'%d.%m.%Y') as `Erscheinungs-Datum`,
           produktionsfirma.Bezeichnung AS Produktionsfirma, schauspieler.Vorname, schauspieler.Nachname
        FROM filme
            left join produktionsfirma ON produktionsfirma.Produktionsfirma_ID = filme.Produktionsfirma_ID
            left join schauspieler_has_filme ON schauspieler_has_filme.Filme_Song_ID = filme.Song_ID
            left join schauspieler ON schauspieler_has_filme.Schauspieler_id = schauspieler.id
        WHERE schauspieler.Vorname like :search OR schauspieler.Nachname like :search
        ");
    $sth->bindValue(':search', '%' . $_POST['schauspieler'] . '%');
    $sth->execute();
    $result = $sth->fetchAll(PDO::FETCH_ASSOC);
    
    // foundet schauspieler
    foreach($result as $item) {
        $searchResult[$item['Vorname']] = $item['Vorname'] . ' ' .  $item['Nachname'];
    }
}

/**
 * styles
 */
$thStyle = "text-align: left;width: 250px;background-color: #DDD;padding: 10px;";
$tdStyle = "text-align: left;width: 250px;padding: 10px;";

// set right post target
if(isset($_GET['Schauspieler'])) {
    $post = '?Schauspieler';
} else {
    $post = '';
}
?>
<a href="/">Suche Produktionsfirma</a> || <a href="/?Schauspieler">Suche Schauspieler</a> 
<form method="post" action="/<?php echo $post; ?>">
    <?php
        if(!isset($_GET['Schauspieler'])) {
    ?>
    <h3>Filmsuche</h3>
    <label for="produktionsfirma">Suche Film nach Produktionsfirma:</label>
    <input id="produktionsfirma" name="produktionsfirma" value="<?php echo isset($_POST['produktionsfirma']) ? $_POST['produktionsfirma'] : '' ?>" />
    <br><br>
    <?php
        } else {
    ?>
    <h3>Schauspieler Suche</h3>
    <label for="schauspieler">Suche Schauspieler im Film:</label>
    <input id="schauspieler" name="schauspieler" value="<?php echo isset($_POST['schauspieler']) ? $_POST['schauspieler'] : '' ?>" />
    <br><br>
    <?php
        }
    ?>
    <button type="submit">Suchen</button> || <button type="reset">Abbrechen</button>
</form>
<h3>Suchergebnis</h3>
<div>
    <?php
        // SHOW REQUEST TYPE
        if(!isset($_GET['Schauspieler'])) {
    ?>
        <p>Gesuchte Produktionsfirma: <?php echo isset($_POST['produktionsfirma']) ? $_POST['produktionsfirma'] : '' ?></p>
        <p>Gefunde Produktionsfirma: <?php echo implode(' ,', $searchResult) ?></p>
        <p>Gefunde Filmtitel: <?php echo count($result) ?></p>
    <?php
        } else {
    ?>
        <p>Gesuchter Schauspieler: <?php echo isset($_POST['schauspieler']) ? $_POST['schauspieler'] : '' ?></p>
        <p>Gefunde Schauspieler: <?php echo implode(' ,', $searchResult) ?></p>
        <p>Gefunde Schauspieler: <?php echo count($result) ?></p>
    <?php
        }
    ?>
    <table style="border: 1px solid #DDD;padding: 10px;">
        <tr>
            <th style="<?php echo $thStyle ?>">Title</th>
            <th style="<?php echo $thStyle ?>">Erscheinungs-Datum</th>
            <th style="<?php echo $thStyle ?>">Produktionsfirma</th>
        </tr>
        <?php
            // SHOW RESULT
            if($result) {
                foreach($result as $item) {
                    // set name for Schauspieler
                    if(isset($_GET['Schauspieler'])) {
                        $item['Titel'] = $item['Titel'] . ' [' . $item['Vorname'] . ' ' .  $item['Nachname'].']';
                    }
                    
                    // echo result
                    echo '<tr>';
                        echo '<td style="'.$tdStyle.'">' . $item['Titel'] . '</td>';
                        echo '<td style="'.$tdStyle.'">' . $item['Erscheinungs-Datum'] . '</td>';
                        echo '<td style="'.$tdStyle.'">' . $item['Produktionsfirma'] . '</td>';
                    echo '</tr>';
                }
            } else {
                // not found
                echo '<tr>';
                    echo '<td colspan="3" style="'.$tdStyle.';text-align: center;background-color: #FFBEBE;">Kein Ergebnis</td>';
                echo '</tr>';
            }
        ?>
    </table>
</div>