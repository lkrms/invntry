<?php

/**
 * Invntry settings.
 *
 * @package invntry
 * @author Luke Arms <luke@arms.to>
 * @copyright Copyright (c) 2015 Luke Arms
 */

// type of database to connect to ("mysql", "mssql", "sqlite" or "pgsql")
define("JJ_DB_TYPE", "mysql");

// hostname or IP address of database server
define("JJ_DB_HOST", "localhost");

// name of database
define("JJ_DB_DATABASE", "invntry");

// database username
define("JJ_DB_USERNAME", "invntry");

// database password
define("JJ_DB_PASSWORD", "1nvn+rY");

// prefix to use for table names
define("JJ_DB_PREFIX", "");

// timezone to use if no user-specific timezone is set
define("JJ_DEFAULT_TIMEZONE", "Australia/Sydney");

// schemas, class maps
$JJ_SCHEMAS    = array( array(APP_ROOT . "/invntry.schema.yml", null));
$JJ_CLASS_MAP  = array("inv" => APP_ROOT . "/classes");

// PRETTY_NESTED_ARRAYS,0

?>