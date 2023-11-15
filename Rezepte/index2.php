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
        <li><a href="index.php">Rezept Suchen Generell</a></li>
        <li class="active" ><a href="index2.php">Rezept suchen nach Zeitraum</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="jumbotron text-center" style="margin-bottom:0">

    <h2>Rezepte nach Bereitstellungszeitraum durchsuchen:</h2>
<br>

    <div class="search-container">
        <form>
            <label for="birthday">Von:</label>
            <input type="date" id="birthday" name="birthday">
            <br>
            <label for="birthday">Bis:</label>
            <input type="date" id="birthday" name="birthday">
            <br><br>
            <button class="btn btn-danger" type="submit">Suche Starten</button>
        </form>
    </div>

<hr>

    <div class="jumbotron text-center" style="margin-bottom:0">
        <b> <h2 >Oder wählen Sie aus folgenden Optionen aus:</h2></b>
        <h5>Zeitraum:</h5>

        <br>
    <div class="search-container">
        <form>
            <div class="row">
                <div class="radio-group">
                    <input type="radio" id="lemo" name="option" value="letztermonat" checked>
                    <label for="lemo">letzter Monat</label><br>
                    <input type="radio" id="laufmo" name="option" value="laufmonat">
                    <label for="laufmo">laufender Monat</label><br>
                    <input type="radio" id="einMo" name="option" onclick="showTextField()">
                    <label for="radio">Monat des laufenden Jahres angeben:</label><br>
                </div>
                <input class="size" type="number" id="einMon" name="option" placeholder="Monat" style="display: none;">
<br><br>
                <button class="btn btn-danger" type="submit">Suche Starten</button>

                <script>
                    function showTextField() {
                        var radioMonat = document.getElementById("einMo");
                        var monat = document.getElementById("einMon");

                        if (radioMonat.checked) {
                            monat.style.display = "inline-block";
                        } else {
                            monat.style.display = "none";
                        }
                    }
                </script>
        </form>
    </div>
</div>


</body>
</html>
