# asic_design_course2024
Labs done as a part of the Physical design course in IIITB  aug-dec 2024 term. 
**Lab Preparations:** Create GitHub repository to manage the progress. Install GCC and RISC-V toolchain using VDI shared over whatsapp group. 

**Lab1/ 06/08/2024: Compile and execute a simple C code using GCC and the RISC-V compiler toolchain on Ubuntu, and compare the validity of the outputs.**


Task A **Compile and execute a C program with GCC GNU compiler toolchain and generate the output.**
**Code:**
Consider a simple C program which calculates the sum of the number form 1 to n. The code is shown below:
#include<stdio.h>
int main() {
    int i, sum=0, n=10;
    for (i=1; i<=n; i++) {
        sum+=i;
    }
    printf("The sum of numbers from 1 to %d is %d\n", n, sum);
    return 0;
}
The code can be edited via leafpad editor in the terminal window. The command for opening the editor is:
**leafpad sum1ton.c**

**Code Compilation command:**
gcc sum1ton.c

**Code execution command:**
./a.out

**Execution output:**


Task B **Compile and execute the same C program with RISC-V GNU compiler toolchain, and compare the generated output with the output of Lab1 Task A.**
