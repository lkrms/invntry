<?php

// define application root
if ( ! defined("APP_ROOT"))
{
    define("APP_ROOT", dirname(__file__));
}

// load application configuration
foreach (glob(APP_ROOT . "/config/*.php") as $configFile)
{
    if ( ! preg_match('/\.default\.php$/', $configFile))
    {
        require_once ($configFile);
    }
}

// load Juju framework
require_once (JJ_ROOT . "/core.php");

?>