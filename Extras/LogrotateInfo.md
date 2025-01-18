# **Using logrotate to Manage log files**

- logrotate is a powerful tool to manage log files. 
- It can rotate (rename and archive) logs, compress old logs, and delete older logs when they exceed a certain age or size.
- Here’s how you can set up logrotate for your pynq-docker.log :

## 1. Create a Logrotate Configuration File

- Open the configuration file:
	```bash
	sudo nano /etc/logrotate.d/pynq-docker
	```
- Add the following content:
	```bash
	/var/log/pynq-docker.log {
		hourly
		missingok
		notifempty
		su xilinx xilinx
		copytruncate
	}
	```
	Explenation :
    - **hourly** 			:	Rotate every hour.
    - **missingok** 		:	Don't fail if the log file is missing.
    - **notifempty** 		:	Don't rotate if the log is empty.
    - **su xilinx xilinx** 	:	Run as the xilinx user and group.
    - **copytruncate** 		:	Truncate the log file after copying its contents.
	
## 2. Test the Configuration
**To ensure your configuration works properly, manually test it.**

- Run the following command to simulate log rotation:

	```bash
	sudo logrotate -d /etc/logrotate.d/pynq-docker
	```
	- The -d option enables debug mode (no changes are made, only shows what would happen).
	- Look for any errors or warnings in the output.
	
- If everything looks good, run the rotation:

	```bash
	sudo logrotate -f /etc/logrotate.d/pynq-docker
	```
	- The -f option forces an immediate rotation.
	
## 3. Automate Log Rotation
**logrotate is typically run automatically by the system once a day via cron.**
**You don’t need to set it up manually unless your system is misconfigured.**

- To check if logrotate is set up:
	```bash
	sudo systemctl status logrotate.timer
	```
	- You should see output indicating that the timer is active and enabled.

- If it’s not enabled, you can start and enable it:
	```bash
	sudo systemctl start logrotate.timer
	sudo systemctl enable logrotate.timer
	```