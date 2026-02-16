<?php
	session_start();
	include("../settings/connect_datebase.php");
	
	$login = $_POST['login'];
	$password = $_POST['password'];
	
	// ищем пользователя
	$query_user = $mysqli->query("SELECT * FROM `users` WHERE `login`='".$login."' AND `password`= '".$password."';");
	
	$id = -1;
	while($user_read = $query_user->fetch_row()) {
		$id = $user_read[0];
	}
	
	if($id != -1) {
		$_SESSION['user'] = $id;
		$Ip = $_SERVER["REMOTE_ADDR"];
		// echo $Ip;
		$DateStart = date("Y-m-d H:i:s");

		$Sql = "INSERT INTO `session`(`IdUser`, `Ip`, `DateStart`, `DateNow`) VALUES ({$id}, '{$Ip}',' {$DateStart}',' {$DateStart}')";
		echo $Sql;
		$mysqli->query($Sql);

		$Sql = "SELECT `Id` FROM `session` WHERE `DateStart` = '{$DateStart}';";
		$Query = $mysqli->query($Sql);
		$Read = $Query->fetch_assoc();
		$_SESSION["IdSession"] = $Read["Id"];

		$Sql = "INSERT INTO `logs`(`IdUser`, `Ip`, `Date`, `TimeOnline`, `Event`) VALUES ({$id},'{$Ip}','{$DateStart}','00:00:00','пользователь {$login} авторизован')";
		$mysqli->query($Sql);
	}
	echo md5(md5($id));
?>