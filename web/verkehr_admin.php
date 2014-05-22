<?php
/**
 * Created by IntelliJ IDEA.
 * User: mtizziani
 * Date: 22.05.14
 * Time: 10:02
 */


// ausgabe der fehler
function linkError($link){
    throw new Exception('NUM: ' . $link->errno . ' | MSG: ' . $link->error);
}

/**
 * baut die datenbankverbindung auf, setzt die anfrage ab und liefert das resultat
 */
function request($query){
    // datenbankverbindung aufbauen
    $link = new mysqli('localhost', 'root', 'orchit', 'verkehr');
    // überprüfen ob die Datenbankverbindung aufgebaut wurde
    if($link->error){
        linkError($link);
    }
    // schriftsatz setzen
    $link->set_charset('utf8');
    // query ausführen
    $resultHash = $link->query($query);
    // überprüfen ob sql fehler aufgetaucht sind
    if($link->error){
        linkError($link);
    }
    // result auf bool überprüfen und wenn nicht dann liste erstellen
    if(gettype($resultHash) !== 'boolean'){
        $resultList = array();
        while($singeResult = $resultHash->fetch_object()){
            // einzelne resultate dem array hinzufügen
            $resultList[] = $singeResult;
        }
        // gebe die resultate als array mit objekten zurück
        return $resultList;
    }
    // wenn der type boolean war dann gebe die letzte insert id der datenbank zurück
    return $link->insert_id;
}

if(filter_input( INPUT_POST, 'type') == 'login'){
    $user = filter_input(INPUT_POST, 'user');
    $pass = filter_input(INPUT_POST, 'pass');
    $query = "select count(username) as results from login where username like '$user' and userpass like '$pass'";
    $jsonResult = json_encode(request($query));

    echo $jsonResult;
}
if(filter_input(INPUT_POST, 'type') == 'save'){
    // daten auslesen die gespeichert weren sollen:
    $intValue = 0;
    $query = "insert into tableName (payed) values ($intValue)";
    echo $query;
}
if(filter_input(INPUT_POST, 'type') == 'reset'){
   // reset the money
}