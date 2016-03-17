nvcc -o obj/net.o -c src/net.cu -l CUDA_files/lib/glut32
nvcc -o network.exe obj/net.o src/main.cu -l CUDA_files/lib/glut32