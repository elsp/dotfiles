[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# this could allow RVM to work, if you wanted that.
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# MacPorts Installer addition on 2014-11-11_at_11:00:47: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# pushes my SSH key up to a server
function push-key {
  ssh $1 "echo '`cat ~/.ssh/id_rsa.pub`' >> ~/.ssh/authorized_keys"
  }

# this will create symlinks between the conf/deploy directories in $JBOSS_HOME/server/backstop and the ~/.backstop/server/backstop copies
function link-robojboss-dotfiles {
  ln -s ~/.backstop/server/backstop/deploy/backstop-ds.xml $JBOSS_HOME/server/backstop/deploy/backstop-ds.xml
  ln -s ~/.backstop/server/backstop/deploy/mail-service.xml $JBOSS_HOME/server/backstop/deploy/mail-service.xml

  ln -s ~/.backstop/server/backstop/conf/jboss-log4j.xml $JBOSS_HOME/server/backstop/conf/jboss-log4j.xml
  ln -s ~/.backstop/server/backstop/conf/backstop_local.properties $JBOSS_HOME/server/backstop/conf/backstop_local.properties
  ln -s ~/.backstop/server/backstop/conf/synchole-storer.properties $JBOSS_HOME/server/backstop/conf/synchole-storer.properties
}
