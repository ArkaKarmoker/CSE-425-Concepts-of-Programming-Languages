#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/time.h>

void matrix_multiply(double **A, double **B, double **C, int n) {
    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++) {
            C[i][j] = 0;
            for (int k = 0; k < n; k++)
                C[i][j] += A[i][k] * B[k][j];
        }
}

int main() {
    int sizes[] = {16, 32, 64, 128, 256};
    int num_sizes = 5;
    srand(time(NULL));

    for (int s = 0; s < num_sizes; s++) {
        int n = sizes[s];
        double **A = malloc(n * sizeof(double *));
        double **B = malloc(n * sizeof(double *));
        double **C = malloc(n * sizeof(double *));
        for (int i = 0; i < n; i++) {
            A[i] = malloc(n * sizeof(double));
            B[i] = malloc(n * sizeof(double));
            C[i] = malloc(n * sizeof(double));
        }

        for (int i = 0; i < n; i++)
            for (int j = 0; j < n; j++) {
                A[i][j] = (double)rand() / RAND_MAX;
                B[i][j] = (double)rand() / RAND_MAX;
            }

        double total_time = 0;
        int trials = (n <= 32) ? 1000 : 10; // More trials for small sizes
        for (int t = 0; t < trials; t++) {
            struct timeval start, end;
            gettimeofday(&start, NULL);
            matrix_multiply(A, B, C, n);
            gettimeofday(&end, NULL);
            double elapsed = (end.tv_sec - start.tv_sec) +
                             (end.tv_usec - start.tv_usec) / 1000000.0;
            total_time += elapsed;
        }
        printf("C with Pointers, Size %d: %.6f seconds\n", n, total_time / trials);

        for (int i = 0; i < n; i++) {
            free(A[i]);
            free(B[i]);
            free(C[i]);
        }
        free(A);
        free(B);
        free(C);
    }
    return 0;
}
