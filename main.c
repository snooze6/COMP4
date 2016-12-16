#include <stdio.h>
#include <sys/time.h>
#include <stdio.h>

#define Nmax 600

void producto(float x, float y, float *z) {
    *z = x * y;
}

struct timeval inicio, final;
double tiempo;

int main() {

    printf("Hello werlld\n");

    float A[Nmax][Nmax], B[Nmax][Nmax], C[Nmax][Nmax], t, r;
    int i, j, k;
    for (i = 0; i < Nmax; i++) /* Valores de las matrices */ for (j = 0; j < Nmax; j++) {
            A[i][j] = (i + j) / (j + 1.1);
            B[i][j] = (i - j) / (j + 2.1);
        }
    printf("Init the thing\n");

    gettimeofday(&inicio, NULL);

    for (i = 0; i < Nmax; i++) /* Producto matricial */ for (j = 0; j < Nmax; j++) {
            t = 0;
            for (k = 0; k < Nmax; k++) {
                producto(A[i][k], B[k][j], &r);
                t += r;
            }
            C[i][j] = t;
        }

    gettimeofday(&final, NULL);

//    for (i = 0; i < Nmax; i++) /* Producto matricial */
//        for (j = 0; j < Nmax; j++) /* Producto matricial */
//            printf("Bla: %f", C[i][j]);

    tiempo = (final.tv_sec - inicio.tv_sec + (final.tv_usec - inicio.tv_usec) / 1.e6);
    printf("Tiempo necesario: %f\n", tiempo);

    return 0;
}
