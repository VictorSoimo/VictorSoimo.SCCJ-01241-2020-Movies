<?php
    require_once("db.php");

    class moviegenres extends db{

        //get genre details
        function checkmoviegenre($moviegenre){
            $sql="CALL `sp_checkgenreavailability`('{$moviegenre}')";
            return $this->getData($sql)->rowCount();
        }
        //add new genre
        function addnewgenre($genreid, $genrename){
            //check if genre exists
            if($this->checkmoviegenre($moviegenre)){
                return ["status"=>"exists","message"=>"movie genre exists"];

            }
            else{
                $sql="CALL `sp_addnewgenre`({$genreid}, '{$genrename}', '{}', {$this->userid})";
                $this->getData($sql);
                return ["status"=>"success","message"=>"genre category saved successfully"];
            }
           
    	}
        //check how long ago a user added a genre
        function checkwhoaddedgenre($genreid){
            $sql="CALL `sp_checkwhoaddedgenre`({$genreid})";
            $this->getData($sql);
            return $this->getJSON($sql);
        }

        //get allgenres
        function getallgenres(){
            $sql="CALL `sp_getallgenres`()";
            return $this->getJSON($sql);

        }

    }


?>