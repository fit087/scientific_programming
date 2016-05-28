#pragma once

namespace ambiente
{
	class MiClase
	{
	public:
		// __declspec(dllexport) - enables you tu export
		// functions, data, objects from a dll
		static __declspec(dllexport) void metodo1();
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