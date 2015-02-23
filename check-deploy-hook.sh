#!/bin/bash

# ----------------------------------------------------
# This is a cron job that should be ran to check
# for the deploy_hook file. If it exists, the git
# repo will be pulled down.
# ----------------------------------------------------

HOOK='/var/www/hooks/deploy_hook'
LOG='/var/log/deploy-refresh.log'
WEBSITE='/var/www/my-website-dir'

if [ -f $HOOK ]; then
    mv $HOOK $HOOK.`date +"%Y%m%d-%H%M%S"`
	cd $WEBSITE
	/usr/bin/git reset --hard HEAD > $LOG
	/usr/bin/git pull >> $LOG
fi