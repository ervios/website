<?php 

	$root = realpath($_SERVER["DOCUMENT_ROOT"]);
	require_once ("./core/class/class_matchresult.php");
	require_once ("./core/class/class_template.php");
	require_once ("./core/class/class_logincheck.php");
	require_once ("./core/class/class_user.php");
	//include_once ("./core/class/class_register.php");

	include_once ("./core/functions/func_loginstatus.php"); 
	
	//include_once ("./core/register.php");

require_once ("./core/class/class_dbconnection.php");
require_once ("./core/class/class_user.php");
require_once ("./core/class/class_register.php");
require_once ("./core/class/class_template.php");
require_once ("./core/register.php");

?>