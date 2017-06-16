!
!	*****************************************************************
!     Gauss-Legendre - Program of Numeric Integration
!     
!
!       Adolfo Correa <fitomillennium@hotmail.com> 04/05/2016
!     *****************************************************************
!module ExampleFuncs

!   implicit none

!contains

!function newton_raphson (fun)
!  real :: newton_raphson
!  
!  abstract interface
!      function func (z)
!         real :: func
!         real, intent (in) :: z
!      end function func
!   end interface
  
!  procedure (func), pointer :: fun

!  newton_raphson = fun (5.)

!  return
!end function newton_raphson

!end module ExampleFuncs


module interfaz
	interface

		function fx(x,n)
			real*8:: fx, x
			integer::n      
		end function fx

		function fprime(x,n)
      		real*8:: fx, x
      		integer::n  
		end function fprime

	end interface
end module interfaz

program gauss_legendre
!	use interfaz
      implicit none
!      use ExampleFuncs
      
      integer i, n, j
      real*8 x0, x, legendre_pol2, fprime, newton_raphson
      
      real*8, parameter :: pi = 4.0 * atan(1.0)
      
!   abstract interface
!      function func (z)
!         real :: func
!         real, intent (in) :: z
!      end function func
!   end interface

!	procedure (fx), pointer :: f_ptr => null ()

      print *, '**************'      
      print *, 'Gauss-Legendre'
      print *, '**************'            
      print *, 'pi = ', pi
      
      do n = 2, 2, 1
            do i=1,n,1
            
                  x0 = cos(pi*(i-0.25)/(n+0.5))
                  x = x0
                  !do j = 1, 3, 1
!                        x = x - legendre_pol2(x,n)
                  !print *, 'legendre_pol2(x,n) = ',  legendre_pol2(x,n)
                  !print *, 'fprime(x,n) = ',  fprime(x,n)
                  !end do
!                  print *, i, x0
                  print *, i, newton_raphson(x0, n)
      
            end do
      end do

end program gauss_legendre

!real*8 pure function newton_raphson(x0, fx, fprime) result (x)
!	implicit none
!	real*8, intent(in) 	::x0
!	real*8			::x=x0
!	
!	do
!		x = x - fx(x) / fprime(x)
!		if (fx(x)/fprime(x)> 2*tiny(x)) exit
!	enddo
!
!end function newton_raphson

real*8 function newton_raphson(x0, n) result (x)
	implicit none
	real*8, intent(in) 		:: x0
!	real*8				:: x=x0
	real*8 legendre_pol2, fprime
	integer, intent(in)		:: n
	
	x=x0
	do
		x = x - legendre_pol2(x,n) / fprime(x,n)
                !print *, 'i = ', i
		if (ABS(legendre_pol2(x,n)/fprime(x,n))< 2*EPSILON(x)) exit
	enddo

end function newton_raphson

recursive real*8 function fprime(x,n) result(p_prime)
	implicit none
	real*8, intent(in) 	:: x
	integer, intent(in) 	:: n
	real*8			:: legendre_pol2
	
	p_prime = n/(x**2-1)*(x*legendre_pol2(x,n)-legendre_pol2(x,n-1))

end function fprime

recursive real*8 pure function legendre_pol2(x,n) result(legendre_pol)

      implicit none

      real*8, intent(in) :: x
      integer, intent(in) :: n
!      real*8 legendre_pol2

!      if n .eq. 0 then
!            legendre_pol2 = 1
!      else if n .eq. 1 then
!            legendre_pol2 = x
!      else
!      legendre_pol2 = 1.0/n*((2*n-1)*x*legendre_pol2(x,n-1)-
!      & (n-1)*legendre_pol2(x,n-2))
!      end if

      if (n == 0) then
            legendre_pol = 1
      else if (n == 1) then
            legendre_pol = x
      else
      !legendre_pol = 1.0/n*((2*n-1)*x*legendre_pol2(x,n-1)
!	& - (n-1)*legendre_pol2(x,n-2))
	
      legendre_pol = 1.0/n*((2*n-1)*x*legendre_pol2(x,n-1))
      legendre_pol = legendre_pol -1.0/n*((n-1)*legendre_pol2(x,n-2))
	
      end if
      
end function legendre_pol2
