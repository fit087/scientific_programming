#include <iostream>	// write on screen and read from keyboard
#include <fstream>		// file open close
#include <iomanip>		// Manipulation of format
#include <cstdlib>		//EXIT_SUCCESS

#define max_size 10	// macro

// if your system is windows
#ifdef WIN32
#define PAUSE 1
#else
#define PAUSE 0
#endif


using namespace std;

int main()
{
	ifstream handle_file;
	int matrix[max_size][max_size], line, column;
	
	try
	{
		//handle_file.open("matriz.csv", ios::in);
		handle_file.open("matriz.txt", ios::in);
	}

	catch (ifstream::failure e )
	{
		cerr << "Can't open input file!1";
	}
	/*catch ( OtherException e )
	{
		cerr << "Can't open input file!2";
	}*/
	catch(...)	//take all the exceptions
	{
		cerr<<"Something it's wrong w/ the file"<<endl;
		cerr << "Can't open input file!"<< strerror(errno);
		//throw;
		system("pause");
		//exit(EXIT_FAILURE );
	}
/*	catch ( ... )
	{
	    // All others
	}
*/	
	handle_file>>line>>column;
	
	cout<<line<<" "<<column<<endl;
	
	for(int i=0; i < line; i++)
		for(int j=0; j<column; j++)
		{
			//cout<<"Reading "<<i<<", "<<j<<" element"<<endl;
			handle_file>>matrix[i][j];
		}
			
	for(int i=0; i < line; i++)
	{
		cout<<"| ";
		for(int j=0; j<column; j++)
			cout<<matrix[i][j]<<" ";
		cout<<"|"<<endl;
	}
	////system("pause");
	//getchar();
	////getch();
	if(PAUSE==1)
  		system("pause");
	else
   		system("read -p \"Push enter to exit \" saindo");
   	/*That's probably because you took in input at an earlier stage
	of your app, and a newline is still sitting in the input
	stream. cin.get() is happy to gobble it, without actually
	waiting for you to enter anything.
	To clear the input stream, try something like:*/
	//cin.ignore(1024, '\n');  // ignores the newline
	//cout<<"Push a enter to exit ";cin.get();
	exit(EXIT_SUCCESS);
}

/*std::ifstream file("plop");
std::string   line;

while(std::getline(file, line))
{
    std::stringstream   linestream(line);
    std::string         data;
    int                 val1;
    int                 val2;

    // If you have truly tab delimited data use getline() with third parameter.
    // If your data is just white space separated data
    // then the operator >> will do (it reads a space separated word into a string).
    std::getline(linestream, data, '\t');  // read up-to the first tab (discard tab).

    // Read the integers using the operator >>
    linestream >> val1 >> val2;
}
*/
