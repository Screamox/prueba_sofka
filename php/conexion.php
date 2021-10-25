<?php
    class conexion{
        private $host ="localhost";
        private $user ="root";
        private $pass ="";
        private $db ="sofka_test";
        private $connect; 
        

        public function __construct()
        {
            $connectionString = "mysql:hos=" .$this->host . ";dbname=" . $this->db . ";charset=utf8";

            
            
            
            

            try{

                $this->connect = new PDO($connectionString, $this->user, $this->pass);

                if($this->connect->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION)){
                    
                }

                

               

            }catch(Exception $e){
            
                die("Error" . $e->getMessage());
                echo "linea del error " . $e->getLine(); 
            
            }





        }

        public function connect()
            {
                return $this->connect;
            }
    
    
    }



?>