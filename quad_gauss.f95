!real function fun_test1(x) result (fx)
!      real fx, x
!      fx = 1 - x**2
!      return
!end function fun_test1



Program quad_gauss
      ! Toda variavel deve ser declarada dentro do escopo
      implicit none
      
      ! Todas as Variaveis usadas devem ser decladas antes
      ! de serem usadas
      ! Declaracao e inicializacao
      real :: x = 50.0
      real*8, parameter :: pi = 4.0 * atan(1.0)
!      real :: pi = 4.0 * atan(1.0) ! se uma funcao recebe un real
                                    ! deve ser passado um real nao
                                    ! integer por isso 1.0 funciona
                                    ! mas 1 nao.
!      real*8, parameter :: pi = 4.0 * atan(1.0)
      real fun_test1
!      pi = 4.0 * atan(1.d0)

!      data x, y, z / 10, 20, &
!      30

      ! Ainda sendo o nome de uma funcao definida previamente
      ! deve ser declado nesse escopo
      !real fun_test1
      
      print *, 'Gauss Quadrature', x
      print *, 'f(x) = ', fun_test1(x)
      print *, 'PI', pi
      
      if (pi > 3) then
      	print *, 'pi is greather than 3'
      end if
      
end program quad_gauss

! As funcoes podem estar tanto antes como depois do programa principal
! Tambem podem ser internas ou externas
real function fun_test1(x)
      ! Toda variavel deve ser declarada dentro do escopo
      implicit none

      ! Impide que x seja modificado
      real, intent(in) :: x
!      real fx, x
      fun_test1 = 1 - x**2
      return
end function fun_test1
