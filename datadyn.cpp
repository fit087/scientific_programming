#include <iostream>
#include <new>			// new and delete
#include <vector>

#include <cmath>

using namespace std;
//std::bad_alloc;

struct pts_gauss
{
	int num;
	/*double x[num]; don't work
	double w[num];*/
	double *x = new double[num];
	double *w = new double[num];
};

typedef struct
{
	int num;
	/*double x[num]; don't work
	double w[num];*/
	double *x = new double[num];
	double *w = new double[num];
}pi_gauss;

void prints(struct pts_gauss ptos);
void prints1(pi_gauss ptos);

int main(int argc, char* argv[])
{
	// Reader
	
	struct pts_gauss pts;
	pi_gauss puntos;
	//vector<int> xis(6,0);
	
	pts.num = 10;
	puntos.num = 10;
	//xis.reserve(6);
	
	for(int i = 1; i<=10;i++)
	{
		/*pts.x[i-1] = pow(i,2)*sqrt(i);
		pts.w[i-1] = i*sqrt(i);*/
		/*puntos.x[i-1] = pow(i,2)*sqrt(i*i*i);
		puntos.w[i-1] = i*sqrt(i*i*i);*/
		*(puntos.x+i-1) = pow(i,2)*sqrt(i*i*i);
		*(puntos.w+i-1) = i*sqrt(i*i*i);
		//xis[i-1] = sqrt(i);
		//xis.push_back(sqrt(i));
		//cout<<xis[i];
	}
	
	prints(pts);
	
	
	//delete[] pts;
}

void prints(struct pts_gauss ptos)
{
	for(int i=0; i<ptos.num; i++)
		cout<<"x"<<i<<"= "<<ptos.x[i]<<"\t\tw"<<i<<"= " \
		<<ptos.w[i]<<endl;	
}

void prints1(pi_gauss ptos)
{
	for(int i=0; i<ptos.num; i++)
		cout<<"x"<<i<<"= "<<ptos.x[i]<<"\t\tw"<<i<<"= " \
		<<ptos.w[i]<<endl;	
}
