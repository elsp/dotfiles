#!/bin/bash
#
# starts the backstop application, and if it fails because of a segmentation fault runs this script recursively
# this allows mac users to consistently get backstop running with only one command...
#
# unfortunately for some, this script will redirect stderr to a file so if you need anything out of there it's going to be in .backstop/backstop.stderr
#
# usage:  run_backstop [:<parameters>]
#

$JBOSS_HOME/bin/run.sh -b 0.0.0.0 -c backstop $@ 2> ~/.backstop/backstop.stderr

regex="Segmentation fault"

if [ -e $JBOSS_HOME/server/backstop/log/server.log ]; then
	if [[ `tail -n1 ~/.backstop/backstop.stderr` =~ $regex ]]; then
		~/.backstop/run_backstop.sh $@	
	else
		echo ""
		fortune -a | cowsay -n -b
		echo ""
	fi
fi
