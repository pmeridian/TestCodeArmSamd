#!/bin/bash

ln -s $HOME/share/xdk-asf-3.45.0/thirdparty/CMSIS/Include cmsis
ln -s $HOME/share/xdk-asf-3.45.0/sam0/utils/cmsis/samd21/include .
ln -s $HOME/share/xdk-asf-3.45.0/sam0/utils/linker_scripts/samd21/gcc/samd21g18a_flash.ld .
ln -s $HOME/share/xdk-asf-3.45.0/sam0/utils/cmsis/samd21/source/gcc/startup_samd21.c .
ln -s $HOME/share/xdk-asf-3.45.0/sam0/utils/cmsis/samd21/source/system_samd21.c .
ln -s $HOME/share/xdk-asf-3.45.0/sam0/utils/cmsis/samd21/source/system_samd21.h .
