<?php
echo '<h2>Test Seite Erfolgreich eingebunden!</h2>';

echo '<form action="/action_page.php">
<label for="fname">Suche nach:</label>
<input type="text" id="fname" name="fname"><br><br>';

/*$query = 'select plz_nr as "Postleitzahl",
ort_name as "Name" from ort natural join plz
where plz_id = ort_id
order by plz_id DESC;';

makeTable($query);*/

echo '<input type="submit" name="search" value="Suche">';

?>