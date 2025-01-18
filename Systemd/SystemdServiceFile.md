# **How to create a systemd Service file (With Timer)**

## 1. Create the Systemd Service File
**First, create a systemd service that pulls and runs the Docker container. This will be executed by the timer.**

- Navigate to /etc/systemd/system/:

    ```bash
    cd /etc/systemd/system/
    ```
- Create the service file (e.g., pynq-docker.service):

    ```bash
    sudo nano pynq-docker.service
    ```
- Add the following content:

    ```bash
    [Unit]
    Description=Pull and Run Pynq Docker Container
    After=network.target docker.service
    Requires=docker.service

    [Service]
    Type=oneshot
    ExecStartPre=/usr/bin/docker pull ghcr.io/yinnis97/pynq-z2:main
    ExecStart=/usr/bin/docker run --rm ghcr.io/yinnis97/pynq-z2:main
    StandardOutput=append:/var/log/pynq-docker.log
    StandardError=append:/var/log/pynq-docker.log
    ```

    Explanation:
    - This service does the same as before: it pulls the Docker image and runs the container once.
    - **StandardOutput=append:/var/log/pynq-docker.log:** Appends standard output (e.g., print statements from example_script.py) to the specified log file.
    - **StandardError=append:/var/log/pynq-docker.log:** Appends error messages to the same log file.  

    View the log file:
    ```bash
    cat /var/log/pynq-docker.log
    ```

- Save and exit the file (CTRL+O, then CTRL+X).

## 2. Create a Systemd Timer
**Now, create a timer to trigger the service every 30 minutes.**

- Create a timer file (e.g., pynq-docker.timer):

```bash
sudo nano pynq-docker.timer
```
- Add the following content:

```bash
[Unit]
Description=Run Pynq Docker Service Every 30 Minutes

[Timer]
OnBootSec=5min
OnUnitActiveSec=30min
Unit=pynq-docker.service

[Install]
WantedBy=timers.target
```
- Explanation:    
    - OnBootSec=5min: Waits 5 minutes after boot before running the service for the first time.   
    - OnUnitActiveSec=30min: Runs the service 30 minutes after the last execution.    
    - Unit=pynq-docker.service: Specifies the service that the timer will execute.    

- Save and exit the file.

## 3. Reload Systemd and Enable the Timer
**Now you need to reload systemd and enable the timer:**

- Reload systemd to recognize the new timer
```bash
sudo systemctl daemon-reload
```
- Enable the timer to start on boot
```bash
sudo systemctl enable pynq-docker.timer
```
- Start the timer immediately
```bash
sudo systemctl start pynq-docker.timer
```

## 4. Check the Timer
**You can check if the timer is active and when it will run next:**

- Check timer status
```bash
sudo systemctl list-timers
```
- Or check the specific timer
```bash
sudo systemctl status pynq-docker.timer
```
The output will show the last and next activation times for the timer.

## 5. Logs and Debugging
**If you want to debug or check the logs:**

- Check the service logs:
```bash
sudo journalctl -u pynq-docker.service
```
- Check the timer logs:
```bash
sudo journalctl -u pynq-docker.timer
```