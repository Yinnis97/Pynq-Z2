# **Systemd Information**
## 1. What is Systemd?
**Systemd is a suite of tools for managing Linux systems.**  

It is primarily used to:

- Boot and shut down the system.
- Manage system services (start, stop, enable services).
- Handle logging (via journald).

On the PYNQ Z2, systemd ensures essential services, like networking, hardware management, and custom PYNQ services, run properly at startup.
## 2. Key Components of Systemd
### Units    
**A "unit" is the basic building block in systemd.**     
**It represents a resource or service managed by systemd.**

Types of units:
- Service unit (.service): Defines and manages services.          
- Target unit (.target): Groups units together (e.g., multi-user.target for a multi-user system).   
- Device unit (.device): Represents hardware devices.   
- Timer unit (.timer): Schedules tasks.    


## 3. Common Systemd Commands

### Check the Status of a Service
```bash
sudo systemctl status <service_name>
```

### Start/Stop/Restart a Service	
```bash
sudo systemctl start <service_name>	
sudo systemctl stop <service_name>	
sudo systemctl restart <service_name>	
```

### Enable/Disable a Service	
- Enable: Automatically start the service at boot.	
- Disable: Prevent the service from starting at boot.	
```bash
sudo systemctl enable <service_name>
sudo systemctl disable <service_name>
```

### View Logs
- To see all system logs			
```bash
journalctl
```
- For logs of a specific service	
```bash
journalctl -u <service_name>
```
- List All Running Services		
```bash
systemctl list-units --type=service
```