# H-UI
**Hysteria2 Web Panel • Just for Hysteria 2**
> **Disclaimer:** This project is only for personal learning and communication, please do not use it for illegal purposes, please do not use it in a production environment

**If you think this project is helpful to you, you may wish to give a**:star2:


## Quick Overview
| Features                               |         Enable?          |
| -------------------------------------- | :----------------------: |
| Multi-Language (coming soon)           | :heavy_exclamation_mark: |
| Multi-Client                           | :heavy_exclamation_mark: |
| Client & Traffic & System Status       | :heavy_check_mark:       |
| Subscription Service (link + info)     | :heavy_check_mark:       |


## Install & Upgrade to Latest Version

```sh
bash <(curl -Ls https://raw.githubusercontent.com/kaboomnick/h-ui/main/install.sh)
```

## Languages

- English

## Recommended OS

- Ubuntu 20+

### Certbot

```bash
snap install core; snap refresh core
snap install --classic certbot
ln -s /snap/bin/certbot /usr/bin/certbot

certbot certonly --standalone --register-unsafely-without-email --non-interactive --agree-tos -d <Your Domain Name>
```

</details>

## Stargazers over Time
[![Stargazers over time](https://starchart.cc/kaboomnick/h-ui.svg?variant=adaptive)](https://starchart.cc/kaboomnick/h-ui)
