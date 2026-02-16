<?php
	session_start();
	require_once("../settings/connect_datebase.php");

	$IdUser = $_SESSION["user"];
	$IdSession = $_SESSION["IdSession"];
	$Sql = "SELECT `session` . *, `users`.`login` ".
			"FROM `session` `session` ".
			"JOIN `users` `users` ON `users`.`id` = `session`.`IdUser` ".
			"WHERE `session`.`Id` = {$IdSession}";
	$Query = $mysqli->query($Sql);
	$Read = $Query->fetch_assoc();

	$TimeStart = strtotime($Read["DateStart"]);
	$TimeNow = time();
	$Ip = $Read["Ip"];
	$TimeDelta = gmdate("H:i:s", $TimeDelta - $TimeStart);
	$DateStart = date("Y-m-d H:i:s");
	$Login = $Read["login"];

	$Sql = "INSERT INTO `logs` ( `IdUser`, `Ip`, `Date`, `TimeOnline`, `Event`)
        VALUES ('{$Ip}', '{$IdUser}', '{$DateStart}', '{$TimeDelta}', 'пользователь {$Login} вышел из акка')";
	session_destroy();
?>