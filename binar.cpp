/* @file binar.cpp
    \brief arquivo binario
    Vantagens menor espaco ocupado
    Velocidade na Leitura ou escritura pois
    poupa o parsing
    Leitura direta nao sequencial
*/

#include <iostream>     ///< Input and Output on screen and read keyboard
#include <fstream>      ///< This library contains the methods for read and write on files
//#include <cstring>
#include <string>       ///< This library contains the string type
//#include <iomanip>

using namespace std;

struct estructura
{
    int nr;
    //char cadena[26];
    string cadena;
    //char* cadena;
};

int main(int argc, char *argv[])
{
    ofstream saida("out_binar.bin", ios::binary);

    estructura variavel; ///< 

    variavel.nr = 5;
    //variavel.cadena = "Hola                     ";
    //variavel.cadena = "Hola";
    //variavel.cadena = argv[1].c_str();
    variavel.cadena = argv[1];
    cout << variavel.cadena << endl;
    //variavel.cadena = "Hola".c_str();
    //variavel.cadena = "Hola\0";

    //handle.method((char *) adress_in_memory, size)
    // (char*)como sera tratado? como ponteiro para
    //caracter (byte by byte) char *)
    // sempre sera utilizado (char *) para
    // ler byte por byte
    saida.write((char *) &variavel, sizeof(estructura));

    //system("pause");
}
