#! /bin/bash
# ./ascout <ip_address> <output_file> <y/n>
# created by @cozuxhub

clear
echo -e "\033[92m"
echo "aScout v1.1 By @cozuxhub" | figlet -f small

# Let's assign the entered arguments to variables.
ipaddr=$1
output=$2
verify=$3

# Exit the script if the arguments are not entered correctly, and prompt the user to run the script again.
if [[ -z "$ipaddr" ]]; then
	echo -e "\n\033[1m\033[91mUse: $0 <IP Address> <Output Text File>\n\n\n"
	exit 1
fi

if [[ -z "$output" ]]; then
	echo -e "\n\033[1m\033[91mUse: $0 <IP Address> <Output Text File>\n\n\n"
	exit 1
fi

# Let's first check if we can communicate with the target.
function ping_checker(){
	echo -e "\n\033[1m\033[96m[\033[0m1\033[96m\033[1m] \033[93mICMP packets are being sent to the target. Please wait...\n\033[0m"
	# Let the fifteen-minute timer begin.
	timeout=900 # 15 min
	start_time=$(date +%s)
	packet_number=2

	while true; do
		# Let's calculate the elapsed time by subtracting the time the counter started from the current time.
		current_time=$(date +%s)
		elapsed_time=$((current_time - start_time))

		# If the elapsed time exceeds fifteen minutes, the script ends aas it indicates there is no communication with the target
		if [ $elapsed_time -ge $timeout ]; then
			echo -e "\033[1m\033[96m[\033[0mX\033[1m\033[96m] \033[91mNo ping response was received for 15 minutes. Exiting the script..."
			exit 1
		fi

		# Let's send three ICMP packets to the entered target IP address to measure if we can communicate with it.
		ping_result=$(ping -c 3 $ipaddr)
		ping -c 3 $ipaddr
		if [[ $ping_result != *"100% packet loss"* ]]; then
			echo "$ping_result"
			echo -e "\n\033[1m\033[96m[\033[0m✓\033[1m\033[96m] \033[1m\033[92mPing response received! Packets were transmitted successfully."
			sleep 2
			clear
			break
			# If there was no loss in any of the three ICMP packets sent, our communication with the target is strong. Let's terminate the while.
		fi

		echo -e "\n\033[1m\033[96m[\033[0m$packet_number\033[1m\033[96m] \033[93mWaiting for ping response...\n -> Elapsed time: $elapsed_time\033[0m\n"
		sleep 4
		((packet_number++))
	done
}

function areconnaissence(){
	# Let's remind the user that Active Reconnaissance will establish communication with the target again. If the user wants to skip this step, they can add the letter "y" as the third argument.
	echo -e "\033[1m\033[91m\033[3mActive Reconnaissance involves actively probing a target to gather information, which could potentially pose security risks if done without proper authorization. This process includes scanning networks, identifying vulnerabilities, and gathering intelligence, which, if exploited by malicious actors, could lead to unauthorized access or data breaches.\033[0m\n"
	if [[ $verify != "y" ]]; then
		read -p "Are you sure you want to do 'Active Reconnaissance' to ? (y/n): " verify
		verify=$(echo "$verify" | tr '[:upper:]' '[:lower:]')
	fi
	if [[ $verify == "y" ]]; then
		echo -e "\033[91m"
		echo -e "Target: $ipaddr" | figlet -f small
		echo -e "@cozuxhub" | figlet -f small
		sleep 2

		# At this point, let's open four separate terminals and run different active scanning tools in each terminal.
		gnome-terminal --geometry=117x25+1000-1000 -- bash -c "echo -e '\033[1m'; dirb http://$ipaddr 2>&1 | tee $output; exec bash"
		gnome-terminal --geometry=117x25+1000+1000 -- bash -c "echo -e '\033[1m'; nmap -A -p- -T4 $ipaddr -oN $output; exec bash"
		gnome-terminal --geometry=117x25+0+0 -- bash -c "echo -e '\033[1m'; nikto -h $ipaddr ; exec bash"
		gnome-terminal --geometry=117x25+0-0 -- bash -c "echo -e '\033[1m'; gobuster dir -u http://$ipaddr/ -w /usr/share/wordlists/dirbuster/directory-list-lowercase-2.3-medium.txt -x php,txt,html -o $output; exec bash"
	else
		exit 1
	fi
}

ping_checker
areconnaissence
