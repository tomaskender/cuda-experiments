#include <stdio.h>
#include <stdlib.h>
#include "util.h"

void initMatrix(float *m, int w)
{
    for (int i=0; i<w; i++)
        for (int j=0; j<w; j++)
            m[i*w+j] = MIN + rand()/(float)RAND_MAX * (MAX-MIN);
}

void printMatrix(float *m, int w)
{
    printf("[\n");
    for (int i=0; i<w; i++)
    {
        printf("\t[");
        for (int j=0; j<w; j++)
        {
            if (j != 0)
                printf(", ");
            printf("%f", m[i*w+j]);
        }
        printf("]\n");
    }
    printf("]\n");
}
