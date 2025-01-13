# SSH Guide

## Logging into the PYNQ Board Using SSH

### Steps to log in using powershell
1. Start the SSH session:
   
   ```bash
   ssh xilinx@<yourPynqIP>
   ```
   Replace `<yourPynqIP>` with the IP address of your PYNQ board.

2. When prompted with the following message:

   ```
   Are you sure you want to continue connecting (yes/no/[fingerprint])?
   ```

   Enter:

   ```
   yes
   ```

3. Enter the password when prompted. The default password for the PYNQ board is:

   ```
   xilinx
   ```

4. You should now be logged in to the PYNQ board via SSH.

---

If you follow these steps and still encounter issues, double-check your network settings and ensure the PYNQ board is powered on and properly connected to the network.




## Troubleshooting SSH Access

If UART seems to be working fine but you can't log in using SSH, there's a high chance (as was the case for me) that your SSH service is inactive. Follow these steps to resolve the issue:

### 1. Check if the SSH service is running
Run the following command:

```bash
sudo systemctl status ssh
```

### 2. If the service is inactive
Start the service using:

```bash
sudo systemctl start ssh
```

Enable the service to start automatically on boot:

```bash
sudo systemctl enable ssh
```

### 3. Verify the SSH service status
Check the status again to confirm it is running:

```bash
sudo systemctl status ssh
```
If it's showing :
```bash
Active : active (running)
```

You are good to go and your SSH service is active.
You should now be able to log in using SSH.  

### 4. Other problems

**If you're still experiencing issues, there may be another underlying problem.**  
1. Make sure your SSH service is listening on the correct IP that you're using to log in.   
2. If you're sharing your network from your PC/Laptop, try resharing it. (Turn sharing off and back on) 


### 5. Still stuck
If you're still unable to resolve the issue or connect, there might be an underlying problem that hasn't been addressed yet.
All the issues I've personally encountered are documented here. 
If your specific problem isn't listed, I recommend looking it up online or consulting someone with more experience for guidance.

