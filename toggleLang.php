<?php
session_start();

if (!empty($_SESSION["lg"])) {
	if ($_SESSION["lg"] === "AR") {
		$_SESSION["lg"] = "EN";
	} elseif ($_SESSION["lg"] === "EN") {
		$_SESSION["lg"] = "AR";
	}
} else {
	$lg = "EN";
}
