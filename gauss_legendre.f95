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
      real*8 x0, x, legendre_pol2, fprime, newton_raphson, w, gauss_weights
      real*8, dimension(:,:),allocatable :: xw
      
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
                  x = newton_raphson(x0, n)
                  w = gauss_weights(x, n)
                  print *, i, x, w      

            end do
      end do
      allocate(xw(2,2))
      print *, 'Nova subroutine '
      call gauss_abscissas_weights(2, xw)
      n = 2
      print *, 'x = ', (xw(i,1), i=1,n,1)
      print *, 'w = ', (xw(i,2), i=1,n,1)
      deallocate(xw)

end program gauss_legendre

subroutine gauss_abscissas_weights(n, xi_wi)
        implicit none
        integer, intent(in)      :: n 
        integer(kind=4)          :: i
        real(kind=8)             :: x
        real(kind=8), external   :: newton_raphson, gauss_weights
        real*8, parameter :: pi = 4.0 * atan(1.0)
        !real*8, dimension(:,:), allocatable :: xi_wi
        real*8, dimension(n,2) :: xi_wi

        !allocate(xi_wi(n,2))

        do i = 1, n, 1

          x = cos(pi * (i-0.25)/(n+0.5))
          xi_wi(i,1) = newton_raphson(x, n)
          xi_wi(i,2) = gauss_weights(xi_wi(i,1), n)


        end do


end subroutine gauss_abscissas_weights
!end subroutine gauss_abscissas_weights

!real*8, dimension(n,2) function gauss_abscissas_weights(n) &
!        result (xi_wi)
!        implicit none
!        integer, intent(in)      :: n 
!        integer(kind=4)          :: i
!        real(kind=8)             :: x, newton_raphson, gauss_weights
!        real*8, parameter :: pi = 4.0 * atan(1.0)
!
!        do i = 1, n, 1
!
!          x = cos(pi * (i-0.25)/(n+0.5))
!          xi_wi(i,1) = newton_raphson(x, n)
!          xi_wi(i,2) = gauss_weights(x, n)
!
!
!        end do
!
!
!end function gauss_abscissas_weights

!real*8 pure function gauss_weights(x,n) result (w)
real*8 function gauss_weights(x,n) result (w)
        implicit none
        integer, intent(in)     ::n
	real*8, intent(in) 	::x
        real*8 fprime
        w = 2.d0/(1.d0-x**2)/(fprime(x,n))**2

end function gauss_weights

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
