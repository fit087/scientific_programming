! Reader
! Currently It isn't copiling with:
! $ gfortran -std=f95 -Wextra -Wall -pedantic -fbackslash reader.f95 -o reader
!
! Only it's possivel run with:
! gfortran reader.f95 -o reader

program reader
	! Reader
	
	implicit none
	
	character(80)				:: line
	integer					:: i, n_point, grau = 3
	real*8					:: n_gauss
	!character (len=:), allocatable 	:: n_name
	!character (len=:)			 	:: n_name

	!allocate(n_name(n_point))		:: n_name
	!degree_polynom < 2*n_point-1
	n_point = (grau + 1)/2

	print *, 'n_point = ', n_point
	
	!open (10, file = ’./P_C++_1D/IntegraExatoPolGrau_Menor_ou_=2.txt’, &
	 !action = ’read’, pad = ’yes’)
	 !open (10,’./P_C++_1D/IntegraExatoPolGrau_Menor_ou_=2.txt’)
	 !open (unit = 10, file = "./P_C++_1D/IntegraExatoPolGrau_Menor_ou_=2.txt", status='old')

	 !read(n_point,*) line

	 write(line,"(i1)") n_point

	 !allocate(character(len=len(line)) :: n_name)

	 !write(n_name,"(i1)") n_point

	 open (unit = 101, file = "name_file")

		write(101,"(a)") "./P_C++_1D/IntegraExatoPolGrau_Menor_ou_="//trim(line) &
		//".txt"
		!write(101,"(a,i1)") "./P_C++_1D/IntegraExatoPolGrau_Menor_ou_="//line, &
		!".txt"
		!write(101,"(a)") "./P_C++_1D/IntegraExatoPolGrau_Menor_ou_="//n_name &
		!//".txt"
	close (101)

	 print *, "./P_C++_1D/IntegraExatoPolGrau_Menor_ou_="//trim(line)//".txt"

	 open (unit = 10, file = "./P_C++_1D/IntegraExatoPolGrau_Menor_ou_="//trim(line)//".txt", &
	 status='old', action='read', form='formatted', blank='null')!,access='direct', recl=80)
	 
	 !read (10, '(i80)') line
		!do i = 1,13
		
		do i = 1, 17+3*n_point+2
			!read (10, *) line
			!read (10, rec=13) line
			!read (10, *) line
			
			
!			if (i < 18 .or. (i > 18 + n_point .and. i < 18+n_point*2+1)) then !.and. i < 18 + n_point+2)) then
			
!				read (10, *)
!			else
!				!read (10, *) line
!				read (10, *) n_gauss
!				!print *, line
!				print *, n_gauss, i
				
!			end if
			
			if (i < 18 .or. (i > 18 + n_point .and. i < 18+n_point*2+1)) then
			
				read (10, *)
				
			else

				!read (10, *) line
				read (10, *) n_gauss
				!print *, line
				print *, n_gauss, i
				
			end if
			
			!read (10, "(a80)") line
			!read (10, "(f8.10)") line
			
			!read (10, *) n_gauss
			!read (10, "(f18.10)") n_gauss
			
			!print *, line
			
			!print *, n_gauss
		end do
	 close(10)
	 
	
	
	
end program reader
