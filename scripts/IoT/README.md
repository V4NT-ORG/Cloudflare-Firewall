# Cloudflare.com-IoT-ufw
Block all IoT Scrapers from Exposing your IP Address Behind NOC.org.

### Setup
Assuming that you already have ufw installed (now a pre-installed package in most linux distros), firstly ensure that ufw is not enabled;

```sudo ufw status verbose```

If it's not enabled, the response should be ```Status: inactive``` but if not, let's disable it;

```sudo ufw disable```

Clear out any existing rules;

```sudo ufw reset```

and set the default rules to deny incoming and allow outgoing connections;

```sudo ufw default deny incoming```  
```sudo ufw default allow outgoing```

It's important at this stage to prevent being accidently being locked out of your system by adding 2 rules, before going further.  
Add a localhost rule;

```sudo ufw allow from 192.168.1.0/24```

and also allow SSH access;

```sudo ufw allow ssh```

Provided those rules were succesfully added, time to enable your firewall;

```sudo ufw enable```

You will receive a warning that says the "command may disrupt existing ssh connections." We have already set up a firewall rule that allows SSH connections so it should be fine to continue. Respond to the prompt with y.  
You can run the ```sudo ufw status verbose``` command to see the rules that are set.

### Install the script

Git clone this repo to your system, and run the bash script in the normal manner;

```sudo /your/path/cloudflare-IoT-ufw/./cloudflare-IoT-ufw.sh```

The script will then download all the iot scrapers current v4 & v6 IP's, and install them into ufw's configuration. Check that the rules have been successfuly added; ```sudo ufw status verbose```

### Scheduling

Everytime the script is run, it will add any new iot scrapers IP addresses, so consider running the script weekly to ensure that it's kept up to date.  
The script can run automatically by using cron;

```sudo crontab -e```

and add the event;

```0 0 * * 1 /your/path/cloudflare-IoT-ufw/cloudflare-IoT-ufw.sh > /dev/null 2>&1```

### Contributing on AbuseIPDB
<a href="https://www.abuseipdb.com/user/118422" title="AbuseIPDB is an IP address blacklist for webmasters and sysadmins to report IP addresses engaging in abusive behavior on their networks">
	<img src="https://www.abuseipdb.com/contributor/118422.svg" alt="AbuseIPDB Contributor Badge" style="width: 401px;">
</a>
