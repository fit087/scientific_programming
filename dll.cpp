//DLL
//simplificado.cpp
#include <iostream>
using namespace std;
#include "cabecera.h"

namespace ambiente
{
	void MiClase::metodo1()
	{
		cout << "hello. I'm a DLL" << endl;
	}

	void MiClase::metodo2(int a, float b)
	{
		cout << "hello. I'm a DLL metodo 2 =" << a + b << endl;
	}
};

//cabecera.h
#pragma once

namespace ambiente
{
	class MiClase
	{
	public:
		// __declspec(dllexport) - enables you tu export
		// functions, data, objects from a dll
		static __declspec(dllexport) void metodo1();
		static __declspec(dllexport) void metodo2(int, float);
		~MiClase();

	private:

	};
	/*
		MiClase::MiClase()
		{
		}

		MiClase::~MiClase()
		{
		}
	*/
}

//Excecutavel
//testador.cpp
#include <iostream>
#include "cabecera.h"
using namespace std;
using namespace ambiente;

int main()
{
	//metodo1();					//don't work
	MiClase::metodo1();
	MiClase::metodo2(2, 3.5);
	system("pause");
}
