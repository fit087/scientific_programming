#include<iostream>
#include<stdlib.h>
using namespace std;

int main()
{
	int vector[3] = {1, 2, 3};
	int **p; //
    int **pc;

    //calloc    aloca e limpa mas a sintaxis eh um pouco diferente
    //malloc aloca memoria sem limpar
    
	p = (int **) malloc(3 * sizeof(int*));
    pc = (int **) calloc(3, sizeof(int*));
    //p = int **(malloc(3 * sizeof(int*))); //didn't work
	
	cout<<"sizeof(sizeof())=" << sizeof(sizeof(int*))<<endl;
	cout<<"sizeof()="<< sizeof(int*)<<endl;

	for(int i=0; i<3; i++)
    {
   		p[i] = (int*) malloc(4*sizeof(int)); 
        pc[i] = (int*) calloc(4, sizeof(int)); 
        //p[i] = int*(malloc(4*sizeof(int))); //didn't work
    }

    cout<<"p"<<endl;
	for(int i=0; i<3; i++)
	{
        cout<<"| ";
		for(int j=0; j<4; j++)
		{
			//p[i][j] = 10*(i+1) + j+1;
			cout<<p[i][j]<<"\t\t";
		}
        cout<<"|"<<endl;
	}
    
	cout<<"pc"<<endl;
    for(int i=0; i<3; i++)
	{
        cout<<"| ";
		for(int j=0; j<4; j++)
		{
			cout<<pc[i][j]<<" ";
			pc[i][j] = 10*(i+1) + j+1;
			
		}
        cout<<"|"<<endl;
	}

	cout<<"pc"<<endl;
    for(int i=0; i<3; i++)
	{
        cout<<"| ";
		for(int j=0; j<4; j++)
		{
			cout<<pc[i][j]<<" ";
			//p[i][j] = 10*(i+1) + j+1;
			
		}
        cout<<"|"<<endl;
	}
	return 0;
}
