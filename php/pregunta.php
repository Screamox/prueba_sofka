<?php

    include_once('conexion.php');

    class pregunta extends conexion{

        public function __construct()
        {
            $this->conexion = new conexion();
            $this->conexion = $this->conexion->connect();
            
        }

        public function verPorCategoria($categoria){

            $sql="SELECT id_pregunta, enunciado FROM pregunta WHERE id_categoria =$categoria";
            $consulta=$this->conexion->query($sql)->fetchall(PDO::FETCH_OBJ);
            return $consulta;
        
        }

    }
    


?>