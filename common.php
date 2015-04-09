<?php

// define application root
if ( ! defined("APP_ROOT"))
{
    define("APP_ROOT", dirname(__file__));
}

// define Juju framework root
if ( ! defined("JJ_ROOT"))
{
    define("JJ_ROOT", realpath(APP_ROOT . "/../juju"));
}

// load application settings
require_once (APP_ROOT . "/config.php");

// load Juju framework
require_once (JJ_ROOT . "/core.php");

?>