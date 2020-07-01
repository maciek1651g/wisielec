<?php
	header('Content-Type: text/html; charset=utf-8');
	//$conn = new mysqli('localhost', 'root', '', 'wisielec');
	$conn = new mysqli('sql110.epizy.com', 'epiz_26118058', '78CK2yz4EJpZ', 'epiz_26118058_wisielec');
	$conn -> set_charset("utf8");
	
	if ($conn->connect_error) 
	{
		die("Connection failed: " . $conn->connect_error);
	}
	
	$sql = 'SELECT hasla.haslo, kategoria.nazwa FROM kategoria, hasla WHERE kategoria.id=hasla.id_kategorii';
	$result = $conn->query($sql);
	$liczba_hasel = $result->num_rows;
	
	if ($liczba_hasel > 0) 
	{
		$losowanko = rand(1,$liczba_hasel);
		
		$sql = 'SELECT hasla.haslo, kategoria.nazwa FROM kategoria, hasla WHERE kategoria.id=hasla.id_kategorii and hasla.id='.$losowanko;
		$result = $conn->query($sql);
		
		if($result->num_rows > 0)
		{
			$row = $result->fetch_assoc();
			$haslo = $row['haslo'];
			$kategoria = $row['nazwa'];
		}
		else
		{
			die("Brak haseł w bazie danych");
		}
	}
	else
	{
		die("Brak haseł w bazie danych");
	}
	
	if(isset($_POST['wygrana2']) && isset($_POST['gracz']) )
	{
		$nazwa = htmlentities(html_entity_decode($_POST['gracz']));
		$liczba = htmlentities(html_entity_decode($_POST['wygrana2']));
		$sql = 'INSERT INTO ranking(nazwa, liczbaWygranych) values("'.$nazwa.'", '.$liczba.')';
		$dodano = $conn->query($sql);
		
		header("Location: index.php");
	}
	
	if(!isset($_POST['wygrana']))
	{
		$_POST['wygrana']=0;
	}
?>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>Gra w wisielca</title>
		<link href="style.css" rel="stylesheet">
		<script>
			var haslo = "<?php echo $haslo ?>";
			var kategoria = "<?php echo $kategoria ?>";
			var ileHasel = <?php echo $liczba_hasel ?>;
			var licznikWygranych = <?php echo $_POST['wygrana'] ?>;
		</script>
		<script src="./skrypt.js"></script>
		<script src="./jquery-3.2.1.min.js"></script>
	</head>
	<body>
		<div id="strona">
			<div id="obrazek" class="wiersz1">
				<div id="image">
					<img src="./pictures/0.png" alt="Wisielec"/>
				</div>
			</div>
			<div id="ranking" class="wiersz1">
				<h3>5 najlepszych wyników</h3>
				<ol>
					<?php 
						$sql = 'SELECT nazwa, liczbaWygranych FROM ranking ORDER by liczbaWygranych desc LIMIT 5';
						$result = $conn->query($sql);
			
						if($result->num_rows > 0)
						{
							while($row = $result->fetch_assoc())
							{
								$nazwa = $row['nazwa'];
								$liczbaWygranych = $row['liczbaWygranych'];
								echo "<li>".$nazwa.", wygranych: ".$liczbaWygranych."</li>";
							}
						}
					?>
				</ol>
				<div><p style="font-size:20px;">Liczba haseł w bazie danych:<br/> <?php echo $liczba_hasel; ?></p></div>
			</div>
			<div class="wiersz3">
				<div id="haslo">
					<p>Kategoria: <?php echo $kategoria ?></p>
					<p id="poleHaslo"></p>
				</div>
			</div>
			<div id="literki" class="wiersz2" onselectstart="return false" onselect="return false" oncopy="return false">
				<?php 
					$alfabet = array('A','Ą','B','C','Ć','D','E','Ę',
					'F','G','H','I','J','K','L','Ł','M','N','Ń','O','Ó','P','Q',
					'R','S','Ś','T','U','V','W','X','Y','Z','Ź','Ż');
				
					foreach ($alfabet as $litera) 
					{
						echo "<div class='litera' onclick='SprLitere(this)'>$litera</div>"; 
					} 
				?>
			</div>
			<div id="przyciski" class="wiersz2">
				<form method="post" action="index.php">
					<div><button class="przycisk" onclick="noweHaslo()" type="button">Nowe hasło</button></div>
					<input type="hidden" id="wygrana" name="wygrana" value=""/>
				</form>
				<div><button class="przycisk" onclick="odslonHaslo()" type="button">Odsłoń hasło</button></div>
				<div id="ileWygranych">
					<p style="font-size:20px;">Liczba wygranych: <?php if(!isset($_POST['wygrana'])){echo "0";}else{echo $_POST['wygrana'];}?></p>
				</div>
				<div>
					<form method="post" action="index.php">
						<label for="gracz">Nazwa: </label>
						<input type="text" id="gracz" name="gracz" />
						<div><button class="przycisk" onclick="zapiszWynik()" type="button">Zapisz wynik</button></div>
						<input type="hidden" id="wygrana2" name="wygrana2" value=""/>
					</form>
					<div>
						<?php 
							if(isset($dodano))
							{
								if($dodano===TRUE)
								{
									echo "<p>Dodano rekord</p>";
								}
								else
								{
									echo "<p>Błąd dodawania rekordu</p>";
								}
							}
						?>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>

<?php
	$conn->close();
 ?>