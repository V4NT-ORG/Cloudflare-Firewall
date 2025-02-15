#!/usr/bin/env bash

#########################################################
# This step removes all old public rules before add new #
#########################################################

IFS=$'\n'
for i in $(sudo firewall-cmd --list-rich-rules --zone=public); do
        echo "This rule will be removing '$i'"
        sudo firewall-cmd --permanent --zone=public --remove-rich-rule "$i"
done

######################################################################################################################
# This step adds new rules to the public zone in FirewallD that provide access via HTTP and HTTPS for Cloudflare IPs #
######################################################################################################################

# Add IPv4 HTTP rules
echo "Getting new Cloudflare IPs for IPv4 HTTP"
for i in $(curl "https://www.cloudflare.com/ips-v4"); do
        echo "The new IP address will be added to the FirewallD public zone rules for HTTP: '$i'"
        sudo firewall-cmd --permanent --zone=public --add-rich-rule 'rule family="ipv4" source address="'$i'" port port=80 protocol=tcp accept';
done

# Add IPv4 HTTPS rules
echo "Getting new Cloudflare IPs for IPv4 HTTPS"
for i in $(curl "https://www.cloudflare.com/ips-v4"); do
        echo "The new IP address will be added to the FirewallD public zone rules for HTTPS: '$i'"
        sudo firewall-cmd --permanent --zone=public --add-rich-rule 'rule family="ipv4" source address="'$i'" port port=443 protocol=tcp accept';
done

##############################################################
# This step defines the network interface to the public zone #
##############################################################
firewall-cmd --permanent --change-zone=eth0 --zone=public

##############################################
# This step applies new changes in FirewallD #
##############################################

echo "The new rules will be applied to FirewallD and the service will be reloaded..."
sudo firewall-cmd --reload
