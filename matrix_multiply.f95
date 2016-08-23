! $ gfortran -c matrix_multiply.f95

! $ gfortran matrix_multiply.o c_using_fortran.o -lstdc++ -o c_using_fortran.out

subroutine matrix_multiply(matrix_a, rows_a, cols_a, matrix_b, rows_b, cols_b, matrix_c, rows_c, cols_c) bind(c)
	use iso_c_binding
	integer(c_int) ::  rows_a, cols_a, rows_b, cols_b, rows_c, cols_c
	real(c_double) ::	matrix_a(rows_a, cols_a), matrix_b(rows_b, cols_b), matrix_c(rows_c, cols_c)
	
	matrix_c = matmul(matrix_a, matrix_b)
end subroutine matrix_multiply
