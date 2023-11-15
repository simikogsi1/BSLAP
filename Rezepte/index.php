<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Website Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>


<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Rezepte</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
          <li><a href="home.php">Home</a></li>
        <li class="active" ><a href="index.php">Rezept Suchen Generell</a></li>
        <li><a href="index2.php">Rezept suchen nach Zeitraum</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="jumbotron text-center" style="margin-bottom:0">
    <b> <h2 >Nach Rezept suchen:</h2></b>
    <h5>Rezetptnamen suchen (auch Wortteil möglich):</h5>
    <div class="search-container">
        <form method="POST">
            <input type="text" placeholder="Search.." name="search">
            <button class="btn btn-danger" name="save" type="submit">Suchen</button>
        </form>
    </div>
</div>

<div class="container">
  <div class="row">
    <div class="col-sm-4">
        <?php
        $query = 'select * from einheit;';

        makeTable($query);




        ?>

    </div>
  </div>
</div>

<?php
echo '<h1>Test</h1>';

echo '<br>';

if (isset($_POST['save'])){

    global $con;

    if(isset($_POST))
        $such = $_POST['ort'];

    $ort = (isset($_POST['ortsname'])) ? htmlspecialchars($_POST["ortsname"]) : "";

    try {

        echo '<h3>Es wurde nach "'.$such.'" in der Datenbank gesucht</h3>';?>
        <?php
    }
    catch (Exception $e)
    {
        echo 'Error' . $e->getCode() . ': ' . $e->getCode() . '<br>';
    }

}
?>

</body>
</html>
