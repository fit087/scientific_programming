#include <iostream>
#include <fstream>
//#include <string>
#include <cstdlib>
//#include <string.h> // it contains strlen()
#include <cstring> //the same that string.h
//#include <stdlib.h>*/

using namespace std;

struct person
{
    int id;
    char name[25];
    //char name[30];
};

person persona1;

int main(void)
{
    // in, output file, binario, append ao final
    fstream arq("binaryfile.dat", ios_base::in|ios_base::out|ios_base::binary|ios_base::app);

    do
    {
        system("clear");
        cout<<"id= "; cin>> persona1.id;
        if(!persona1.id > 0) break;
        cin.ignore(); /*descarta o que ficou no buffer do teclado
                      usado pois as vezes o enter fica almazenado
                      no buffer do teclado isso faz que na seguente
                      leitura ele leia o enter ao inves de esperar
                      o usuario digitar*/
        cout << endl << "name = ";
        //cin>>persona1.name;
        // Read until 30 characters
        cin.getline(persona1.name, 30);
        if(strlen(persona1.name)==0) break;
        //if(persona1.name.length()==0) break;
        // Grava o endereco de memoria, ponteiro para caracter
        // Para escrever byte por byte (char = 1byte)
        arq.write((char *) &persona1, sizeof(persona1));
    } while(true);

    /* O ponteiro esta no final do arquivo
    pois foi aberto como append.
    entao deve ser colocado o ponteiro no inicio
    para ser lido, isso eh possivel com seekg
    que da um offset da possicao atual do ponteiro*/

    arq.seekg(0, ios_base::beg);

    while(arq.read((char *) &persona1, sizeof(persona1)))
    {
        cout << "id = " << persona1.id << endl;
        cout << "Nome = " << persona1.name << endl << endl;

    }

    arq.close();
    return 0;
}
