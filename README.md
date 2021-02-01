# HUBOT

## Introduciton

This repository contains configuration files in order to provision a [Hubot](https://hubot.github.com/docs/) application environment that leverages slack adapter. 

## Prerequisites

### Slack Token

You need to authenticate your Hubot insrance before you can communicate with Slack service. Follow the [Getting a Slack Token](https://slack.dev/hubot-slack/#getting-a-slack-token) guide on how to generate the Bot OAuth Token. 

Once you have this token update the environment variable `HUBOT_SLACK_TOKEN` located within `systemd/mkhubot.service`. When configuring, do not include surrounding quotes. An example of well written token such token is demostrated below.

```bash
Environment=HUBOT_SLACK_TOKEN=xoxo-2423982346879-3588567866210-koQs32Aza4maLkzarocks
```


## Systemd Service Unit

During provisioning phase, `mkhubot.service` is being copied to `/etc/systemd/system/`. Service is configured to start automatically after network service. If the service is not starting as expected, execute basic verification described in next section.

### Service Handling

Verify service status.

```bash
service mkhubot status
● mkhubot.service - MkHubot
     Loaded: loaded (/etc/systemd/system/mkhubot.service; disabled; vendor preset: enabled)
     Active: active (running) since Fri 2021-01-29 09:39:07 UTC; 12min ago
   Main PID: 17199 (bash)
      Tasks: 12 (limit: 2281)
     Memory: 61.1M
     CGroup: /system.slice/mkhubot.service
             ├─17199 /bin/bash -a -c cd /vagrant/mkhubot && ./bin/hubot --adapter slack > hubot.log 2>&1
             └─17204 node node_modules/.bin/coffee node_modules/.bin/hubot --name mkhubot --adapter slack --adapter slack

Jan 29 09:39:07 hubot-dev systemd[1]: Started MkHubot.
```

If required, restart the service

```bash
sudo service mkhubot restart
```


### Logging

The `mkhubot` service stdout and stderro are redirected to `/vagrant/mkhubot/hubot.log`. If you experiencing issues, for example with configuration or module you can follow this log for additional information.

```bash
tail -f /vagrant/mkhubot/hubot.log
audited 160 packages in 5.937s

2 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities

[Fri Jan 29 2021 09:39:24 GMT+0000 (Coordinated Universal Time)] INFO hubot-slack adapter v4.9.0
warn: SlackDataStore is deprecated and will be removed in the next major version. See project documentation for a migration guide.
warn: SlackDataStore is deprecated and will be removed in the next major version. See project documentation for a migration guide.
[Fri Jan 29 2021 09:39:24 GMT+0000 (Coordinated Universal Time)] INFO Logged in as @hubot in workspace Bot Salon
[Fri Jan 29 2021 09:39:25 GMT+0000 (Coordinated Universal Time)] INFO Connected to Slack RTM
[Fri Jan 29 2021 09:39:25 GMT+0000 (Coordinated Universal Time)] INFO hubot-redis-brain: Using default redis on localhost:6379
```