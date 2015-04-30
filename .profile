export PATH=/usr/bin:/bin:/usr/sbin:/sbin:usr/local/bin:/usr/X11/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/Users/dholman/tools

# JAVA CONFIG
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_75.jdk/Contents/Home
export JAVA_OPTS="-Xms512m -Xmx2048m"

# subversion
export EDITOR=vim
export SVN_MERGE=/Users/dholman/tools/kdiff3caller
export KDIFF3_HOME=/Applications/kdiff3.app/Contents/MacOS

# backstop
alias backstop='~/.backstop/run_backstop.sh'
alias yourkit='~/.backstop/yourkit_backstop.sh'
alias bsds='vim ~/.backstop/server/backstop/deploy/backstop-ds.xml'
alias bslp='vim ~/.backstop/server/backstop/conf/backstop_local.properties'
alias bslj='vim ~/.backstop/server/backstop/conf/jboss-log4j.xml'
export BS_HEAPMAX=4G
export JBOSS_HOME=/Users/dholman/dev/jboss/
export GRIDGAIN_HOME=/Users/dholman/dev/gridgain/

# ant
export ANT_OPTS="-Xms512m -Xmx2048m"
alias deploy='quick_deploy'
alias quick_jr_deploy='ant -lib antlib/lib -nice 10 -Dskip-cdn=moo -Dskip-minify=moo java-rebel-dirty'
alias full_jr_deploy='ant -lib antlib/lib -nice 10 -Dskip-cdn=moo -Dskip-minify=moo java-rebel-full'
alias jsp_deploy='ant -lib antlib/lib -nice 10 deploy-jsp'
alias full_deploy='ant -lib antlib/lib -nice 10 -Dskip-cdn=moo -Dskip-minify=moo full-build-deploy-compile-time-weaving'
alias test='ant -lib antlib/lib -nice 10 full-build-test'

# tomcat	
export TOMCAT_HOME="/usr/local/apache-tomcat-6.0.26"
export JPDA_ADDRESS="8787"

# sqlplus / sqldeveloper / oracle oci driver... 
export ORACLE_HOME=/Applications/instantclient
export INSTANTCLIENT_HOME=$ORACLE_HOME
export TNS_ADMIN=$INSTANTCLIENT_HOME
export DYLD_LIBRARY_PATH=$INSTANTCLIENT_HOME
export LD_LIBRARY_PATH=$INSTANTCLIENT_HOME
export CLASSPATH=$INSTANTCLIENT_HOME

# other
alias soap='/Users/dholman/soapui-2.5.1/bin/soapui.sh'
alias truecrypt='/Applications/TrueCrypt.app/Contents/MacOS/Truecrypt --text'
export CLICOLOR=on

# final PATH settings
export PATH=/usr/local/bin:$JAVA_HOME/bin:$PATH:$INSTANTCLIENT_HOME:$KDIFF3_HOME

# RVM, ug
# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

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
