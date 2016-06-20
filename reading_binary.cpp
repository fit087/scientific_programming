// Example program
#include <iostream>
#include <fstream>

using namespace std;

struct Item
{
	int x;
};


int main()
{

	ofstream dat("file.bin", ios::binary);

	Item chair;

	for (int i = 0; i < 20; i++)
	{	
		chair.x = i;
		dat.write((char*)&chair, sizeof(Item));
	}

	dat.close();
	//dat.flush();
	
	ifstream dat2("file.bin", ios::binary);
	
	if (dat2.is_open())
	{
		for (int i = 0; i < 20; i++)
		{
			//dat2.read((char*)&chair, sizeof(Item));
			dat2.read((char*)&chair, sizeof(Item));  
			cout << chair.x << endl;
		}
	}
	else
		cout<<"file dont open";

	return 0;
	
}
