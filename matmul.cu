#include <stdio.h>
#include <stdlib.h>
#include "util.h"

__global__ void matmulKernel(float *M, float *N, float *P, int w)
{
    int j = threadIdx.x;
    int i = threadIdx.y;

    float sum = 0;
    for (int k=0; k<w; k++)
    {
        sum += M[i*w+k] + N[k*w+j];
    }
    P[i*w+j] = sum;
}

int main()
{
    srand(1);

    const int m_width = 5;
    const int w_squared = m_width*m_width;

    float a[25];
    initMatrix(a, m_width);
    float b[25];
    initMatrix(b, m_width);
    float result[25];

    float *a_d, *b_d, *result_d;
    cudaMalloc(&a_d, w_squared*sizeof(float));
    cudaMalloc(&b_d, w_squared*sizeof(float));
    cudaMalloc(&result_d, w_squared*sizeof(float));

    cudaMemcpy(a_d, a, w_squared*sizeof(float), cudaMemcpyHostToDevice);
    cudaMemcpy(b_d, b, w_squared*sizeof(float), cudaMemcpyHostToDevice);

    dim3 dimBlock(m_width, m_width);
    dim3 dimGrid(1, 1);
    matmulKernel<<<dimGrid, dimBlock>>>(a_d, b_d, result_d, m_width);

    cudaMemcpy(result, result_d, w_squared*sizeof(float), cudaMemcpyDeviceToHost);
    printMatrix(result, m_width);

    cudaFree(a_d);
    cudaFree(b_d);
    cudaFree(result_d);
}