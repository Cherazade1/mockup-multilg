<?php
session_start();

if (empty($_SESSION) || (isset($_SESSION) && $_SESSION['lg'] !== "AR" && $_SESSION['lg'] !== "EN")) {
	$_SESSION['lg'] = "EN";
}

$lg = $_SESSION['lg'];
$buf = [];

if (($handle = fopen("traduction.txt", "r")) !== FALSE) {
	while (($data = fgetcsv($handle, 5000, ";")) !== FALSE) {
		switch ($lg) {
			case "AR":
				$buf[$data[1]] = $data[2];
				break;
			case "EN":
				$buf[$data[1]] = $data[3];
				break;
			default:
				$buf[$data[1]] = $data[3];
		}
	}
	fclose($handle);
}
?>

<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="Style/style.css">
	<title><?php echo $buf['titre'] ?></title>
</head>

<body id="container">
	<?php if ($lg === "AR") {
		$html = "<header>
			<button class='panier' onclick='toggle()'>EN</button>
			<nav>
				<ul>
					<li><a href='contact.php'>" . $buf['contact'] . "</a></li>
					<li><a href='presentation.php'>" . $buf['pres'] . "</a></li>
					<li><a href='#'>" . $buf['programme'] . "</a></li>
					<li><a href='index.php'>" . $buf['accueil'] . "</a></li>
				</ul>
			</nav>
			<h1><a href='index.php'>LOGO</a></h1>
		</header>
		
		<div class='wrap'>
		<H2>" . $buf['bienvenue'] . "</H2>
		<p><a href='#'>" . $buf['voirplus'] . "</a></p>
	</div>";
	} elseif ($lg === "EN") {
		$html = "<header>
			<h1><a href='index.php'>LOGO</a></h1>

			<nav>
				<ul>
					<li><a href='index.php'>" . $buf['accueil'] . "</a></li>
					<li><a href='#'>" . $buf['programme'] . "</a></li>
					<li><a href='presentation.php'>" . $buf['pres'] . "</a></li>
					<li><a href='contact.php'>" . $buf['contact'] . "</a></li>
				</ul>
			</nav>

			<button class='panier' onclick='toggle()'>AR</button>
		</header>
		
		<div class='wrap'>
		<H2>" . $buf['bienvenue'] . "</H2>
		<p><a href='#'>" . $buf['voirplus'] . "</a></p>
	</div>";
	}

	echo $html;
	?>
</body>
<script>
	function toggle(str) {
		let xhr = new XMLHttpRequest();
		xhr.open("post", "toggleLang.php");
		//xhr.responseType = "text";
		xhr.send();

		xhr.onerror = function() {
			alert("Une erreur s'est produite");
		}

		location.reload();
	}
</script>

</html>