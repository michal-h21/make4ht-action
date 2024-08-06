#!/bin/bash
if [ ! -z $extra_packages ]  
then
  apt-get update && apt-get install -y $extra_packages
fi

export TEXINPUTS=.:/root/texmf//:
echo $command
eval $command


