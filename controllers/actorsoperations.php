<?php

require_once("../models/actors.php");
$actor = new actors() ;

//fetch actors
if(isset($_GET["getallactors"])){
    echo $actor->getallactors();
}
//getactorbyid
if(isset($_GET["searchactorbyid"])){
    $actorid= $_GET["actroid"];
    echo $actor->checkifactorexists($actorid);
}
//add actor
if(isset($_POST["addnewactor"])){
    $actorid= $_POST['actorid'];
    $firstname= $_POST["firstname"];
    $lastname= $_POST["lastname"];
    $stagename= $_POST["stagename"];
    $nationality= $_POST["nationality"];
    $actorage= $_POST["actorage"];
    $response = $actor->addnewactor($actorid,$firstname,$lastname,$stagename,$nationality,$actorage);
    echo json_encode($response);
}
//delete actor
if(isset($_POST["deleteactor"])){
    $actorid= $_POST["actorid"];
    $response= $actor->deleteactor($actorid);
    echo json_encode($response);
    
}
//get actors by certain max age
if(isset($_GET["getactorsbelowcertainage"])){
    $actorage= $_GET["actorage"];
    echo $actor->getactorsbelowage($actorage);
}