import matplotlib.pyplot as plt

sizes = [16, 32, 64, 128, 256]
c_pointers = [0.000026, 0.000178, 0.001500, 0.012199, 0.096800]
c_no_pointers = [0.000026, 0.000174, 0.001400, 0.013397, 0.147700]
java = [0.000063, 0.000121, 0.001256, 0.009801, 0.084003]
python_numpy = [0.002522, 0.020396, 0.161992, 1.294774, 10.316648]

plt.plot(sizes, c_pointers, label='C with Pointers', marker='o')
plt.plot(sizes, c_no_pointers, label='C without Pointers', marker='s')
plt.plot(sizes, java, label='Java', marker='d')
plt.plot(sizes, python_numpy, label='Python (NumPy)', marker='^')
plt.xlabel('Matrix Size (n)')
plt.ylabel('Average Runtime (seconds)')
plt.title('Runtime Comparison of Matrix Multiplication')
plt.legend()
plt.grid(True)
plt.yscale('log')  # Log scale for better visualization
plt.savefig('runtime_plot.png')
plt.show()