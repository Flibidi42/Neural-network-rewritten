#include "../hd/class.hpp"

Net::Net(int *size_layers, int nb_layers, int nb_input){
	
	m_nb_layers = nb_layers;
	m_nb_input = nb_input;
	for(int i = 0; i< nb_input; i++){
		m_size_layers[i] = size_layers[i];
	}
	
	//max_size for layers
	int max = 0;
	for(int i = 0; i<nb_layers; i++){
		if(size_layers[i] > max)
			max = size_layers[i];
	}
	m_max_lay = max;
	
	//bias - alloc
	m_bias = new float*[nb_layers];
	for(int i = 0; i<nb_layers; i++){
		m_bias[i] = new float[size_layers[i]];
	}
	//bias - init
	for(int i = 0; i<nb_layers; i++){
		for(int j = 0; j<size_layers[i]; j++){
			m_bias[i][j] = 0.5;
		}
	}
		
	//weight - alloc/init
	m_weight = new float**[nb_layers];
	for(int i = 0; i<nb_layers; i++){
		m_weight[i] = new float*[size_layers[i]];
	}
	for(int i = 0; i<nb_layers; i++){
		for(int j = 0; j<size_layers[i]; j++){
			if(i == 0){ // particular case : first layer
				m_weight[i][j] = new float[nb_input];
				for(int k = 0; k<nb_input; k++){ // init
					m_weight[i][j][k] = 1;
				}
			}
			else{ // other layers
				m_weight[i][j] = new float[size_layers[i-1]];
				for(int k = 0; k<size_layers[i-1]; k++){ // init
					m_weight[i][j][k] = 1;
				}
			}
		}
	}
	
	//grad - alloc/init
	m_grad = new float*[nb_layers];
	for(int i = 0; i<nb_layers; i++){
		m_grad[i] = new float[size_layers[i]];
	}
	//grad - init
	for(int i = 0; i<nb_layers; i++){
		for(int j = 0; j<size_layers[i]; j++){
			m_grad[i][j] = 0;
		}
	}
	
	//delta - alloc/init
	m_delta = new float**[nb_layers];
	for(int i = 0; i<nb_layers; i++){
		m_delta[i] = new float*[size_layers[i]];
	}
	for(int i = 0; i<nb_layers; i++){
		for(int j = 0; j<size_layers[i]; j++){
			if(i == 0){ // particular case : first layer
				m_delta[i][j] = new float[nb_input];
				for(int k = 0; k<nb_input; k++){ // init
					m_delta[i][j][k] = 0;
				}
			}
			else{ // other layers
				m_delta[i][j] = new float[size_layers[i-1]];
				for(int k = 0; k<size_layers[i-1]; k++){ // init
					m_delta[i][j][k] = 0;
				}
			}
		}
	}
}

float* Net::comput(float* input){
	
	float* transition = new float[m_max_lay];
	float* transition_old = new float[m_max_lay];
	
	for(int i = 0; i<m_nb_layers; i++){ // for each layer
		for(int j = 0; j<m_size_layers[i]; j++){ // for each neuron
		
			//calcul layers
			if(i == 0){
				for(int k = 0; k<m_nb_input; k++){ // sum
					transition[j] += input[k] * m_weight[i][j][k];
				}
				transition[j] += m_bias[i][j];//bias
				transition[j] = sigmo(transition[j]);
			}
			else{
				for(int k = 0; k<m_size_layers[i-1]; k++){ // sum
					transition[j] += transition_old[k] * m_weight[i][j][k];
				}
				transition[j] += m_bias[i][j];//bias
				transition[j] = sigmo(transition[j]);
			}
			
			//switch transistion
			for(int k = 0; k<m_size_layers[i]; k++){
					transition_old[k] = transition[k];
			}
		}
	}
	
	return transition;
	
}

float Net::sigmo(float val){
    return 1/(1+exp(-val));
}