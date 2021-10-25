<?php
    
    include_once 'pregunta.php';


    $item_pregunta = new pregunta();


    
    $id_categoria = $_POST['id_cat'];
    $result=$item_pregunta->verPorCategoria($id_categoria);


    echo json_encode($result);



?>