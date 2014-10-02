<?php

	//$root = realpath($_SERVER["DOCUMENT_ROOT"]);
	include ("./master_include.php");

	function init() {
		session_start();
		if (!isset($_GET['page'])) {
			$_GET['page'] = "start";
		}	
	}

	function getStart() {

	}

	function getMatchResults($division) {

		$mresult = new MatchResult();
		$mtpl = new Template('tpl_matchresult');
		
			switch ($division) {
			case 'w':
				echo "Damer";
				break;
			case 'mdiv_one':
				echo "Herrar 1";
				break;
			case 'mdiv_two':
				echo "Herrar 2";
				break;
			case 'standard':
				$mresult = $mresult->getAllMatchResults();
				break;
			}

		$_SESSION['matches'] = $mresult;
		$mtpl->render($_SESSION['matches']);
	
	}

	function getScoreBoard($division) {

		//$sresult = new ScoreBoard();
		//$stpl = new Template('tpl_scoreboard');
		
			switch ($division) {
			case 'w':
				echo "Damer";
				break;
			case 'mdiv_one':
				echo "Herrar 1";
				break;
			case 'mdiv_two':
				echo "Herrar 2";
				break;
			case 'standard':
				echo "Alla Skytteligor";
				//$sresult = $sresult->getAllScoreBoards();
				break;
			}
		//$_SESSION['scores'] = $sresult;
		//$stpl->render(1,$_SESSION['matches']);
	
	}

	function getTeams() {
		$tpl = new Template('tpl_laglista');
		
	}

	function getYourTeam($loadcontent) {
		
		$user = new User();
		$status = $user->logged_in();

		if ($loadcontent == 'changepass') {
			
			if ($status == false) {
				header('Location: index.php?page=start');
				exit();
			} else {
				$tplchoice = 'tpl_changepass';
				checkUserStatus($user, $status, $tplchoice);

				$user->change_password();
			}
	
		} else {
			$tplchoice = 'tpl_loggedin';
			checkUserStatus($user, $status, $tplchoice);
		}

		
		//$user->change_password();
		
	
	}


	function getInfo() {
	
	}

?>