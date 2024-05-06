# DOWNLOAD
### First, let's download the script to our Kali Linux using the command `git clone https://github.com/cozuxhub/ascout.git`, and then grant executable permissions to all users.

![Ekran görüntüsü 2024-05-05 015601](https://github.com/cozuxhub/ascout/assets/152704509/833aab7c-eba9-4d7d-8b42-694a98f12965)

# USE

### Now that our script is executable, let's write the IP Address of the target system and an argument output.txt to save the outputs, then let's launch our script. `./ascout.sh <ip_address> <output_file>`

![Ekran görüntüsü 2024-05-05 015620](https://github.com/cozuxhub/ascout/assets/152704509/253a8a2e-75db-4ca3-9a84-99000b6d0164)

### Let's send three ICMP packet to confirm that we are on the same network as our target and that we can communicate with it. If we receive responses, our script should continue running.

![Ekran görüntüsü 2024-05-06 191321](https://github.com/cozuxhub/aScout/assets/152704509/fa2e7f91-eeae-4a24-8164-7f8ad95e19a8)

### Right at this point, since all the actions we're about to take could potentially leave a footprint on the target system and be seen as a security threat, let's give the user a final warning.

![Ekran görüntüsü 2024-05-06 191428](https://github.com/cozuxhub/aScout/assets/152704509/7ffe12dd-7fbb-48ad-983b-d97ecf54f424)

### If the user agrees to proceed, we'll start the scanning process.

![Ekran görüntüsü 2024-05-06 191446](https://github.com/cozuxhub/aScout/assets/152704509/745a7764-3f92-452a-8d16-2ea7b187f927)

 # ADDITIONAL INFORMATION:

### Only the output of dirbuster and nmap scans will be saved to the output file. This allows you to close the terminals if you wish, or switch to another screen to continue your work there.

### If the IP address is incorrectly entered, you won't receive any results. However, if the IP address is correct but you're not receiving ping responses, there is a waiting period of 15 minutes. If no ping responses are received within this 15-minute period, the script will exit.

### Got it! You can contact me via *@norcholly* on Instagram.
