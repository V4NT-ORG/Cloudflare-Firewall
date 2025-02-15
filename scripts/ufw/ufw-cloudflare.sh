#!/usr/bin/env bash

#########################################################
# This step removes all old public rules before add new #
#########################################################

# Removing IPv4 and IPv6 HTTP rules in UFW
while true; do
	i=$(sudo ufw status numbered | grep -m1 '80' | awk -F"[][]" '{print $2}')
	if ! [ -z "$i" ]; then
		echo "Removing http rule"
        	sudo ufw --force delete $i
	else
		break
	fi
done

# Removing IPv4 and IPv6 HTTPS rules in UFW
while true; do
	i=$(sudo ufw status numbered | grep -m1 '443' | awk -F"[][]" '{print $2}')
	if ! [ -z "$i" ]; then
		echo "Removing https rule"
		sudo ufw --force delete $i
	else
		break
	fi
done

##########################################################################################################
# This step adds new rules to the UFW firewall that provide access via HTTP and HTTPS for Cloudflare IPs #
##########################################################################################################

# Adding new IPv4-6 HTTP rules in UFW
echo "Getting new Cloudflare IPs for IPv4 and IPv6 for HTTP rules"
for i in `curl -sw '\n' https://www.cloudflare.com/ips-v{4,6}`; do
    echo "The new IP address will be added to the UFW firewall for HTTP rule: '$i'"
    sudo ufw allow proto tcp from $i to any port http comment 'Cloudflare IP'
done

# Adding new IPv4-6 HTTPS rules in UFW
echo "Getting new Cloudflare IPs for IPv4 and IPv6 for HTTPS rules"
for i in `curl -sw '\n' https://www.cloudflare.com/ips-v{4,6}`; do
    echo "The new IP address will be added to the UFW firewall for HTTP rule: '$i'"
    sudo ufw allow proto tcp from $i to any port https comment 'Cloudflare IP'
done
