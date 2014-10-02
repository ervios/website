<?php

	require 'connect.init.php';

	include 'query_team.php';
	
	$teams = new Team;
	$teams->getAllTeams();
	$teams->getTeamJersey();
?>