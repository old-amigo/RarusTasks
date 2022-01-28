<?php
$message = "Отправка прошла успешно";
if(empty($_POST['name']) or empty($_POST['number'])){
    $message = "Ошибка сервера: данные таинственным образом исчезли!";
}
elseif(!empty($_POST['email'])){
    if(stripos($_POST['email'], '@gmail.com')){
        $message = "регистрация пользователей с таким почтовым адресом невозможна";
    }
}

$response = ['message' => $message];

header('Content-type: application/json');
echo json_encode($response);
?>