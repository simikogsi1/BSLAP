<!DOCTYPE html>
<html lang="en">

<head>
  <link href="assets/css/style.css" rel="stylesheet">
  <?php include("Head.php"); ?>
</head>

<body>
  <header id="header" class="fixed-top d-flex align-items-center">
    <div class="container d-flex align-items-center">
      <h1 class="logo me-auto"><a href="index.php">Kogseder<span>.</span></h1></a>
      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
          <li><a class="nav-link" aria-current="page" href="index.php">Start</a></li>
          <li><a class="nav-link scrollto" href="#Diagnosen">Diagnosen</a></li>
        </ul>
        <a href="Formular.php">
          <button type="button" class="btn btn-danger">Formular</button>
        </a>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->
    </div>
  </header><!-- End Header -->

  <?php include("Hero.php"); ?>

  <main id="main">
    <section>
      <div class="container1 ab">
        <form class="form-horizontal" method="POST">
          <div class="form-group">
            <h2 id="Diagnosen" class="ba">Patienten - Diagnosen</h2><br>

            <label class="control-label col-sm-2" for="SV">Sv-Nr.:</label>
            <input type="number" class="form-control" id="SV" placeholder="Vierstellige Zahl" name="SV" required>
            <input type="hidden" name="suchen" value="suche" required>
            <br>
            <label class="control-label col-sm-2" for="SV">Geburtsdatum:</label>
            <input type="date" class="form-control" id="gb" name="gb" required>
          </div>
          <br><br>
          <h3>Behandlungszeitraum:</h3>
          <h5>Geben Sie ein Jahr ein über das Sie Informationen haben wollen:</h5><br>
          <div class="form-group">
          <label class="control-label col-sm-2" for="start">Jahr<br>
              <input type="number" id="start" name="start" required placeholder="zb 2022"></input>
            </p></label>
          </div>
          <br>
          <br>
          <section>
            <div class="form-group">
              <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" name="save" class="btn btn-danger">Anzeigen</button>
              </div>
            </div>
          </section>
          </form>
      </div>
    </section>

        <section>
          <div class="container1 ab">
            <div class="form-group">
              <form class="form-horizontal">

                <?php
                include 'conf.php';
                include 'funktionen.php';
                if (filter_input(INPUT_POST, 'suchen')) {
                  $eingabeSV = filter_input(INPUT_POST, 'SV');
                  $eingabeGeburtsdatum = filter_input(INPUT_POST, 'gb');
                  $aktuellesDatum = date('Y-m-d');
                  $start = filter_input(INPUT_POST, 'start');
              
                  if (strlen($eingabeSV) == 4 && ctype_digit($eingabeSV)) {
                      if (strtotime($eingabeGeburtsdatum) <= strtotime($aktuellesDatum)) {
                          echo '<h2>Suchkriterien:</h2>';
                          echo '<p>SV-Nr.: ' . $eingabeSV . '/' . $eingabeGeburtsdatum . '</p>';
              
                          if ($start) {
                            if (strtotime($start) !== false && strtotime($start) <= strtotime(date('Y'))) { 
                                  echo '<p>Sie suchten im Jahr: ' . $start . '</p>';
              
                                  $query = "SELECT CONCAT(tz.ter_beginn, ' - ', tz.ter_ende) AS Zeitraum,
                                              CONCAT(p.per_vname, ' ', p.per_nname) AS Patient,
                                              CONCAT(p.per_svnr, '/', p.per_geburt) AS `SvNr - Gb-Datum`,
                                              dia_name AS Diagnose
                                              FROM behandlungszeitraum tz
                                              JOIN person p ON tz.per_id = p.per_id
                                              JOIN diagnose d ON tz.dia_id = d.dia_id
                                              WHERE p.per_svnr = ? AND p.per_geburt = ? AND tz.ter_beginn LIKE ? 
                                              AND tz.ter_ende LIKE ?";
                                  
                                  $result = makeTable($query, [$eingabeSV, $eingabeGeburtsdatum, "$start%", "$start%"]);
              
                                  
              
                              } else {
                                  echo "Jahr kann nicht in der Zukunft Liegen!"; // Ausgabe Info Jahr (Jahr kann nicht in der Zukunft Liegen)
                              }
                          } else {
                               // Ausgabe Info Behandlungs Jahr (Wenn Behandlungs Jahr keinen Wert hat )
                          }
                      } else {
                          echo "Das Geburtsdatum kann nicht in der Zukunft Liegen!"; // Ausgabe Info Geburtsdatum (Geburtsdatum kann nicht in der Zukunft Liegen)
                      }
                  } else {
                      echo "Deine SV-Nummer ist FALSCH!"; // Ausgabe Info SV-Nummer (SV-Nummer hat mehr oder weniger Zeichen als 4)
                  }
              } else {
                  echo "Nichts Gefunden :("; // Wird ausgegeben, wenn der 'suchen'-Parameter nicht vorhanden ist
              }              
              
                ?>

            </div>
          </div>
          </form>
        </section>

  </main>

  <?php include("footer.php"); ?>

</body>

</html>