<?php


    include_once 'jugador.php';


    $id = $_POST['id'];
    $nombre = $_POST['nombre'];
    $ronda = $_POST['ronda'];
    $puntaje = $_POST['puntaje'];
    $item_jugador = new jugador();

    // echo "" . $id ."" .$nombre ."".$ronda ."".$puntaje;
    if($item_jugador->insertarJugador($id, $nombre, $ronda, $puntaje)){
        
        echo 1;
    }else{
        echo 0;
    }



?>