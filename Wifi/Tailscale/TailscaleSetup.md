# **Installing Tailscale on Pynq Z2**


## Installation
Packages are available for x86 and ARM CPUs, in both 32-bit and 64-bit variants.

Add Tailscale's package signing key and repository:

```bash
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/bionic.gpg | sudo apt-key add -
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/bionic.list | sudo tee /etc/apt/sources.list.d/tailscale.list
```

Install Tailscale:

```bash
sudo apt-get update
sudo apt-get install tailscale
```
Connect your machine to your Tailscale network and authenticate in your browser:

```bash
sudo tailscale up
```

You're connected! You can find your Tailscale IPv4 address by running:

```bash
tailscale ip -4
```


## Generating a key.

1.Open the Keys page of the admin console.

2.Select Generate auth key.

3.Fill out the form fields to specify characteristics about the auth key, 
  such as the description, whether its reusable, when it expires, and device settings.

4.The device settings section lets you set special characteristic for the auth key:

5.Enable Ephemeral to automatically remove the auth key after the device goes offline.

6.Enable Pre-approved to automatically authorize pre-sign the auth key if you have device approval enabled for your tailnet.

7.Enable Tags to automatically tags devices that use the auth key.

8.Select Generate key.

**Register a node with the auth key**

```bash
sudo tailscale up --authkey tskey-auth-123456789...
```

## Sources
https://tailscale.com/kb/1037/install-ubuntu-1804
https://login.tailscale.com/admin/settings/keys

