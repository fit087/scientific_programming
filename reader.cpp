// Reader
/*
gcc -Wall -I/usr/local/include -c gsl_gauss_quad.cpp
gcc -L/usr/local/lib gsl_gauss_quad.o -lgsl -lgslcblas -lm
./a.out

g++ -Wall -I/usr/local/include -c gsl_gauss_quad.cpp
g++ -L/usr/local/lib gsl_gauss_quad.o -lgsl -lgslcblas -lm
./a.out

gcc -I/usr/local/include -c reader.cpp
gcc -L/usr/local/lib reader.o -lm


g++ -c reader.cpp
g++ reader.o

g++ reader.cpp -o readerc


*/
#include <iostream>
#include <fstream>
#include <string>

using namespace std;

int main(void)
{
	// Reader

	const char line[2] = "2";
	//char lines[42];
	string lines;
	int i, n_point, grau = 3;
	double n_gauss;


	cout << endl << "Reading File Program" << endl;

	//degree_polynom < 2*n_point-1
	n_point = (grau + 1)/2;

	cout << "n_point = " << n_point << endl;
	
	// linha ativa mas sem sentido no c++	
	//write(line,"(i1)") n_point


	ofstream test_file;
	test_file.open("name_file.txt");

	//test_file << "./P_C++_1D/IntegraExatoPolGrau_Menor_ou_="+ \
	 line+".txt";
	 
	 test_file << "./P_C++_1D/IntegraExatoPolGrau_Menor_ou_=2.txt";
		
	test_file.close ();


	cout 	<< "./P_C++_1D/IntegraExatoPolGrau_Menor_ou_=" \
		<<line<<".txt" << endl;

	//ifstream oarquivo;
	ifstream oarquivo;
	
	//oarquivo.open ("./P_C++_1D/IntegraExatoPolGrau_Menor_ou_="+line+".txt", ios::in);
	
	oarquivo.open ("./P_C++_1D/IntegraExatoPolGrau_Menor_ou_=2.txt", ios::in);

	if (oarquivo.is_open())
	{
		
		for(i = 1; i <= 17+3*n_point+2; i++)
		{			
			if (i < 18 || (i > 18 + n_point && \
			i < 18+n_point*2+1))
			{
			
			
				//oarquivo >> n_gauss;
				//oarquivo >> lines;
				getline (oarquivo,lines);
			}	
			else
			{

				//read (10, *) line
				//oarquivo >> n_gauss;
				//oarquivo >> lines;
				getline (oarquivo,lines);
				//print *, line
				//cout << n_gauss << i;
				cout << lines << i << endl;
				
			}
			

		}
	 	oarquivo.close();
	}

	else cout << endl << "Arquivo não encontrado" << endl;

	cout<<endl;
	 
}
