#!/bin/bash
if [ ! -z $extra_packages ]  
then
  apt-get install $extra_packages
fi

# debugging messages
echo $command
( TEXINPUTS=.:/root/texmf//: $command )


