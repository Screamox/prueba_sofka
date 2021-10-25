<?php

    include_once 'respuestas.php';

    $id_pre= $_POST['id_pre'];
    $item_respuestas = new respuestas();
    

    $respuestas= $item_respuestas->respPorPre($id_pre);

    echo json_encode($respuestas);


?>