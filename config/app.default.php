<?php

// where is Juju?
define("JJ_ROOT", realpath(APP_ROOT . "/../juju"));

// schemas, class maps
$JJ_NAMESPACES  = array("inv" => APP_ROOT . "/classes");
$JJ_SCHEMAS     = array( array(APP_ROOT . "/invntry.schema.yml", null));

// PRETTY_NESTED_ARRAYS,0

?>