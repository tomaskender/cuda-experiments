#include <stdio.h>
#include <stdlib.h>
#include "util.h"

void matmul(float *M, float *N, float *P, int w)
{
    for (int i=0; i<w; i++)
    {
        for (int j=0; j<w; j++)
        {
            float sum = 0;
            for (int k=0; k<w; k++)
            {
                sum += M[i*w+k] + N[k*w+j];
            }
            P[i*w+j] = sum;
        }
    }
}

int main()
{
    srand(1);

    const int m_width = 5;

    float a[25];
    initMatrix(a, m_width);
    float b[25];
    initMatrix(b, m_width);
    float result[25];

    matmul(a, b, result, m_width);
    printMatrix(result, m_width);
}