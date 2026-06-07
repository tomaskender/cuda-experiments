CC = gcc
NVCC = nvcc
CFLAGS = -Wall
NVCCFLAGS = -arch=sm_86

all: matmul matmul_cuda

matmul: matmul.c util.c util.h
	$(CC) $(CFLAGS) -o matmul matmul.c util.c -lm

matmul_cuda: matmul.cu util.c util.h
	$(NVCC) $(NVCCFLAGS) -o matmul_cuda matmul.cu util.c

clean:
	rm -f matmul matmul_cuda *.o

.PHONY: all clean
