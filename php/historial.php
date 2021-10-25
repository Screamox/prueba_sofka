<?php

    include_once ('jugador.php');

    $item_jugador = new jugador();


    $historial = $item_jugador->historial();

    echo json_encode($historial);
    



?>