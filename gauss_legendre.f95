program gauss_legendre

      implicit none
      
      integer i, n, j
      real*8 x0, x, legendre_pol2
      
      real*8, parameter :: pi = 4.0 * atan(1.0)

      print *, '**************'      
      print *, 'Gauss-Legendre'
      print *, '**************'            
      print *, 'pi = ', pi
      
      do n = 2, 2, 1
            do i=1,n,1
            
                  x0 = cos(pi*(i-0.25)/(n+0.5))
                  x = x0
                  do j = 1, 3, 1
!                        x = x - legendre_pol2(x,n)
                  print *, 'legendre_pol2(x,n) = ',  legendre_pol2(x,n)
                  end do
                  print *, i, x0
      
            end do
      end do

end program gauss_legendre

recursive real*8 function legendre_pol2(x,n) result(legendre_pol)

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
