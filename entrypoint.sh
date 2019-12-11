#!/bin/bash
if [ ! -z $extra_packages ]  
then
  apt-get install $extra_packages
fi

echo $command
eval $command


