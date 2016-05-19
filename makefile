# execute with make weather the of this file is makefile
# or with make -f file_name
reader:	reader.f95
#	gfortran -o reader reader.o	
	gfortran reader.f95 -o reader
