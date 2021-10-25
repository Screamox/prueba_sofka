<?php
     include_once('conexion.php');
    class respuestas extends conexion{


        public function __construct()
        {
            $this->conexion = new conexion();
            $this->conexion = $this->conexion->connect();
        }


        public function respPorPre($idpre){

            $sql="SELECT  respuesta, correcto FROM  respuesta WHERE id_pregunta=$idpre";
            $consulta=$this->conexion->query($sql)->fetchall(PDO::FETCH_OBJ);
            return $consulta;
        }
        

    }

?>