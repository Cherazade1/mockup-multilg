<?php
session_start();

if (empty($_SESSION) || ($_SESSION['lg'] !== "AR" && $_SESSION['lg'] !== "EN")) {
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
	//error_log(print_r($buf, 1));
} ?>

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
		$html = "
		<header>
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

	<div class='wrap2'>
		<div>
			<h2 dir='auto'>" . $buf['formtitre'] . "</h2>
			<form action='admin/save.php' method='post'>
				<p><label for='fname'>" . $buf['formfirstname'] . "</label></p>
				<input type='text' class='inputform' name='prenom' required onkeyup='checkContact()' id='inputLastName'>

				<p><label for='lname'>" . $buf['formlastname'] . "</label></p>
				<input type='text' class='inputform' name='nom' required onkeyup='checkContact()' id='inputFirstName'>

				<div id='userChecker'></div>
				<p><label for=''>" . $buf['formmessage'] . "</label></p>
				<textarea dir='rtl' placeholder='" . $buf['formplaceholder'] . "' name='message' required></textarea>

				<p><input type='submit' value=" . $buf['formenvoi'] . " class='buttonform' name='sent' id='submit'></p>
			</form>
		</div>
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

		<div class='wrap2'>
		<div>
			<h2 dir='auto'>" . $buf['formtitre'] . "</h2>
			<form action='admin/save.php' method='post'>
				<p><label for='fname'>" . $buf['formfirstname'] . "</label></p>
				<input type='text' class='inputform' name='prenom' required onkeyup='checkContact()' id='inputLastName'>

				<p><label for='lname'>" . $buf['formlastname'] . "</label></p>
				<input type='text' class='inputform' name='nom' required onkeyup='checkContact()' id='inputFirstName'>

				<div id='userChecker'></div>
				<p><label for=''>" . $buf['formmessage'] . "</label></p>
				<textarea placeholder='" . $buf['formplaceholder'] . "' name='message' required></textarea>

				<p><input type='submit' value=" . $buf['formenvoi'] . " class='buttonform' name='sent' id='submit'></p>
			</form>
		</div>
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

	function checkContact() {
		const nom = document.getElementById("inputLastName");
		const prenom = document.getElementById("inputFirstName");
		const url = "admin/checker.php?p=" + prenom.value + "&n=" + nom.value;
		let xhr = new XMLHttpRequest();
		xhr.open("GET", url);
		xhr.responseType = "text";
		xhr.send();
		xhr.onload = function() {
			document.getElementById('userChecker').innerHTML = xhr.response;
		}
		xhr.onerror = function() {
			alert("Une erreur s'est produite");
		}
	}
</script>

</html>