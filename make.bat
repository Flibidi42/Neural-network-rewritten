nvcc -o obj/neur.o -c src/neur.cu -l CUDA_files/lib/glut32
nvcc -o network.exe obj/neur.o src/main.cu -l CUDA_files/lib/glut32