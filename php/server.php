<?php

/** config file for mysql */
class SqlConfig{
    public static $user = 'root';
    public static $pass = 'orchit';
    public static $host = 'localhost';
    public static $db = 'verkehr';
}

function execute($query){
    if(count($query) > 0) {
        $connection = new mysqli(SqlConfig::$host, SqlConfig::$user, SqlConfig::$pass, SqlConfig::$db);
        if ($connection->connect_errno) {
            http_response_code(409);
            error_log('SQL Error: ' . $connection->connect_error);
            die();
        }
        $connection->set_charset('utf8');
        $resultHash = $connection->query($query);
        if ($connection->errno) {
            http_response_code(409);
            error_log('SQL Error: ' . $connection->error);
            die();
        }
        if (gettype($resultHash) !== 'boolean') {
            $resultList = array();
            while ($singleResult = $resultHash->fetch_object()) {
                $resultList[] = $singleResult;
            }
            return $resultList;
        }
        return $connection->insert_id;
    }
    return null;
}
function getPricegroups(){
    $query = 'select * from pricegroup';
    $result = execute($query);
}
function getOptions(){
    $query = 'select * from option';
    $result = execute($query);
}
function getMoney(){
    $query = 'select * from money';
    $result = execute($query);
}
function getPayments(){
    $query = 'select * from payments';
    $result = execute($query);
}
function checkUser($userName, $userPassword){
    $query = "select id from user where name = $userName and pass = $userPassword";
    $result = execute($query);
}
function savePayment($input){
    $query = "insert into payments (value, `timestring`) values ($input, ". time() .")";
    $result = execute($query);
}
function setMoneyCount($moneyId, $value){
    $query = "update money set countNow = $value where id = $moneyId";
    execute($query);
}

function resetMoney(){
    $query = "update money set countNow = countBegin";
    execute($query);
}