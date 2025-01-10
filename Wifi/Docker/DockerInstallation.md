
# Installing Docker on Pynq Z2
Docker out-of-box allows users to run some simple images to see docker working. 
For PYNQ v2.6 images – copy/paste the steps below to get the helloworld applications running.

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=armhf signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu bionic stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
export CIO_VER=1.2.6-3
export DCE_VER=5:19.03.14~3-0~ubuntu-bionic
sudo apt-get -y install containerd.io=$CIO_VER
sudo apt-get -y install docker-ce=$DCE_VER docker-ce-cli=$DCE_VER

### The Docker daemon not starting?

sudo update-alternatives --config iptables

**You'll see the following**

```bash
There are 2 choices for the alternative iptables (providing /usr/sbin/iptables).

  Selection    Path                       Priority   Status
------------------------------------------------------------
* 0            /usr/sbin/iptables-nft      20        auto mode
  1            /usr/sbin/iptables-legacy   10        manual mode
  2            /usr/sbin/iptables-nft      20        manual mode
```
**Press <enter> to keep the current choice[*], or type selection number: 1**

## Still doesn't work ? Follow the following instructions.

### Check the docker status if it's active, if not start and enable it.
sudo systemctl status docker
sudo systemctl start docker
sudo systemctl enable docker

sudo docker run hello-world

### If you're seeing the following message.
```bash
docker: Error response from daemon: OCI runtime create failed: container_linux.go:345: 
starting container process caused "process_linux.go:281: 
applying cgroup configuration for process caused \"mountpoint for devices not found\"": unknown.
ERRO[0001] error waiting for container: context canceled
```

### Make a device dir.
sudo mkdir -p /sys/fs/cgroup/devices
sudo mount -t cgroup -o devices cgroup /sys/fs/cgroup/devices

### Restart the Container and Docker.
sudo systemctl daemon-reexec
sudo systemctl restart containerd
sudo systemctl restart docker

### Run the docker.
sudo docker run hello-world


## More Information and Sources
https://discuss.pynq.io/t/docker-xilinx-platforms-pynq/1962
https://github.com/PXLDigital/iot-interactive-devices-project/blob/dockerOnPynq/docker/setup_docker_on_pynq.md
https://chatgpt.com/c/675fedff-61c0-8011-a1f6-bdaedd2e40b5