<?php
    /*
     * Программа для проверки на корректность расстановки скобок в выражении
     *
     * Скобки расставлены верно, если:
     * 1) Количество открывающих и закрывающих скобок совпадает
     * 2) Нет такой закрывающей скобки, которой бы не предшествовала открывающая
     */

    $statement = readline();

    $openBrackets = 0;
    $closeBrackets = 0;
    $error = false;

    for ($i = 0; $i < strlen($statement); $i++){
        if ($statement[$i] == '(') $openBrackets++;
        if ($statement[$i] == ')') $closeBrackets++;

        if ($closeBrackets > $openBrackets){    //проверка условия 2)
            $error = true;
            break;
        }
    }

    // проверка условия 1)
    if ($closeBrackets != $openBrackets) $error = true;

    ($error)? print('Statement is wrong.') : print('Statement is correct.');
