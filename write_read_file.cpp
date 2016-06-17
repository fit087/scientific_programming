#include <iostream>
#include <string>
#include <fstream>

using namespace std;

string read_char(void);

int main(void)
{
	string leido;
	leido = read_char();

	cout << "funcao =" << leido << endl;

	system("pause");
}

string read_char(void)
{
	ofstream handle1;

	handle1.open("file1.txt");

	string string_readed;

	//handle1 << string_readed;

	handle1 << "Hello arquivo" << endl;

	handle1.close();

	string leggio;

	//ifstream handle2("file1.txt");

	ifstream handle2;

	handle2.open("file1.txt");


	//leggio = handle2.getline();

	//handle2 >> leggio;

	getline(handle2, leggio);

	handle2.close();

	return  leggio;
}
