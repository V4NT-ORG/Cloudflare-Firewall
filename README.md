# Cloudflare Firewall

This repository offers an in-depth guide to securing your website using Cloudflare's Free and Pro Firewall Rules Plan. Explore various firewall rules and configurations to enhance your website's security and protect it from potential threats.

## Table of Contents

- [Introduction](#introduction)
- [Getting Started](#getting-started)
- [Firewall Rules](#firewall-rules)
  - [Free Plan](#free-plan)
  - [Pro Plan](#pro-plan)
- [Best Practices](#best-practices)
- [Other Resources](#other-resources)
- [Contributing](#contributing)
- [License](#license)

## Introduction

Cloudflare Firewall is a powerful tool for protecting your website from potential threats. This guide will help you understand and implement various firewall rules to enhance your website's security.

## Getting Started

To get started with Cloudflare Firewall, you need to sign up for a Cloudflare account and add your website. Follow the instructions on the Cloudflare dashboard to set up your firewall.

## Firewall Rules
Rule Name | File Name | Action | What For
---- | ---- | ---- | ----
General | [rules.ssl](https://github.com/WhateverItWorks/Cloudflare-Firewall/blob/main/rules.ssl) | Manually Add | Peformance, User Experience, DDOS Protection, Crawlers<br>
Common Country | [common-country.rules](https://github.com/WhateverItWorks/Cloudflare-Firewall/blob/main/common-country.rules) | Block | Only Allow Country's Who Won't Pass Much Malicous Traffic.<br>
Bad ASN List | [bad-asn.rules](https://github.com/WhateverItWorks/Cloudflare-Firewall/blob/main/bad-asn.rules) | Block | Block Bad ASN List Of Most Known Proxyscraping Sites.<br>
Request Method | [request-method.rules](https://github.com/WhateverItWorks/Cloudflare-Firewall/blob/main/request-method.rules) | Block | Block POST & HEAD Request's Only Allow GET Request's Unless Needed.<br>
User Agents | [user-agents.rules](https://github.com/WhateverItWorks/Cloudflare-Firewall/blob/main/user-agents.rules) | Block | Block Known User-Agents <br>
mTLS-enforced authentication | [mTLS-enforced.rules](https://github.com/WhateverItWorks/Cloudflare-Firewall/blob/main/mTLS-enforced.rules) | Block | Block requests from devices without a valid known client SSL/TLS certificate. <br>
Zone lockdown | [zone-lockdown.rules](https://github.com/WhateverItWorks/Cloudflare-Firewall/blob/main/zone-lockdown.rules) | Block | Allow only specific IP addresses to access certain URLs such as an admin or protected area on your website. <br>
Expressions | [expressions.rules](https://github.com/WhateverItWorks/Cloudflare-Firewall/blob/main/expressions.rules) | Block | This Expressions are highly recommended for Node.js applications based on frameworks like Express. <br>
Expressions 2 | [expressions2.rules](https://github.com/WhateverItWorks/Cloudflare-Firewall/blob/main/expressions2.rules) | Block | This Expressions are highly recommended for Node.js applications based on frameworks like Express. <br>

## Cloudflare Dashboard Examples v1 (OLD): 
![](https://media.discordapp.net/attachments/819747919581675530/829677841292460042/unknown.png) 
![](https://media.discordapp.net/attachments/819747919581675530/829678093706592276/unknown.png) 
![](https://media.discordapp.net/attachments/819747919581675530/829678478278000650/unknown.png) 
![](https://media.discordapp.net/attachments/819747919581675530/829678903131897906/unknown.png) 

## Cloudflare Dashboard Examples v2: 
```

```

### Free Plan

The Free Plan offers basic firewall rules to protect your website from common threats. This section will cover the default rules and how to customize them.

### Pro Plan

The Pro Plan provides advanced firewall rules and configurations for enhanced security. Learn how to implement and manage these rules to protect your website from sophisticated attacks.

## Best Practices

Follow these best practices to ensure your website remains secure:
- Regularly update your firewall rules.
- Monitor your website traffic for suspicious activities.
- Use multi-factor authentication for your Cloudflare account.

## Other Resources

- [Hetzner Cloud: Cloudflare Workers Firewall](https://github.com/Erisa/hetzner-firewall-cfworker)

## Sources

-   [NexusGuard.com Thread Report 2018](https://www.nexusguard.com/hubfs/2019%20PTC/Nexusguard_Q3%202018%20Threat%20Report.pdf)
-   [CloudFlare DDoS Trends 2021](https://blog.cloudflare.com/ddos-attack-trends-for-2021-q2/)
-   [Bad ASNS List](https://github.com/brianhama/bad-asn-list/blob/master/bad-asn-list.csv)
-   [Archive Site Removal Guide](https://blog.reputationx.com/block-wayback-machine)

# Rumors

### ⚠️ Cloudflare now requires Photo ID via Stripe ⚠️
![](https://raw.githubusercontent.com/WhateverItWorks/Cloudflare-Firewall/main/screenshots/1.jpg)
![](https://raw.githubusercontent.com/WhateverItWorks/Cloudflare-Firewall/main/screenshots/2.jpg)

## Contributing

We welcome contributions from the community. If you have suggestions or improvements, please create a pull request or open an issue.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE.md) file for details.
