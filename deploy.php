<?php
	if ($_SERVER['REQUEST_METHOD'] === 'POST') {
		umask(0);
		$file = '/var/www/hooks/deploy_hook'; // Customize location to your liking
		file_put_contents($file, json_encode($_POST, JSON_PRETTY_PRINT));
	}
	// This script relies on a cron job that will check for the existence of a file.
	// Then the cron job will need to pull down the latest changes via git.
?>
