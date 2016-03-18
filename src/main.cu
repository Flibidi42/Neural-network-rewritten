#include "../hd/class.hpp"

using namespace std;

int main(){
	
	int test[2] = {2,1};
	Net my_net(test, 2, 2);
	float test2[2] = {1,1};
	float expec[1] = {1};
	my_net.learning(test2, expec);
	
	return 0;
}