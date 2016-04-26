#include <iostream>
using namespace std;
double fun_test1(double);
double quad_gauss(void);
void main(void)
{
	char saida;
	double value, integral;
	cout << "Quadratura de Gauss" << endl;
	value = fun_test1(0.5);
	cout <<"Valor da Funcao Maluca f= " << value << endl;
	integral = quad_gauss();
	cout << "Integral da funcao f = " << integral;
	getchar();
}

double fun_test1(double x) {
	return (1 - x*x);
}

double quad_gauss(void) {
	return 1*fun_test1(-0.577350269)+ 1 * fun_test1(0.577350269);
}