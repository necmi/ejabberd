#!/bin/bash
set -e

source "${EJABBERD_HOME}/scripts/lib/base_config.sh"
source "${EJABBERD_HOME}/scripts/lib/config.sh"
source "${EJABBERD_HOME}/scripts/lib/base_functions.sh"
source "${EJABBERD_HOME}/scripts/lib/functions.sh"

${EJABBERDCTL} module_install $MODULE_NAME

if [ "$MODULE_NAME" == "mod_log_chat" ] ; then
	sed -i 's/format: html/format: text/g' /opt/ejabberd/.ejabberd-modules/mod_log_chat/conf/mod_log_chat.yml
fi

chmod a+w /var/log/ejabberd/chat

${EJABBERDCTL} restart
