#!/bin/bash

#######################################################
#          DevStack base server build                 #
#                                                     #
#     Version: 1.0                                    #
#     Author: Matthew Dutton (dutton.matt@gmail.com)  #
#                                                     #
#                                                     #
#######################################################

# Variables
CONFIG_FILE=local.conf
DEVSTACK_USER=stack

# Update base Ubuntu image, install git and clone devstack repo
echo "Update base installation and install git" >&2
  apt-get update && apt-get install -y git
  cd /
  git clone https://git.openstack.org/openstack-dev/devstack

# Create stack user and log in as the new user
echo "Create devstack user" >&2
  /devstack/tools/create-stack-user.sh

# Copy configuration files over
echo "Copy base installation files into required locations" >&2
  
  if [-f /devstack/"$CONFIG_FILE"];
  then
	  echo "Removing existing config file: \"$CONFIG_FILE\"" >&2
	  rm /devstack/"$CONFIG_FILE"
  fi
  
  mv -vf /devstack/samples/local.conf /devstack/

# Pre stack.sh fixes
echo "Performing pre stack.sh fixes" >&2
  # Change owner of the cloned repo to stack
  chown -R stack:stack /devstack/

# Run the installation
  echo -n "To install run image and it will execute: \"/bin/bash -c sudo -u "$DEVSTACK_USER" /devstack/stack.sh\")" >&2
  #sudo -u "$DEVSTACK_USER" /devstack/stack.sh

