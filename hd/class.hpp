#ifndef  CLASS_H
#define CLASS_H
#include <iostream>

class Net{
	private:
		float **m_bias;
		float  ***m_weight;
		float ***m_delta;
		float ***m_grad;
		int *m_size_layers;
		int m_nb_layers;
		
	public:
		Net(int *size_layers, int nb_layers);
}




#endif