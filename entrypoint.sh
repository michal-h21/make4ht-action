#!/bin/bash
if [ ! -z $extra_packages ]  
then
  apt-get install $extra_packages
fi

export TEXINPUTS=.:/root/texmf//:
# debugging messages
kpsewhich make4ht-logging.lua
which make4ht
echo $command
eval $command


