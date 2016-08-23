/*
$ g++ -c -std=c++11 c_using_fortran.cpp
$ gfortran matrix_multiply.o c_using_fortran.o -lstdc++ -o c_using_fortran.out
$ ./c_using_fortran.out 

*/

#include <iostream>
#include <vector>
#include <random>
#include <ctime>

using namespace std;

extern "C"
{
    void matrix_multiply(double [][2], int *, int *, double [][2], int *, int *, double [][2], int *, int *);
}

int main() 
{
	size_t N = 2;
	//vector<double> A(N * N), B(N * N), C(N * N);
	//double A[N][N], B[N][N], C[N][N];
	double C[2][2];
 
	/*//Fill A and B with random numbers in the range [0,1]:
	rnd_fill(A, 0.0, 1.0);
	rnd_fill(B, 0.0, 1.0);*/
	/*A = {{1, 0},{ 0, 1}};
	B = {{1, 2},{ 3, 4}};*/
/*	double A[][N] = {{1, 0},{ 0, 1}};
	double B[][N] = {{1, 2},{ 3, 4}};*/
/*	double A[][2] = {{1, 0},{ 0, 1}};
	double B[][2] = {{1, 2},{ 3, 4}};*/
	double A[2][2] = {{1, 0},{ 0, 1}};
	double B[2][2] = {{1, 2},{ 3, 4}};
/*	double ** A = {{1, 0},{ 0, 1}};
	double ** B = {{1, 2},{ 3, 4}};*/
	//A = 
 
    //Multiply matrices A and B, save the result in C
	int sz = N;
	/*matrix_multiply(&A[0][0], &sz, &sz, &B[0][0], &sz, &sz, &C[0][0], &sz, &sz);*/
//	matrix_multiply(&A[0][0], &sz, &sz, &B[0][0], &sz, &sz, &C[0][0], &sz, &sz);
	matrix_multiply(A, &sz, &sz, B, &sz, &sz, C, &sz, &sz);
	int i, j;
//	for(int i=0; i<N; i++)
	for(i=0; i<N; i++)
	{	
		std::cout << std::endl << "| ";
//		for(int j=0; j<N; j++)
		for(j=0; j<N; j++)
		{
			std::cout << C[i][j] << "\t";
		}
		std::cout << "|";
	}
		
	
	/*//print A, B, C on the standard output
	print_matrix(A, sz, sz);
	print_matrix(B, sz, sz);
	print_matrix(C, sz, sz);*/

	return 0;
}
