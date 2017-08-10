#!/bin/sh

if [ -f /cfg/myhosts ]
then
  # add line break
  echo "" >> /etc/hosts

  # append custom hosts
  cat /cfg/myhosts >> /etc/hosts
fi
