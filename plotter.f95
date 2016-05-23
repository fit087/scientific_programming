! compiling: gfortran -c gnuplot_fortran.f95
! output files: 
! compiling: gfortran -c plotter.f95
! linking: gfortran -o plotter gnuplot_fortran.o plotter.o


! running: ./plot_example
! start: gnuplot
! command: plot 'data.dat' using 1:2
! (1 : 2 referce columns)
! command: set grid

program plotter
!
!
	use gnuplot_fortran
	implicit none
	
	integer				:: i
	integer, parameter		:: n = 100
	real(kind=4), parameter		:: pi = 4.0 * atan(1.0e0)
	real(kind=4)			:: a = 0.0e0, b = 6 * pi, dx
	real(kind=4), dimension(0:n)	:: x, y
	
!	character			::
!	complex			::
!	logical			::

!	k_type = select_real_kind(15)
	print *,'Example for plotting in gnuplot'
	
!	read(*,*)

	dx = (b - a) / (real(n) - 1)
	
	!x(1) = 0.0e0
	
	
	x(0:n) = [(i*dx, i = 0, n, 1)]
	!do i = 2, n, 1
	!	x(i) = x(i-1) + dx
	!end do
	
	y = sin(x) / (x + 1)
	
	
	call plot2d(x, y)
	
	!open(unit=10, file='data.dat')
	
	!do i = 1, n
	!	write(10,*) x(i), y(i)
	!end do
	
	!close(10)
	!print *, x(1:5)
	!print *, y(1:5)
	
	! for print '\n' (newline) is required -fbackslash for compile
	!print *, (i, x(i), y(i), '\n', i = 1, 5)
	print *, (i, x(i), y(i), new_line('a'), i = 1, 5)
	!"write (file_number,format_spec,advance='no') variable_name"


	
	
end program plotter
