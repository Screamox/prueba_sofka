<?php

    include_once ('premios.php');


    $item_premios = new premio();

    $ronda=$_POST['ronda'];

    
    $newValor=$item_premios->dar_premio($ronda);
        echo $newValor;
    

?>