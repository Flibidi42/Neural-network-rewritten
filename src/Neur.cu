#include "../hd/class.hpp"

Neuron::Neuron(){
	//init
	m_bias = 0.f;
	m_nb_input = 1;
	m_y = 0;
	m_z = 0;
	m_weight = new float[1];
}

Neuron::Neuron(int nb_input){
	//init
	m_bias = 0.f;
	m_nb_input = nb_input;
	m_y = 0;
	m_z = 0;
	m_weight = new float[nb_input];
}

