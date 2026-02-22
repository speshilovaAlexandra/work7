<?php
session_start();
require_once("../settings/connect_datebase.php");

// Проверяем, установлены ли переменные сессии
if (!isset($_SESSION["user"]) || !isset($_SESSION["IdSession"])) {
    session_destroy();
    header("Location: ../index.php"); // Перенаправляем на главную страницу
    exit();
}

$IdUser = $_SESSION["user"];
$IdSession = $_SESSION["IdSession"];

// Используем подготовленные выражения для защиты от SQL-инъекций
$Sql = "SELECT session.*, users.login
        FROM session
        JOIN users ON users.id = session.IdUser
        WHERE session.Id = ?";

$stmt = $mysqli->prepare($Sql);
$stmt->bind_param("i", $IdSession);
$stmt->execute();
$Query = $stmt->get_result();
$Read = $Query->fetch_assoc();

if (!$Read) {
    session_destroy();
    header("Location: ../index.php"); // Перенаправляем на главную страницу
    exit();
}

$TimeStart = strtotime($Read["DateStart"]);
$TimeNow = time();
$Ip = $Read["Ip"];
$TimeDelta = gmdate("H:i:s", $TimeNow - $TimeStart);
$Date = date("Y-m-d H:i:s");
$Login = $Read["login"];

// Логируем выход пользователя
$Sql = "INSERT INTO logs (Ip, IdUser, Date, TimeOnline, Event)
        VALUES (?, ?, ?, ?, ?)";

$stmt = $mysqli->prepare($Sql);
$stmt->bind_param("sisss", $Ip, $IdUser, $Date, $TimeDelta, $Event);
$Event = "Пользователь {$Login} вышел из системы";
$stmt->execute();

// Уничтожаем сессию
session_destroy();

// Перенаправляем пользователя на главную страницу или страницу входа
header("Location: ../index.php");
exit();
?>