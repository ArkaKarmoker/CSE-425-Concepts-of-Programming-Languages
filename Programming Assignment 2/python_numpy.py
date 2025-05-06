import numpy as np
import time

def matrix_multiply(A, B, C, n):
    for i in range(n):
        for j in range(n):
            C[i, j] = 0
            for k in range(n):
                C[i, j] += A[i, k] * B[k, j]

sizes = [16, 32, 64, 128, 256]
trials = 10

for n in sizes:
    # Initialize matrices with random values
    A = np.random.rand(n, n)
    B = np.random.rand(n, n)
    C = np.zeros((n, n))

    total_time = 0
    trials = 100 if n <= 32 else 10  # Align with C codes, reduced for practicality
    for _ in range(trials):
        start = time.perf_counter()
        matrix_multiply(A, B, C, n)
        end = time.perf_counter()
        total_time += end - start
    print(f"Python, Size {n}: {total_time / trials:.6f} seconds")