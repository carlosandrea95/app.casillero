<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
date_default_timezone_set('America/Caracas');
define('DS', DIRECTORY_SEPARATOR);
define('HostRoot', realpath('..') . DS);
define('WebRoot', realpath(dirname(__FILE__)) . DS);
require_once WebRoot . 'core' . DS . 'autoload.php';

try {
    CSession::init();
    new CBoot(new CRequest);
} catch (Exception $e) {
    echo $e->getMessage();
}
