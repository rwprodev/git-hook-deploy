# git-hook-deploy

This is a aimple setup for PHP server to automatically pull down your git repo.

The below scripts can be used a templates for you to get this setup on your own. At a minimum,
you will want to change the variables in the scripts to reflect your environment.


### deploy.php

You need to configure your git web hook to send a POST request to this PHP script whenever
you push changes to a desired branch. All popular git service providors provide this functionality.

All this script does is verify that there is a POST request and then simply create a file.

The next step is to setup a cron job that runs the below shell script.

### check-deploy-hook.sh

This shell script check for the existence of a deploy hook file. If one is found, then it will go into
your websites git repo. It will then perform a `git reset` and `git pull` on your repo. The latest updates
will then get pulled down to your server.

I schedule this job to run every 5 mins via a cron job.

```
*/5 * * * * /home/username/bin/check-deploy-hook.sh
```