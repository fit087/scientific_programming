#include <iostream>

using namespace std;

double fun_test1(double);
double quad_gauss(void);

void main(void)
{
	char saida;
	double value, integral;

	// Title
	cout << "Quadratura de Gauss" << endl;

	// Testing the target function
	value = fun_test1(0.5);
	cout <<"Valor da Funcao f= " << value << endl;

	// Gauss Quadrature
	integral = quad_gauss();
	cout << "Integral da funcao f = " << integral;

	getchar();
}

double fun_test1(double x) {
	// Target Function
	return (1 - x*x);
}

double quad_gauss(void) {
	// Gauss Quadrature with n = 2 integration points
	return 1*fun_test1(-0.577350269)+ 1 * fun_test1(0.577350269);
}