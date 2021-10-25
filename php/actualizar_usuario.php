<?php

    include_once ('jugador.php');

    $item_jugador = new jugador();

    $id= $_POST['id'];
    $ptn= $_POST['puntaje'];
    $ron= $_POST['ronda'];

    if($item_jugador->updatePlayer($id, $ptn, $ron)){
        echo 1;
    }else{
        echo 0;
    }



?>