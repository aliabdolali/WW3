#!/bin/bash

RED='\033[0;31m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
##############convert the main model/ftn directory###############
#write the list of *ftn in model/ftn directory into list.tmp
if [ -f list.tmp ]; then rm -f list.tmp; fi
ls ../ftn/*ftn > list.tmp
sed -i 's/\.ftn/\./g' list.tmp
#convert *ftn to *F90
  while read line
  do
#delete preexisiting ${line}.F90
      if [ -f ${line}F90 ]; then rm -f ${line}F90; fi
#concert ${line}ftn to ${line}F90
      gawk -f ../aux/switch2cpp.awk < ${line}ftn > ${line}F90
      echo -e "${CYAN}${line}ftn converted to ${line}F90"
  done < list.tmp

rm list.tmp
##################################################################

#######convert the main model/ftn/SCRIP directory#################
#write the list of *ftn in model/ftn/SCRIP directory into list.tmp
if [ -f list.tmp ]; then rm -f list.tmp; fi
ls ../ftn/SCRIP/*ftn > list.tmp
sed -i 's/\.ftn/\./g' list.tmp
#convert *ftn to *F90
  while read line
  do
#delete preexisiting ${line}.F90
      if [ -f ${line}F90 ]; then rm -f ${line}F90; fi
#concert ${line}ftn to ${line}F90
      gawk -f ../aux/switch2cpp.awk < ${line}ftn > ${line}F90
      echo -e "${RED}${line}ftn converted to ${line}F90"
  done < list.tmp

rm list.tmp
#################################################################

#I did not find a switch in model/ftn/PDLIB/*ftn but will run the 
#convertor to convert it to F90 extension
#######convert the main model/ftn/PDLIB directory#################
#write the list of *ftn in model/ftn/DPLIB directory into list.tmp
if [ -f list.tmp ]; then rm -f list.tmp; fi
ls ../ftn/PDLIB/*ftn > list.tmp
sed -i 's/\.ftn/\./g' list.tmp
#convert *ftn to *F90
  while read line
  do
#delete preexisiting ${line}.F90
      if [ -f ${line}F90 ]; then rm -f ${line}F90; fi
#concert ${line}ftn to ${line}F90
      gawk -f ../aux/switch2cpp.awk < ${line}ftn > ${line}F90
      echo -e "${BLUE}${line}ftn converted to ${line}F90"
  done < list.tmp

rm list.tmp
#################################################################
