<?php

    include_once ('conexion.php');


    class premio extends conexion{

        public function __construct()
        {
            $this->conexion = new conexion();
            $this->conexion = $this->conexion->connect();
        }

        public function dar_premio($ronda){
            $sql="SELECT valor FROM premios WHERE nivel=$ronda";
            $consulta=$this->conexion->query($sql)->fetchall(PDO::FETCH_OBJ);
            return $consulta[0]->valor;
        }   
    }

?>