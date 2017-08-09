Repository for autobuilding ejabberd Docker image

# Using docker compose
```
version: '2'

services:
  ejabberd:
    image: cmotta2016/docker-ejabberd
    volumes:
      - /opt/ejabberd/ssl:/opt/ejabberd/ssl
      - /opt/ejabberd/backup:/opt/ejabberd/backup
      - /opt/ejabberd/upload:/opt/ejabberd/upload
      - /opt/ejabberd/database:/opt/ejabberd/database
      - /opt/ejabberd/log_chat:/var/log/ejabberd/chat
    restart: unless-stopped
    environment:
      MODULE_NAME: mod_log_chat
      XMPP_DOMAIN: example.br
      ERLANG_NODE: ejabberd
      EJABBERD_ADMINS: admin@example.br
      EJABBERD_USERS: admin@example.br:p4ssw0rd!
      TZ: Americas/Sao_Paulo
    ports:
      - "5222:5222"
      - "5269:5269"
      - "5280:5280"
    container_name: ejabberd
    user: root
    hostname: xmpp.example.br
```
