<?php

    require_once("db.php");

    class actors extends db{
        //get all actors
        function checkactordetails(){
            $sql="CALL `sp_checkallactors`()";
            return $this->getJSON($sql);
        }
        //check if actors exist
        function checkifactorexists($stagename){
            $sql="CALL `sp_queryactordetails`('{$stagename}')";
            return $this->getData($sql)->rowcount();
        }

        //addnewactor
        function addnewactor($actorid,$firstname,$lastname, $stagename, $nationality, $actorage){
            
            $sql="CALL `sp_addactor`({$actorid} ,'{$firstname}' ,'{$lastname}' ,'{$stagename}' , {$this->userid} , {$nationality} ,{$actorage})";
            $this->getData($sql);
            return ["status"=>"success","message"=>"Actor added to Records."];
        }
        //read all actors
        function getallactors(){
            $sql="CALL `sp_checkallactors`()";
            return $this->getJSON($sql);
        }
      
        //filter actors by age
        function getactorsbelowage($actorage){
            $sql="CALL `sp_filteractorbyagemax`('{$actorage}')";
            return $this->getJSOn($sql);
        }
        //delete actors
        function deleteactor($actorid){
            $sql="CALL `sp_deleteactor`({$actorid})";
            $this->getData($sql);
            return ["status"=> "success","message"=> "Actor removed successfully"];

        }
    }


?>