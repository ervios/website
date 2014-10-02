
<?php

class LoginCheck {

	private $user;
	private $username;
	private $password;
	private $user_id;

	public function login_input($user) {

		$ERROR_MESSAGE = array();
		$this->user = $user;
		
		if (empty($_POST) === false) {
			$this->username = $_POST['username'];
			$this->password = $_POST['password'];

			if (empty($this->username) === true || empty($this->password) === true) {
				$ERROR_MESSAGE[] = 'Du måst juh fyll i användarnamn och lösenord - int går det annars inga! :-]';
			}
			else if ($this->user->user_exists($this->username) === false) {
				$ERROR_MESSAGE[] = 'Hördöö hitta inga den där användarn :-/';
			}
			else if ($this->user->user_activated($this->username) === false) {
				$ERROR_MESSAGE[] = 'Not activated';
			}
			else {
				
				$checklogin = $this->user->login($this->username, $this->password);

				if ($checklogin === false) {
					$ERROR_MESSAGE[] = 'Fel användarnamn/lösenord :-[';
				}
				else {
					//store session id
					$_SESSION['user_id'] = $checklogin;
					header('Location: index.php?page=dittlag');
					exit();
				}
			}
		}
	}
}

?>