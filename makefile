# execute with make weather the of this file is makefile
# or with make -f file_name
all:		quad_gauss  reader_sub reader # Without this, 2nd target don't run
reader:	reader.f95
##	gfortran -o reader reader.o	
	gfortran reader.f95 -o reader
	
quad_gauss:	quad_gauss.f95
	gfortran quad_gauss.f95 -o quad_gauss
	
reader_sub:	reader_sub.f95
##	gfortran -o reader reader.o	
	gfortran reader_sub.f95 -o reader_sub
