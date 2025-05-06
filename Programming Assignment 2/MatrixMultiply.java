import java.util.Random;

public class MatrixMultiply {
    public static void matrixMultiply(double[][] A, double[][] B, double[][] C, int n) {
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                C[i][j] = 0;
                for (int k = 0; k < n; k++) {
                    C[i][j] += A[i][k] * B[k][j];
                }
            }
        }
    }

    public static void main(String[] args) {
        int[] sizes = {16, 32, 64, 128, 256};
        Random rand = new Random();

        for (int n : sizes) {
            // Initialize matrices
            double[][] A = new double[n][n];
            double[][] B = new double[n][n];
            double[][] C = new double[n][n];

            // Fill matrices with random values between 0 and 1
            for (int i = 0; i < n; i++) {
                for (int j = 0; j < n; j++) {
                    A[i][j] = rand.nextDouble();
                    B[i][j] = rand.nextDouble();
                }
            }

            // Determine number of trials
            int trials = (n <= 32) ? 1000 : 10;
            double totalTime = 0;

            // Run trials
            for (int t = 0; t < trials; t++) {
                long start = System.nanoTime();
                matrixMultiply(A, B, C, n);
                long end = System.nanoTime();
                totalTime += (end - start) / 1_000_000_000.0; // Convert nanoseconds to seconds
            }

            // Print average runtime
            System.out.printf("Java, Size %d: %.6f seconds%n", n, totalTime / trials);
        }
    }
}