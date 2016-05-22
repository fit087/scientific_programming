! compiling and linking with :
! gfortran -std=f95 -Wextra -Wall -pedantic -fbackslash -Wtabs test.f95 -o test
! -fbackslash

program test

	implicit none
	
	integer			:: i = 3, k
	real				:: n = 12
	character(10)		:: prova !,nro
!	real*4			:: real4
!	real*8			:: real8
!	real*10			:: real10
!	real*16			:: real16
	
	real(kind=4)		:: real4
	real(kind=8)		:: real8
	real(kind=10)		:: real10
	real(kind=16)		:: real16
	
	
!	complex			::

	prova = "23"

!	trim() Take a character and take off white spaces from it
	print *,'trim(i) = ', 			trim(prova)
	
!	len() take a character and return the lenght of it
	print *,'len(trim(prova)) = ', 	len(trim(prova))
!	print *,'len(trim(prova)) = ', len(i)
	
!	read (prova,*) n
!	read(n,*) prova
!!	read (n,*) nro	

!	Become n (real or integer) in a character
	write(prova,"(f8.2)") n

!	// Concatenate the strings and print scape characters
!	for this is needed -fbackslash at time of compiling
	print *, 'variavel prova ='//prova//'\n\v.txt'
	
!	Become a integer into a character	
	write(prova,"(i0)") i
	
!	Test of \b that return the cursor to the beginning of the
!	line and delete everything in the line	
	print *, 'variavel prova = \b'//prova
	
!	Testing // (concatenate) and \a	
!	print *, 'variavel nro = '//nro
	print *, '\avariavel = a'//'ad'
	
!	bytes needed for represent k significant digits
	do k = 1, 35
		print *, 'significant digits k = ', k,'kind = ', &
		selected_real_kind(k)
	end do

!	The huge number that can be represent	
	real4 = huge(real4)
	real8 = huge(real8)
	real10 = huge(real10)
	real16 = huge(real16)
	print *, 'real4 = ', real4,'real8 = ', real8, &
	'\nreal10 = ', real10, '\nreal16 = ', real16
	
!	The tiny number that can be represent	
	real4 = tiny(real4)
	real8 = tiny(real8)
	real10 = tiny(real10)
	real16 = tiny(real16)
	
	print *, 'real4 = ', real4,'real8 = ', real8, &
	'\nreal10 = ', real10, '\nreal16 = ', real16
	
end program test
