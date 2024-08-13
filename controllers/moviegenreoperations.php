<?php

    require_once("../models/moviegenre.php");
    $moviegenre = new moviegenres();

    if (isset($_GET['checkgenreavaiability'])){
        $moviegenre = $_GET['moviegenre'];
        echo $moviegenre->checkmoviegenre($moviegenre);

    }
    if(isset($_POST['addnewgenre'])){
        $genreid=$_POST['genreid'];
        $genrename=$_POST['genrename'];   
        $response=$moviegenre->addnewgenre($genreid, $genrename);
        echo json_encode($response);
    }
    if(isset($_GET['getallgenres'])){
        echo $moviegenre->getallgenres();
    }

?>