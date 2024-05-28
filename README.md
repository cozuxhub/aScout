# DOWNLOAD
### First, let's download the script to our Kali Linux using the command `git clone https://github.com/norcholly/ascout.git`, and then grant executable permissions to all users.

![0](https://github.com/norcholly/aScout/assets/152704509/b1d22dfb-0885-4d4d-ae65-e4cce0b47c17)

# USE

### Now that our script is executable, let's write the IP Address of the target system, an argument output.txt to save the outputs, and the speed option, then let's launch our script. `./ascout.sh <ip_address> <output_file>`

![Ekran görüntüsü 2024-05-28 114153](https://github.com/norcholly/aScout/assets/152704509/d7225d2c-ced6-4be2-9a7f-14b22ce1aa0f)

### If the tools used in the script (gnome-terminal and gobuster) are not already installed on the Linux operating system, the script automatically detects this and first installs these tools to the operating system with user permission.

![2](https://github.com/norcholly/aScout/assets/152704509/4877c4e1-37c4-4453-9ad3-09d3bbf91f64)

### Right at this point, since all the actions we're about to take could potentially leave a footprint on the target system and be seen as a security threat, let's give the user a warning.

![3](https://github.com/norcholly/aScout/assets/152704509/dfe4142a-758b-4d4a-9a34-f6918a0b991e)

### If the user agrees to proceed, let's send an ICMP packet to see if we are on the same network as the target machine or if we can communicate with it. 

![4](https://github.com/norcholly/aScout/assets/152704509/750dd1a4-029f-4fda-a262-f24d2f092317)

### If there is no packet loss, the scanning process will start automatically. Sit back and enjoy!

![5](https://github.com/norcholly/aScout/assets/152704509/1f3e7c58-3526-4df4-ae4b-34eebf20e985)

 # ADDITIONAL INFORMATION:

### Only the output of dirbuster and nmap scans will be saved to the output file. This allows you to close the terminals if you wish, or switch to another screen to continue your work there.

### If the IP address is incorrectly entered, you won't receive any results. However, if the IP address is correct but you're not receiving ping responses, there is a waiting period of 15 minutes. If no ping responses are received within this 15-minute period, the script will exit.

### Got it! You can contact me via *@norcholly* on Instagram.
