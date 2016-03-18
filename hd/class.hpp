#ifndef  CLASS_H
#define CLASS_H
#include <iostream>
#define learning_rate 2.5

class Net{
	private:
		float **m_bias; // [nb_layer][size_layers[i]]
		float  ***m_weight; // [nb_layer][size_layers[i]][size_layers[i-1]]
		float ***m_delta; // [nb_layer][size_layers[i]][size_layers[i-1]]
		float **m_grad; // [nb_layer][size_layers[i]]
		int *m_size_layers; // [nb_layers]
		int m_nb_layers;
		int m_nb_input;
		int m_max_lay;
		float comput_error(float* out, float* expect);
		float sigmo(float val);
		
	public:
		Net(int *size_layers, int nb_layers, int nb_input);
		float* comput(float* input);
		void learning(float* input, float *expect);
};




#endif