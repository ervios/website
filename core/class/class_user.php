<?php 

	//$root = realpath($_SERVER["DOCUMENT_ROOT"]);
	//require_once ("./core/class/class_dbconnection.php");

	class User {

		private $db;

		public function __construct() {

			$this->db = new DBconnection();
			$this->db = $this->db->connect();
		}

		public function user_count() {

			$sql = "SELECT COUNT(`user_id`) FROM `users` WHERE `active` = 1";
			$sqlquery = $this->db->prepare($sql);
			$_POST['reggedusers'] = $sqlquery->execute();
			return $_POST['reggedusers'];
		}

		public function user_exists($username) {

			$sql = "SELECT COUNT(`user_id`) FROM `users` WHERE `username` = '$username'";
			$sqlquery = $this->db->prepare($sql);
			$sqlquery->execute();

			return ($sqlquery->fetchColumn() == 1) ? true : false;
		}

		public function user_activated($username) {

			$sql = "SELECT COUNT(`user_id`) FROM `users` WHERE `username` = '$username' AND `active` = 0";
			$sqlquery = $this->db->prepare($sql);
			$sqlquery->execute();

			return ($sqlquery->fetchColumn() == 1) ? true : false;
		}

		public function login($username, $password) {

			if (!empty($username) && !empty($password)) {

				$user_id = $this->check_userID($username);
				$password = md5($password);
				$sql = "SELECT `user_id` FROM `users` WHERE `username` = ? AND `password` = ?";
				$sqlquery = $this->db->prepare($sql);
				$sqlquery->bindParam(1, $username);
				$sqlquery->bindParam(2, $password);
				$sqlquery->execute();

				if ($sqlquery->rowCount() == 1) {

					return $user_id;
				}
				else {
					return false;
				}
			}
		
			
		}

		public function check_userID($username) {

			$sql = "SELECT `user_id` FROM `users` WHERE `username` = ?";
			$sqlquery = $this->db->prepare($sql);
			$sqlquery->bindParam(1, $username);
			$sqlquery->execute();
			$result = $sqlquery->fetch();
			$user_id = $result['user_id'] ;
			
			return $user_id;
			
			
		}

		//check session
		public function logged_in() {
			return (isset($_SESSION['user_id'])) ? true : false;
		}

		public function user_data($user_id)  {

			$user_id = (int)$user_id;
			$sql = "SELECT `username` FROM `users` WHERE `user_id` = '$user_id'";
			$sqlquery = $this->db->prepare($sql);
			$sqlquery->execute();

			return $sqlquery->fetch(PDO::FETCH_ASSOC);
		}

		public function change_password() {

			echo $_POST['current_password'];
			echo $_POST['new_password'];
			echo $_POST['new_passwordagain'];


			if (empty($_POST) === false){
				$required_fields = array('current_password', 'new_password', 'new_passwordagain');
				
				foreach ($_POST as $key=>$value) {
					if (empty($value) && in_array($key, $required_fields) === true) {
						$errors[] = 'Svårt och ändra lösenord utan att ha någon information :-]';
						break 1;
					}
				}

				if (md5($_POST['current_password']) === $user_data['password']) {
					echo "OK";
				} else {
					echo "nej";
				}

			}
		}
		

	}
?>