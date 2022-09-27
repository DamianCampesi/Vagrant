<?php

abstract class Database
{

    private static $USER = "vagrant";
    private static $PASSWORD = "vagrantpass";
    private static $DB = "vagrant";
    private static $HOST = "10.10.20.15";

    public function __constrtuct()
    {

    }

    public static function getConnection()
    {
        $_connection = new mysqli(self::$HOST, self::$USER, self::$PASSWORD, self::$DB);
        if ($_connection->connect_error) {
            die('Errore di connessione (' . $_connection->connect_errno . ') ' . $_connection->connect_error);
        } else {
            echo 'Connesso. ' . $_connection->host_info . PHP_EOL;
        }
        return $_connection;
    }
}