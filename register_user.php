<?php

require ("master_include.php");

include_once ("./includes/overall/overall.header.php");

	
	$reg_user = new User();
	$reg = new Register();
	$rttpl = new Template('form_registerteam');
	$result = register($rttpl, $reg, $reg_user);

	$_SESSION['regerrors'] = $result;
	$rttpl->render($_SESSION['regerrors']);
				
		if (empty($_SESSION['regerrors'])) {
			
			if (!empty($_POST)) {
				$register_data = array(
					'div_id' 		=> $_POST['div_id'],
					'teamname' 		=> $_POST['teamname'],
					'regusername' 	=> $_POST['regusername'],
					'regpassword' 	=> $_POST['regpassword'],
					'firstname' 	=> $_POST['firstname'],
					'surname' 		=> $_POST['surname'],
					'email' 		=> $_POST['email'],
					'phonenr' 		=> $_POST['phonenr'],
				);
				$teamreg = $reg->register_team($register_data);
			}
		}
		
		if (isset($_SESSION['ok'])) {
			if ($_SESSION['ok'] = true) {
				$tpl = new Template('tpl_register');
				$tpl->render($_SESSION['ok']);
				//header('Location: index.php');
				exit();
			}
		}
		
	include_once ("./includes/overall/overall.footer.php");
?>