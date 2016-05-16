#!/bin/bash

:<<welcome
	This application run the 
	sudo sh ./run.sh
	sudo bash ./run.sh
welcome

clear

#fonte = "reader"
#fonte = reader

#echo "\n\t...\tCompiling\t...\n" # in sh don't need -e
echo -e "\n\t...\tCompiling\t...\n"
echo -e "gfortran -fbackslash reader.f95 -o reader\n"
gfortran -fbackslash -Wtabs reader.f95 -o reader #> compile.log

#cat <(gfortran -fbackslash reader.f95 -o reader)

#gfortran -fbackslash reader.f95 -o reader | cat #> compile.log

#gfortran -fbackslash $fonte.f95 -o $fonte #> compile.log

echo -e "\n\t...\tStart Running\t...\n"
echo -e "./reader\n"
./reader #> output.log
#./$fonte #> output.log
