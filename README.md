# Custom BingWallpaper for Ubuntu

This script changes the background of Ubuntu with BingWallpaper everyday. Right now it can be used with cronjob or systemd service.

## Table of Contents

- [Crontab](#crontab)
- [Systemd Service](#service)

## Crontab

Uses crontab to create a cronjob and run a script every day.

Open crontab list with `sudo crontab -e`

Include the cronjob in the list. To define the time you can provide concrete values for minute (m), hour (h), day of month (dom), month (mon), and day of week (dow) or use '*' in these fields (for 'any').

`m h dom mon dow /path/to/script.sh`

e.g. `0 0 * * * ~/Documents/BingWallpaper.sh`

### Start the cronjob service

`sudo /etc/init.d/cron start`

### Stop the cronjob service

`sudo /etc/init.d/cron stop`

### Restart the cronjob service

`sudo /etc/init.d/cron restart`

## Service

Create a service and use built-in ubuntu services.

Create a file called `/etc/systemd/system/custombingwallpaper.service`

```
[Unit]
Description=Custom BingWallpaper service
After=network.target
StartLimitIntervalSec=0

[Service]
Type=simple
Restart=always
RestartSec=1
User=user
ExecStart=/path/to/script.sh

[Install]
WantedBy=multi-user.target
```

- Set your actual username after `User=`
- Set the proper path to your script in `ExecStart=`

### Start the service

`systemctl start custombingwallpaper`

### Start service on boot

`systemctl enable custombingwallpaper`
