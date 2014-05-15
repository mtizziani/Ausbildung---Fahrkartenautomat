<?php
/**
 * Created by IntelliJ IDEA.
 * User: mtizziani
 * Date: 15.05.14
 * Time: 08:05
 */

class Config{
    public $user = 'root';
    public $host = 'localhost';
    public $password = 'orchit';
    public $db = 'verkehr';
}


class Server
{
    private $config;
    public function __construct($config){
        $this->config = $config;
    }
    private function executeQuery($queryString)
    {
        if ($queryString) {
            $link = new mysqli($this->config->host, $this->config->user, $this->config->password, $this->config->db, null, null);
            if ($link->error) {
                http_response_code(409);
                error_log("SQL-Error: ". $link->errno .' - '. $link->error);
                die($link->errno . ': ' . $link->error);
            }
            $link->set_charset('utf8');
            $resultHash = $link->query($queryString);
            if ($link->error) {
                http_response_code(409);
                error_log("SQL-Error: ". $link->errno .' - '. $link->error);
                die($link->errno . ': ' . $link->error);
            }
            if (gettype($resultHash) !== 'boolean') {
                $resultList = array();
                while ($singleResult = $resultHash->fetch_object()) {
                    $resultList[] = $singleResult;
                }
                return $resultList;
            }
            $link->close();
            return $resultHash;
        }
    }


    private function saveDriverCardToDatabase($priceGroupId){
        $query = 'insert into payedCards (`pricegroupId`) values ('.$priceGroupId.')';
        return $this->executeQuery($query);
    }
}

$server = new Server(new Config());

