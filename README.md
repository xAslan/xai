# xai-service

For running an XAI sentry node via CLI as a service

this reposity will help you set up a service so that the xai 
process automatically starts on reboot of your machine

It will create a screen session called xai and pass in the necessary commands
to the sentry-node cli to start your sentry node and leave in running 
in a detached state that you can later connect to and verify it is still running

## Prereqs

download and unzip the  sentry node cli to a directory like `/home/myname/xai/`

*instructions can be found at 
[XAI](https://xai-foundation.gitbook.io/xai-network/xai-blockchain/sentry-node-purchase-and-setup/step-2-download-and-run-the-xai-sentry-node) for setting this up*

after this your sentry node cli should be at `/home/myname/xai/sentry-node-cli-linux`

## Create the xai startup script

copy `start-xai-sentry.sh` from this repo to your `/xai/` folder

**In this step you enter your private key, so make sure this machine is secure**

open up the `start-xai-sentry.sh` script with nano or some editor  
add in your private key  
update the directory where your `sentry-node-cli-linux` script lives  
e.g. edit with `nano /home/myname/xai/start-xai-sentry.sh`  
save and exit the file (Ctrl + o, Enter,  Ctrl + x if using nano)

finally save and exit the file then make the script executable with  
`chmod +x start-xai-sentry.sh`

You can stop here if you just want script to start the xai service.  
The service can be started by executing the `/home/myname/xai/start-xai-sentry.sh`

## Create the Service

now copy the service into `/etc/systemd/system/xai-sentry.servce`  
you will probably need to use sudo. You can create the file and copy the contents with  
`sudo nano /etc/systemd/system/xai-sentry.servce`
then paste the contents
update the diretory path and replace `mynamme` with your user
finally, save and close the file 

Now everything is in place
Reload the systemd services with
`sudo systemctl daemon-reload`
then you can start the service with
`sudo systemctl start xai-sentry.service`
or reboot your machine

If you want to check on your xai process you can attach to the screen with:  
`screen -r xai`

to detach again:  
Ctrl + a, then d
