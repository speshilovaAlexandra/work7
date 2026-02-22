<?php
require_once("../../settings/connect_datebase.php");

$Sql = "SELECT * FROM `logs` ORDER BY `Date`";
$Query = $mysqli->query($Sql);
//открытие отдельного файла для записи
$logFile = fopen("../../logs.txt", "a");

if (!$logFile) {
    die("Не удалось открыть файл для логирования.");
}

$Events = array();

while($Read = $Query->fetch_assoc()) {
    $Status = "";
    
    $SqlSession = "SELECT * FROM `session` WHERE `IdUser` = {$Read["IdUser"]} ORDER BY `DateStart` DESC";
    $QuerySession = $mysqli->query($SqlSession);
    if($QuerySession->num_rows > 0) {
        $ReadSession = $QuerySession->fetch_assoc();
        
        $TimeEnd = strtotime(datetime: $ReadSession["DateNow"]) + 5*60;
        $TimeNow = time();
        
        if($TimeEnd > $TimeNow)
            $Status = "online";
        else {
            $TimeEnd = strtotime(datetime: $ReadSession["DateNow"]);
            $TimeDelta = round(num: ($TimeNow - $TimeEnd)/60);
            
            $Status = "был в сети: {$TimeDelta} минут назад";
        }
    }
    
    $Event = array(
        "Id" => $Read["Id"],
        "Ip" => $Read["Ip"],
        "Date" => $Read["Date"],
        "TimeOnline" => $Read["TimeOnline"],
        "Status" => $Status,
        "Event" => $Read["Event"]
    );    
    
    // запись события
    $logEntry = sprintf(
        "[%s] IP: %s | Пользователь: %s | Статус: %s | Событие: %s\n",
        $Read["Date"],
        $Read["Ip"],
        $Read["IdUser"],
        $Status,
        $Read["Event"]
    );

    fwrite($logFile, $logEntry);
    array_push($Events, $Event);
}
// Закрываем файл
fclose($logFile);
echo json_encode( $Events, JSON_UNESCAPED_UNICODE);




?>