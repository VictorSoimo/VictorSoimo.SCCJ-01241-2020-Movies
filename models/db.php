<?php

    //this is the entrypoint class into my movies database
    $sql="";
    class db{

        //properties
        private $servername;
        private $username;
        private $password;
        private $dbname;
        private $charset;
        public $userid;

       function __construct(){
            $this->userid = 1;
       }
        //methods
        //connection method
        function connect(){

            $this->servername="localhost";
            $this->charset="utf8mb4";
            $this->username="root";
            $this->password="";
            $this->dbname="movie";


            //error checking for the database login process
            try{
                //connection string
                //driver:host(where it is hosted);servernam;dbname;
                $dsn = "mysql:host=" . $this->servername . ";dbname=" . $this->dbname . ";charset=" . $this->charset;

                // PHP Database Object 'PDO'
                $pdo=new PDO($dsn, $this->username, $this->password);
                $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                return $pdo;
            }catch(PDOException $e){

                echo "Connection failed ".$e->getMessage();
            }

        }
        function getData($sql){
            return $this->connect()->query($sql);
        }
        function getJSON($sql){
            $rst=$this->getData($sql);
            return json_encode($rst->fetchAll(PDO::FETCH_ASSOC));
        }
        function mySQLDate($date){
            $date=DateTime::createFormat('d-M-Y',$date);
            return $date->format('Y-M-d');
        }



    }
  //  $db = new db();
   // echo $db->getJSON('CALL `sp_checkallactors`()') ;
    
?>