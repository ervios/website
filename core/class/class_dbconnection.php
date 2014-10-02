
<?php

class DBconnection {


		public function connect() {

			$dsn = 'mysql:dbname=vostberg;host=localhost';
			$user = 'vostberg';
			$pass = 'vostberg';

			try {
				return new PDO($dsn, $user, $pass);
			} catch (PDOException $e) {
				echo 'Connection failed: ' . $e->getMessage();
			}
		}

/*
		public static function getInstance() {
			if (!isset(self::$instance)) {
				$obj = __CLASS__;
				self::$instance = new $obj;
			}
			return self::$instance;
		}
		*/
}

?>