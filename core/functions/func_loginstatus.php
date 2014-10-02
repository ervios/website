<?php


 function checkUserStatus($user, $status, $tplchoice) {
	
		switch ($status) {

			case false:
				include ("./templates/tpl_login_or_register.tpl");
				$login = new LoginCheck();
				$loginCheck = $login->login_input($user);
				break;
			case true:
				$tpl = new Template($tplchoice);
				$current_session_user_id = $_SESSION['user_id'];
				$array = $user->user_data($current_session_user_id, 'username', 'first_name', 'email');

				$tpl->assign('NAME', $array['username']);
				$_SESSION['username'] = $array;
				//ban user
				if ($user->user_activated($array['username']) === false) {
					session_destroy();
					header('Location: index.php');
					exit();
				}
				$tpl->show_contents();
				break;
		}
	}


?>