Program read_file
implicit none

real*8	:: cd1, cdn1, cdl1

call readdata(cd1, cdn1, cdl1)

print *, 'Valores ',cd1,' ', cdn1,' ', cdl1

!pause
!stop

End Program


subroutine readdata(cd, cdn, cdl)
implicit none


Real*8    :: cd, cdn, cdl

!print *, 'sem problemas'

open(unit = 100,file='data.txt',status='old',action='read')
!open(unit = 100,file='C:\\Users\\carol\\Documents\\data.txt')
read(100,*) cd
print *, '***********Variaveis lidas do arquivo de entrada********'
print *, 'N1=', cd
read(100,*) cdn
print *, 'N2=', cdn
read(100,*) cdl
print *, 'N3=', cdl
CLOSE(UNIT=100 )

pause

end subroutine
