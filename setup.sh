#!/bin/bash
##
## Author: Marc López Rubio
## Mail: marc5.12@outlook.com
## GitHub: https://github.com/marclop
##


ARCH=`uname -m`
RHV=`uname -r | cut -f2 -d 'l' | cut -f1 -d '.'`

function check_EPEL {
	
	yum repolist enabled epel | grep epel > /dev/null
	RESULT=$?

	return $RESULT
}

function download_EPEL {

	EPEL_NAME=epel-release
	EPEL_URL="http://dl.fedoraproject.org/pub/epel/$RHV/$ARCH"
	set EPELPKG

	if [[ $RHV -eq 7 ]];then

		EPELPKG=`curl -s $EPEL_URL\/e/ | grep $EPEL_NAME | cut -f3 -d '>' | cut -f1 -d '<'`
		yum -y install $EPEL_URL\/e\/$EPELPKG

	elif [[ $RHV -lt 7 ]]; then	

		EPELPKG=`curl -s $EPEL_URL | grep $EPEL_NAME | cut -f3 -d '>' | cut -f1 -d '<'`
		yum -y install $EPEL_URL\/$EPELPKG
	else
		echo;echo "This script is only meant for CentOS Systems";echo ;exit 1
	fi
}

# Check if EPEL installed
if ! check_EPEL; then
	download_EPEL
fi

# Update packages in the system
yum update -q -y

# Install Salt-Minion
yum install --enablerepo=epel-testing salt-minion -q -y

# Clean stored packages
yum clean all