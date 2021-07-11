# valheim discord webhook
A rudimentary (read: works, but coded poorly) powershell script that monitors Valheim's server log file for login, logout and death events and pushes them to a discord channel via webhook. I made this because while there seemed to be proper full-on bots etc that relied on the use of mods, or were written in Bash, I couldn't find anything for Windows that would allow me to have some of this more basic functionality on vanilla Valheim. 

In order to use it, you need to modify the log file locations to reflect your server's log file location, and edit the webhookUri value to reflect the Discord channel webhook URL you want it to post to.  That's it. Then just run it and leave it running and it should work. 
