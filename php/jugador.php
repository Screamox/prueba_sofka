<?php

    include_once ('conexion.php');


    class jugador extends conexion{

        public function __construct()
        {
            $this->conexion = new conexion();
            $this->conexion = $this->conexion->connect();
        }

        public function insertarJugador($id, $nombre, $pnt, $ron){
        
        $sql = "INSERT INTO  jugador 
        (id, nombre, puntaje, ronda) VALUES
        (:id, :nom, :pntj, :ron)";

        $sql =$this->conexion->prepare($sql);
        $sql->bindParam(':id',$id,PDO::PARAM_INT, 25);
        $sql->bindParam(':nom',$nombre,PDO::PARAM_STR, 25);
        $sql->bindParam(':pntj',$pnt,PDO::PARAM_INT, 25);
        $sql->bindParam(':ron',$ron,PDO::PARAM_INT, 25);
        

        
            if($sql->execute() ){
                return true;
            }else{
                return false;
            }   
        }

        public function updatePlayer($id, $ptn, $ron){

            $sql="UPDATE jugador SET
             puntaje=:ptn, ronda=:ron 
             WHERE id=:id";


            
             $sql =$this->conexion->prepare($sql);
             $sql->bindParam(':id',$id,PDO::PARAM_INT);
             $sql->bindParam(':ptn',$ptn,PDO::PARAM_INT);
             $sql->bindParam(':ron',$ron,PDO::PARAM_INT);

            if($sql->execute() ){
                return true;
            }else{
                return false;
            }   

        }



        public function consultar(){
            $sql="SELECT * FROM jugador";
            $consulta=$this->conexion->query($sql)->fetchall(PDO::FETCH_OBJ);
            return $consulta;
        }

        public function newid(){
            $sql="SELECT MAX(id) as id FROM jugador";
            $consulta=$this->conexion->query($sql)->fetchall(PDO::FETCH_OBJ);
            return $consulta[0]->id+1;
        }

        public function historial(){
            $sql="SELECT  nombre, puntaje, ronda FROM jugador ORDER BY  puntaje DESC  LIMIT  10";
            $consulta=$this->conexion->query($sql)->fetchall(PDO::FETCH_OBJ);
            return $consulta;
        }

    }