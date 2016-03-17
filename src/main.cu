#include "../hd/class.hpp"

using namespace std;

int main(){
	
	int test[2] = {2,1};
	Net my_net(test, 2, 2);
	float test2[2] = {1,1};
	cout << (my_net.comput(test2))[0] << endl;
	
	return 0;
}