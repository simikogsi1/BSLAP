<?php
echo '<h1>Adressen</h1>';

$query = 'select plz_nr as "PLZ", 
        ort_name as "Ort",
        str_name as "Strasse"
        from strasse_ort_plz natural join ort_plz natural join strasse natural join ort natural join plz';

makeTable($query);
?>