#include "../hd/class.hpp"
#define nb_train 10000
#include <time.h>
#include <cstdlib>
#define nb_layers 3

using namespace std;

int main(){

	srand(time(NULL));
	int test[nb_layers] = {5,2,1};
	Net my_net(test, nb_layers, 2);
	float tab[2];
	float expec[1];
	for(int  i = 0; i< nb_train; i++){
		tab[0] = rand() % 2;
		tab[1] = rand() % 2;
		expec[0] = (tab[0] == 1 || tab[1] == 1)?1:0;
		my_net.learning(tab, expec);
	}

	tab[0] = 1;
	tab[1] = 0;
	cout << "Test : with 1 0 : " << (my_net.comput(tab))[0] << endl;
	return 0;
}
