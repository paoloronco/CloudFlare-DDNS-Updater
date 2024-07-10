# CloudFlare-DDNS-AutoUpdater

CloudFlare-DDNS-AutoUpdater is a tool designed to automatically update your DNS records with your current public IPv4 address, making it especially useful if you do not have a static IPv4 address. This tool is perfect for maintaining a consistent DNS entry for your dynamic IP, ensuring that services like VPNs can reliably connect to your home network.

## Overview

I personally use this tool to manage a VPN with WireGuard on a Proxmox server, allowing me to access my HomeLab remotely. It updates the public IP address in CloudFlare, enabling seamless connectivity to your server from outside your home network.

## Features

- Automatically updates your DNS records with your current public IP address.
- Ensures secure and reliable access to your home server or other network resources.
- Ideal for dynamic IP environments.

## Requirements

- A domain name managed by CloudFlare.
- A server running Linux.

## Installation and Setup

Follow these steps to set up and use CloudFlare-DDNS-AutoUpdater:

1. **Register a Domain**: Obtain a domain name of your choice.
2. **Connect to CloudFlare**: Link your domain to CloudFlare.
3. **Create a DNS Record**:
   - Go to the DNS settings in CloudFlare.
   - Add an A record with the following details:
     - **Name**: Choose a name (this will be your subdomain).
     - **TTL**: Auto.
     - **IP Address**: 0.0.0.0 (this will be updated automatically).

4. **Clone the Repository**:
   ```sh
   git clone https://github.com/paoloronco/CloudFlare-DDNS-Updater.git

5. **Navigate to the Directory:**:
   ```sh
   cd CloudFlare-DDNS-Updater

6. **Copy the Template Script:**:
    ```sh
   cp updater-template.sh updater-YOUR-NAME.sh

7. **Edit the Script:**:
    ```sh
   nano updater-YOUR-NAME.sh

    Update the following variables in the script:
       auth_email: Your CloudFlare login email.
       auth_method: Set to "global".
       auth_key: Your CloudFlare API key. (See instructions below to obtain it.)
       zone_identifier: Your CloudFlare Zone ID. (See instructions below to obtain it.)
       record_name: The subdomain you created, e.g., subdomain.your-domain.net.
       ttl: Set to 3600.

    Save and exit the editor:
       Press Control + S to save.
       Press Control + X to exit.

8. **Make sure that the script is executable**:
    ```sh
   chmod +x updater-YOUR-NAME.sh

9. **Run the Script**:
   ```sh
   ```sh


## Obtaining CloudFlare API Key and Zone ID

    API Key:
        Log in to CloudFlare.
        Go to your account settings.
        Scroll down to the "API Key" section.
        Click "View" next to "Global API Key" and copy it.

    Zone ID:
        Go to the dashboard for your domain.
        The Zone ID is displayed on the right side under "API".

## Check Your Public IP

To verify your public IP address, visit whatismyip.com.
Donate

## If you find this tool useful, consider making a donation to support its development:

    Donate via PayPal
    Bitcoin Address: YOUR_BITCOIN_ADDRESS
