
#include <stdio.h>

// Global variable
int x = 10;

// Function prototypes
void outer();
void inner();

void inner() {
    // Inner function uses the nearest variable 'x' (which is global in this case)
    printf("Inside inner(), x = %d\n", x);
}

void outer() {
    int x = 20; // Local variable inside outer()

    printf("Inside outer(), x = %d\n", x);

    inner(); // Call inner() function, which uses the global x due to static scoping
}

int main() {
    outer();  // Call outer() function
    printf("Inside main(), x = %d\n", x);  // Uses global x

    return 0;
}

// Output:
// Inside outer(), x = 20
// Inside inner(), x = 10
// Inside main(), x = 10
