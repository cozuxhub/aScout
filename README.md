# USE
### First, let's download the repository to our Kali Linux using the command `git clone https://github.com/cozuxhub/ascout.git`, and then grant executable permissions to all users.

![Ekran görüntüsü 2024-05-05 015601](https://github.com/cozuxhub/ascout/assets/152704509/833aab7c-eba9-4d7d-8b42-694a98f12965)


### Now that our script is executable, let's write the IP Address of the target system and an argument output.txt to save the outputs, then let's launch our script. `./ascout.sh <ip_address> <output_file>`

![Ekran görüntüsü 2024-05-05 015620](https://github.com/cozuxhub/ascout/assets/152704509/253a8a2e-75db-4ca3-9a84-99000b6d0164)

### Let's send three pings to confirm that we are on the same network as our target and that we can communicate with it. If we receive responses, our script should continue running.

![Ekran görüntüsü 2024-05-05 015636](https://github.com/cozuxhub/ascout/assets/152704509/3de563ed-2ef6-4ed0-8306-c7ff5245896e)

### Right at this point, since all the actions we're about to take could potentially leave a footprint on the target system and be seen as a security threat, let's give the user a final warning.

![Ekran görüntüsü 2024-05-05 015903](https://github.com/cozuxhub/ascout/assets/152704509/f0b9bff7-8c67-408a-bf13-4ebcfd6380f8)

### If the user agrees to proceed, we'll start the scanning process.

 ![Ekran görüntüsü 2024-05-05 015837](https://github.com/cozuxhub/ascout/assets/152704509/4b7297d3-3706-4673-9596-70408c4b4106)

 # ADDITIONAL INFORMATION:

### Only the output of dirbuster and nmap scans will be saved to the output file. This allows you to close the terminals if you wish, or switch to another screen to continue your work there.

### If the IP address is incorrectly entered, you won't receive any results. However, if the IP address is correct but you're not receiving ping responses, there is a waiting period of 15 minutes. If no ping responses are received within this 15-minute period, the script will exit.

### Got it! You can contact me via *@norcholly* on Instagram.
