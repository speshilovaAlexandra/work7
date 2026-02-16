<?php
	session_start();
	require_once("../settings/connect_database.php")

	$IdUser = $_SESSION["user"];
	$IdSession = $_SESSION["IdSession"];
	$Sql = "SELECT `session` . *, `users`.`login` ".
			"FROM `session` `session` ".
			"JOIN `users` `users` ON `users`.`id` = `session`.`IdUser` ".
			"WHERE `session`.`Id` = {$IdSession}";
	$Query = $mysqli
	session_destroy();
?>