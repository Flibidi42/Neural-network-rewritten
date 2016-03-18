#include "../hd/class.hpp"
#define nb_train 150

using namespace std;

int main(){
	
	int test[2] = {5,1};
	Net my_net(test, 2, 2);
	float tab[2];
	float expec[1];
	for(int  i = 0; i< nb_train; i++){
		tab[0] = rand() % 2;
		tab[1] = rand() % 2;
		expec[0] = (tab[0] == 1 || tab[1] == 1)?1:0;
		my_net.learning(tab, expec);
	}
	
	
	
	return 0;
}