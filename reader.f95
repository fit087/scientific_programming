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
	integer					:: i, n_point, grau = 2
	real*8					:: n_gauss
	!character (len=:), allocatable 	:: n_name
	!character (len=:)			 	:: n_name

	!allocate(n_name(n_point))		:: n_name
	!degree_polynom < 2*n_point-1
	n_point = ( grau + 2 - modulo(grau,2) )/2

	print *, 'n_point = ', n_point
	
	!open (10, file = ’./P_C++_1D/IntegraExatoPolGrau_Menor_ou_=2.txt’, &
	 !action = ’read’, pad = ’yes’)
	 !open (10,’./P_C++_1D/IntegraExatoPolGrau_Menor_ou_=2.txt’)
	 !open (unit = 10, file = "./P_C++_1D/IntegraExatoPolGrau_Menor_ou_=2.txt", status='old')

	 !read(n_point,*) line

	 write(line,"(i1)") grau

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
		
!		do i = 1, 17+3*n_point+2
		call ignorar_linhas(18)

		do i = 1, n_point
		

			
			!if (i < 18 .or. (i > 18 + n_point .and. i < 18+n_point*2+1)) then
			
			!	read (10, *)
				
			!else

				!read (10, *) line
				read (10, *) n_gauss
				print *, n_gauss, i
				call ignorar_linhas(1)
				!print *, line
				read (10, *) n_gauss
				print *, n_gauss, i
				call ignorar_linhas(1)
				read (10, *) n_gauss
				print *, n_gauss, i

				if (i < n_point)	call ignorar_linhas(3)
				
			!end if
			
		end do
	 close(10)
	 
	
	
	
end program reader


subroutine ignorar_linhas(n_lines)
	integer	:: i, n_lines
	do i = 1, n_lines
		read(10, *)
	end do

end subroutine ignorar_linhas
