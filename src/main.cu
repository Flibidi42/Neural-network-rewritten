#include "../hd/class.hpp"
#define nb_train 500

using namespace std;

int main(){
	
	int test[3] = {5,2,1};
	Net my_net(test, 3, 2);
	float tab[2];
	float expec[1];
	for(int  i = 0; i< nb_train; i++){
		tab[0] = rand() % 2;
		tab[1] = rand() % 2;
		expec[0] = (tab[0] == 1 || tab[1] == 1)?1:0;
		my_net.learning(tab, expec);
	}
	
	tab[0] = 0;
	tab[1] = 0;
	cout << "Test : with 0 0 : " << (my_net.comput(tab))[0] << endl;
	
	
	return 0;
}