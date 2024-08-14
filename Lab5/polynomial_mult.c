#include <stdio.h>
#include <stdlib.h>

// Function to multiply two polynomials
void multiplyPolynomials(int *A, int *B, int *result, int degreeA, int degreeB) {
    // Initialize result array with zeros
    for (int i = 0; i < (degreeA + degreeB - 1); ++i) {
        result[i] = 0;
    }

    // Perform polynomial multiplication
    for (int i = 0; i < degreeA; ++i) {
        for (int j = 0; j < degreeB; ++j) {
            result[i + j] += A[i] * B[j];
        }
    }
}

int main() {
    int degreeA, degreeB;

    // Get the degree of polynomial A from the user
    printf("Enter the degree of polynomial A (e.g., 2 for 2 + 3x + 4x^2): ");
    scanf("%d", &degreeA);
    // Increment degreeA to accommodate the number of coefficients
    degreeA += 1;

    // Get the coefficients of polynomial A from the user
    int *A = (int *)malloc(degreeA * sizeof(int));
    if (A == NULL) {
        fprintf(stderr, "Memory allocation failed\n");
        return 1;
    }
    printf("Enter the coefficients of polynomial A:\n");
    for (int i = 0; i < degreeA; ++i) {
        printf("Coefficient of x^%d: ", i);
        scanf("%d", &A[i]);
    }

    // Get the degree of polynomial B from the user
    printf("Enter the degree of polynomial B (e.g., 1 for 1 + 5x): ");
    scanf("%d", &degreeB);
    // Increment degreeB to accommodate the number of coefficients
    degreeB += 1;

    // Get the coefficients of polynomial B from the user
    int *B = (int *)malloc(degreeB * sizeof(int));
    if (B == NULL) {
        fprintf(stderr, "Memory allocation failed\n");
        free(A);
        return 1;
    }
    printf("Enter the coefficients of polynomial B:\n");
    for (int i = 0; i < degreeB; ++i) {
        printf("Coefficient of x^%d: ", i);
        scanf("%d", &B[i]);
    }

    // Allocate memory for the result
    int *result = (int *)malloc((degreeA + degreeB - 1) * sizeof(int));
    if (result == NULL) {
        fprintf(stderr, "Memory allocation failed\n");
        free(A);
        free(B);
        return 1;
    }

    // Perform polynomial multiplication
    multiplyPolynomials(A, B, result, degreeA, degreeB);

    // Print the result polynomial
    printf("Resultant polynomial: ");
    for (int i = 0; i < (degreeA + degreeB - 1); ++i) {
        printf("%d ", result[i]);
    }
    printf("\n");

    // Free allocated memory
    free(A);
    free(B);
    free(result);

    return 0;
}
