
Labs done as a part of the Asic Design course in IIITB  aug-dec 2024 term. 

# Table of contents
-----
* #### Lab Preparations
* #### Lab 1 : Introduction to RISC-V ISA and GNU compiler toolchain
    * Task1 : Illustration of GCC GNU compiler
  	* Task2 : Illustration of RISC-V GNU compiler  
  		*   O1 mode compilation  
        *   Ofast mode compilation 
        *   Command explaination   

* #### References
  	

--------
**Lab Preparations:** Create GitHub repository to manage the progress. Install GCC and RISC-V toolchain using VDI shared over whatsapp group. 



**Lab1-06/08/2024:** **Introduction to RISC-V ISA and GNU compiler toolchain**


**Task 1:**

**Compile and execute a C program with GCC GNU compiler toolchain and generate the output.**
**Code:**
Consider a simple C program which calculates the sum of the number form 1 to n. The code is shown below:

```C Code
		#include<stdio.h>    
		int main() {    
			int i, sum=0, n=100;     
    		for (i=1; i<=n; i++) {      
        		sum+=i;	  
    		}      
    		printf("The sum of numbers from 1 to %d is %d\n", n, sum);      
    		return 0;      
		}  
```

The code can be edited via leafpad editor in the terminal window. The command for opening the editor is:

	leafpad sum1ton.c

**Code Compilation command:**

	gcc sum1ton.c

**Code execution command:**

	./a.out  

	
 <img width="728" alt="Screenshot 2024-08-07 at 2 31 44 PM" src="https://github.com/user-attachments/assets/59dea9e3-e6a4-4692-9e67-4067ea8e9aa2">  
 


**Execution Output:**

<img width="717" alt="Screenshot 2024-08-07 at 2 22 29 PM" src="https://github.com/user-attachments/assets/ae1d0c34-a815-462c-a9aa-9712096f5bd3">



----

**Task 2:**

**Compile and execute the same C program with RISC-V GNU compiler toolchain, and compare the generated output with the output of Lab1 Task A.**

**a. O1 Mode compilation:**

Consider the same C code used in task 1.
``` C Code
	#include<stdio.h>
	int main() {
    	int i ,sum=0,n=100;
    	for (i=1;i<=n;i++){
        	sum+=i;
    	}
    	printf("The sum of numbers from 1 to %d is %d\n",n,sum);
    	return 0;
	}
```

In order to map this command to riscv based assembly language compile it using the riscv-gnu-toolchain shown below  


<img width="773" alt="Screenshot 2024-08-07 at 2 40 29 PM" src="https://github.com/user-attachments/assets/e908c94e-fc88-4582-a0f7-45218761c9ef">


**Output of the file:**  



<img width="1145" alt="Screenshot 2024-08-07 at 2 45 57 PM" src="https://github.com/user-attachments/assets/e2ce6b7c-4000-454e-9daf-acb58a0357af">



*The calculation beside the disassembled output shows the number of instructions required to generate the corresponding output. The value is in hexadecimal.*

	To view the address of the subroutine (line main()) in the C code, type /main (if main()). To quit type :q.


**b. Ofast mode compilation:**

Consider the same C program given in the O1 mode.

Map this command to riscv based assembly language and compile it in Ofast mode using the riscv-gnu-toolchain as shown below
```terminal window command
	vsduser@vsduser-VirtualBox: $
	riscv64-unknown-elf-gcc -Ofast -mabi=lp64 -march=rv64i -o sum1ton.o sum1ton.c
	riscv64-unknown-elf-objdump -d sum1ton_Ofast.o | less
```

**Output of the file:**

<img width="1208" alt="Screenshot 2024-08-07 at 2 56 12 PM" src="https://github.com/user-attachments/assets/9733c4c4-d097-449e-974c-b3c4bcb2f717">  


The number of instructions for executing the code in the ofast mode were found to be 12, less than and optimized as compared to the O1 mode.

From the above results, we can observe:

O1: selects a basic level of optimization which involves short compilation time. It optimizes the code without any major agressive changes.The code size reduction for the given example was 35.  

Ofast: selects an aggressive level of optimization. It gives us maximum performance but at the cost of precision and correctness issues. The code size or the given example was 12.

------
**Commands Explaination:**

**riscv64-unknown-elf-gcc -** RISC-V architecture based gcc compiler .

**-O1/-Ofast -** This flag specifies the optimization level to be used during compilation. In this case, the level is set to 1, which represents a basic level of optimization. Higher optimization levels (like -O2 or -O3) can potentially result in more optimized and faster code, but they might also increase compilation time.-Ofast is an optimization level flag used in GCC (GNU Compiler Collection) to enable aggressive optimizations that go beyond the optimizations performed by -O3.

**-mabi=lp64 -** Specify integer and floating-point calling convention. ABI-string contains two parts: the size of integer types and the registers used for floating-point types. "lp64" ABI stands for "Long and Pointer 64-bit," indicating that long integers and pointers are 64 bits in size.

**-march=rv64i -** Generate code for given RISC-V ISA. ISA strings must be lower-case. Examples include ‘rv64i’, ‘rv32g’, ‘rv32e’, and ‘rv32imaf’. In this case, "rv64i" specifies a 64-bit RISC-V architecture with the "i" extension, which denotes the base integer instruction set.

**-o sum1ton_O1.o -** This flag indicates the name of the output file after compilation. In this case, the compiled code will be saved as "sum1ton_O1.o".

**sum1ton.c -** This is the source code file that you want to compile. In this case, it's named "sum1ton.c".

**riscv64-unknown-elf-objdump -** This is the command-line utility used for examining the contents of object files, executables, and libraries. It can provide information about the disassembled machine code, symbol tables, and more.

**-d -** This flag specifies that the disassembly mode should be used. In other words, you are requesting to see the disassembled machine code instructions corresponding to the binary content in the object file.

**sum1ton_O1.o -** This is the object file that you want to disassemble. It contains the compiled machine code generated from the "sum1ton.c" source code file using the specified compiler options.

------
**References:**

*  https://forgefunder.com/~kunal/riscv_workshop.vdi
*  https://gcc.gnu.org/onlinedocs/gcc/RISC-V-Options.html
