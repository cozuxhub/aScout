#!/bin/bash
#./ascout <ip_address> <output_file> <y/n>
# created by @cozuxhub

clear
echo -e "\033[92m"
echo "aScout v1.0 By @cozuxhub" | figlet -f small

ipaddr=$1
output=$2
verify=$3

if [[ -z "$ipaddr" ]]; then
	echo -e "\n\n\033[1m\033[91mUse: $0 <IP Address> <Output Text File>"
	exit 1
fi

if [[ -z "$output" ]]; then
	echo -e "\n\n\033[1m\033[91mUse: $0 <IP Address> <Output Text File>"
	exit 1
fi

function ping_checker(){
	echo -e "\n\033[1m\033[96mPinging...\n"
	timeout=900 # 15 min
	start_time=$(date +%s)

	while true; do
		current_time=$(date +%s)
		elapsed_time=$((current_time - start_time))

		if [ $elapsed_time -ge $timeout ]; then
			echo -e "\033[1m\033[91mNo ping response was received for 15 minutes. Exiting the script..."
			exit 1
		fi

		ping_result=$(ping -c 3 $ipaddr)
		if [[ $ping_result != *"100% packet loss"* ]]; then
			echo "$ping_result"
			echo -e "\033[1m\033[92mPing response received! Packets were transmitted successfully."
			sleep 2
			clear
			break
		fi

		echo -e "\033[1m\033[93mWaiting for ping response...\n -> Elapsed time: $elapsed_time"
		sleep 5
	done
}

function areconnaissence(){
	echo -e "\033[1m\033[91mActive Reconnaissance involves actively probing a target to gather information, which could potentially pose security risks if done without proper authorization. This process includes scanning networks, identifying vulnerabilities, and gathering intelligence, which, if exploited by malicious actors, could lead to unauthorized access or data breaches.\033[0m\n"
	if [[ $verify != "y" ]]; then
		read -p "Are you sure you want to do 'Active Reconnaissance' to ? (y/n): " verify
	fi
	if [[ $verify == "y" ]]; then
		echo -e "\033[92m"
		echo -e "Active Reconnaissance Initiated!" | figlet -f big
		echo -e "\033[1m\033[91mTarget IP Address: $ipaddr"
		gnome-terminal --geometry=117x25+1000-1000 -- bash -c "echo -e '\033[92m'; dirb http://$ipaddr 2>&1 | tee $output; exec bash"
		gnome-terminal --geometry=117x25+1000+1000 -- bash -c "echo -e '\033[92m'; nmap -A -p- -T4 $ipaddr -oN $output; exec bash"
		gnome-terminal --geometry=117x25+0+0 -- bash -c "echo -e '\033[92m'; nikto -h $ipaddr ; exec bash"
		gnome-terminal --geometry=117x25+0-0 -- bash -c "echo -e '\033[92m'; gobuster dir -u http://$ipaddr/ -w /usr/share/wordlists/dirbuster/directory-list-lowercase-2.3-medium.txt -o $output; exec bash"
	else
		exit 1
	fi
}

ping_checker
areconnaissence

