<?php
    $statement = readline();

    $openBrackets = 0;
    $closeBrackets = 0;
    $error = false;

    for ($i = 0; $i < strlen($statement); $i++){
        if ($statement[$i] == '(') $openBrackets++;
        if ($statement[$i] == ')') $closeBrackets++;
        if ($closeBrackets > $openBrackets){
            $error = true;
            break;
        }
    }

    if ($closeBrackets != $openBrackets) $error = true;
    ($error)? print('Statement is wrong.') : print('Statement is correct');