<?php
session_start();
include("../settings/connect_datebase.php");

// Получаем данные из формы
$login = $_POST['login'];
$password = $_POST['password'];
$Ip = $_SERVER['REMOTE_ADDR'];
$DateStart = date('Y-m-d H:i:s');

// Ищем пользователя в базе данных
$stmt = $mysqli->prepare("SELECT `id` FROM `users` WHERE `login` = ?");
$stmt->bind_param("s", $login);
$stmt->execute();
$query_user = $stmt->get_result();
$user_read = $query_user->fetch_row();
$id = ($user_read) ? $user_read[0] : -1;

if ($id != -1) {
    // Пользователь уже существует
    echo $id;
} else {
    // Регистрируем нового пользователя
    $stmt = $mysqli->prepare("INSERT INTO `users` (`login`, `password`, `roll`) VALUES (?, ?, 0)");
    $stmt->bind_param("ss", $login, $password);
    $stmt->execute();

    // Получаем ID нового пользователя
    $query_user = $mysqli->prepare("SELECT `id` FROM `users` WHERE `login` = ? AND `password` = ?");
    $query_user->bind_param("ss", $login, $password);
    $query_user->execute();
    $result = $query_user->get_result();
    $user_new = $result->fetch_row();
    $id = ($user_new) ? $user_new[0] : -1;

    if ($id != -1) {
        $_SESSION['user'] = $id; // Запоминаем пользователя в сессии
        echo $id;
    } else {
        echo -1; // Ошибка при регистрации
    }

    // Логируем регистрацию
    $stmt = $mysqli->prepare("INSERT INTO `logs` (`Ip`, `IdUser`, `Date`, `TimeOnline`, `Event`) VALUES (?, ?, ?, ?, ?)");
    $stmt->bind_param("sisss", $Ip, $id, $DateStart, $TimeOnline, $Event);
    $TimeOnline = '00:00:00';
    $Event = "Пользователь {$login} зарегистрировался";
    $stmt->execute();
}
?>
