#!/bin/bash

if [ -z "${SSH_KEY}" ]; then
	echo "=> Please pass your key in the SSH_KEY environment variable"
	exit 1
fi

for MYHOME in /root /home/docker; do
	echo "=> Adding SSH key to ${MYHOME}"
	mkdir -p ${MYHOME}/.ssh
	chmod 700 ${MYHOME}/.ssh
	echo "${SSH_KEY}" > ${MYHOME}/.ssh/id_rsa
	chmod 600 ${MYHOME}/.ssh/id_rsa
	echo "=> Done!"
done
chown -R docker:docker /home/docker/.ssh
