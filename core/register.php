<?php

function register($rttpl, $reg, $reg_user) {

	$required_fields = array();
	$errors = array();

	if (empty($_POST) === false) {

		$required_fields = array('div_id', 'teamname', 'regusername', 'regpassword', 'regpassword_again','firstname', 'surname', 'email', 'phonenr');
		
		foreach ($_POST as $key=>$value) {
			if (empty($value) && in_array($key, $required_fields) === true ) {
				$errors[] = 'Fyll i allting så är du snäll :-]';
				break 1;
			}
		}

		if (empty($errors) === true) {

			if ($reg_user->user_exists($_POST['regusername']) === true) {
				$errors[] = 'Användarnamnet: \'' . $_POST['regusername'] . '\' finns redan registrerat - välj ett nytt';
			}
			if (preg_match('/[\s]+/', $_POST['regusername']) == true) {
				$errors[] = 'Du får inte ha mellanrum i användarnamnet';
			}
			if (strlen($_POST['regusername']) < 3) {
				$errors[] = 'Användarnamnet måste vara över 3 tecken långt';
			}
			if (strlen($_POST['regpassword']) < 6 ) {
				$errors[] = 'Lösenordet måste vara över 6 tecken långt ;-]';
			}
			if ($_POST['regpassword'] != $_POST['regpassword_again']) {
				$errors[] = 'Lösenorden du skrev in matchade inte varandra ;-]';
			}
			if (filter_var($_POST['email'], FILTER_VALIDATE_EMAIL) === false) {
				$errors[] = 'Din email måste juh existera också :-]';
			}
			if ($reg->email_exists($_POST['email']) === true) {
				$errors[] = 'Den emailadressen finns redan registrerad i databasen :/';
			}
			/*
			if( !preg_match("/^([1]-)?[0-9]{3}-[0-9]{3}-[0-9]{4}$/i", $_POST['phonenr']) ) { 
	    		$errors[] = 'Ett giltigt telefonnr. så underlättar :-]';
			}
			*/
		}
		
	} 
	return $errors;		
}
		

	

?>