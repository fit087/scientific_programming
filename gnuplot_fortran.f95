! gfortran -c gnuplot_fortran.f95
module gnuplot_fortran
!
!
	implicit none
	
	contains
	
	
	subroutine plot2d(x,y)
	
	
	
		integer					:: msize_x, nsize_y, i
		real(kind=4), intent(in), dimension(:) :: x, y
		
		msize_x = size(x)
		nsize_y = size(y)
		
		if (msize_x /= nsize_y) then
			print *,'Array size mismatch'
		else
			open(unit=10, file='data.dat')
			
			!do i = 1, msize_x
			!	write(10,*) x(i), ' ', y(i)
			!end do
			
			! Implied do-loop
!			write(10,*) (x(i), ' ', y(i), i = 1, msize_x, 1)
			write(10,*) (x(i), y(i), new_line('a'), i = 1, msize_x, 1)
			
			close(10)
			
		end if
	
	end subroutine plot2d
	
	
end module gnuplot_fortran
