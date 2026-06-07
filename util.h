#ifndef UTIL_H
#define UTIL_H

#define MIN -5.0
#define MAX 5.0

#ifdef __cplusplus
extern "C" {
#endif

void initMatrix(float *m, int w);
void printMatrix(float *m, int w);

#ifdef __cplusplus
}
#endif
#endif