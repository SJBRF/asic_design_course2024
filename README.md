
Labs done as a part of the Asic Design course in IIITB  aug-dec 2024 term. 

# Table of contents
-----
- [Lab Preparations](#Lab)
- [Lab1 : Introduction to RISC-V ISA and GNU compiler toolchain](#Lab1)
  	- [Task1 : Illustration of GCC GNU compiler](#Task1)
  	- [Task2 : Illustration of RISC-V GNU compiler](#Task2)  
  		- [O1 mode compilation](#a.)  
        	- [Ofast mode compilation](#b.) 
        	- [Command explaination](#Command)   
- [Lab2 : Simulation and debugging of a C program using Spike](#Lab2)
- [Lab 3 : RISC-V Instruction identification](#Lab3)
- [Lab 4 : Functional simulation of RISC-V Core](#Lab4)
- [References](#References)
  	

--------
#### Lab Preparations: Create GitHub repository to manage the progress. Install GCC and RISC-V toolchain using VDI shared over whatsapp group. 



#### Lab1: **Introduction to RISC-V ISA and GNU compiler toolchain**


**Task1:**

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

**Task2:**

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

--------

**Lab2: Simulation using Spike simulator**


Task: Simulate the same C program used above (sum1ton.c) using the spike simulator and debug the RISC-V instructions

A RISC-V ISA is a simulator, enabling the testing and analysis of RISC-V programs without the need for actual hardware.
Spike is a free, open-source C++ simulator for the RISC-V ISA that models a RISC-V core and cache system. It can be used to run programs and a Linux kernel, and can be a starting point for running software on a RISC-V target.   

The command for running the spike simulation is
	
 	spike -d pk sum1ton_O1.o 
	
 
<img width="723" alt="Screenshot 2024-08-08 at 9 01 07 AM" src="https://github.com/user-attachments/assets/76ba7651-602b-4890-9d86-d7ec4d819099">  

* **Command Explaination:**

*  **spike -** Spike is a RISC-V ISA simulator that emulates the behavior of a RISC-V processor. It's used to run RISC-V binary programs on a host machine, simulating how those programs would execute on actual RISC-V hardware.  

* **-d** - indicates spike in debug mode. Debug mode enables you to closely monitor and interact with the simulated program's execution, making it useful for analyzing code behavior, identifying issues, and stepping through instructions.  


* **pk -** The "proxy kernel" (pk) is a small user-mode runtime environment that provides a basic set of functionalities needed to execute programs in the Spike simulator. It serves as a minimal operating system interface for the simulated environment. The proxy kernel handles basic interactions with the simulated environment, such as managing memory, handling system calls, and providing essential runtime support.

* **until pc 0 10ob0** - continue executing the program until the program counter reaches address 100b0.

* **reg 0 a2**- check the value stored in register a2. 




* **Debugging the code using Spike:**

The command for debugging the assembly code is:

 	spike -d pk sum1ton_O1.o 
	#run the program counter (pc) from 0 till the count where main is located
 	until pc 0 100b0
	
	#check the contents of the a2 register
	reg 0 a2

  	#press enter to go to next instruction set
   	#check the updated value of a2
   	reg 0 a2
 	

<img width="727" alt="Screenshot 2024-08-08 at 9 08 50 AM" src="https://github.com/user-attachments/assets/54748cde-801e-4f82-935b-95707eb42611">    


![contents update a2](https://github.com/user-attachments/assets/e9ffd4b5-4377-404f-a9ed-2fc78ed5305c)    


![contents update a0](https://github.com/user-attachments/assets/66bbfe57-8c91-4f13-b961-5797055ef7c1)  



Similarly the debug checks can be run for other instructions. for example the stack pointer can be verified by checking the values stored in sp before and after execution of the instruction  

![sp update](https://github.com/user-attachments/assets/d24e7b3f-b1d6-4b27-a991-0a9d6fbf2a50)    

------

**Lab3: RISC-V Instruction identification**

**WHAT IS RISC-V?**
RISC-V is an open-source instruction set architecture (ISA) that allows developers to develop processors for specific applications.
RISC-V is based on reduced instruction set computer principles and is the fifth generation of processors built on this concept.
RISC-V can also be understood as an alternative processor technology which is free and open, meaning that it does not require you to purchase the license of RISC-V to use it.   

**INSTRUCTIONS FORMAT IN RISC-V**
The instructions format of a processor is the way in which machine language instructions are structured and organized for a processor to execute. It is made up of series of 0s and 1s, each containing information about the location and operation of data.
There are 6 instruction formats in RISC-V:

*	R-format
*	I-format
*	S-format
*	B-format
*	U-format
*	J-format
*	RISCV Instruction Types

<img width="610" alt="Screenshot 2024-08-11 at 11 10 38 AM" src="https://github.com/user-attachments/assets/96e5f9d3-6ecb-4f48-9847-c81171868570">    

**1. R-type Instruction**
In RV32, each instruction is of size 32 bits. In R-type instruction, R stands for register which means that operations are carried on the Registers and not on memory location. This instruction type is used to execute various arithmetic and logical operations. The entire 32 bits instruction is divided into 6 fields as shown below.

<img width="650" alt="Screenshot 2024-08-11 at 11 19 48 AM" src="https://github.com/user-attachments/assets/c2661851-0ae7-4979-9af4-33ec3eb9cbf3">    


The first field in the instruction format is known as opcode, also referred as operation code. The opcode is of length 7 bits and is used to determine the type of instruction format.
The next subfield is known as rd field which is referred as Destination Register. The rd field is of length 5 bits and is used to store the final result of operation.
The next subfield is func3 also referred as function 3. Here the ‘3’ represents the size of this field. This field tells the detail about the operation, i.e., the type of arithmetic and logical that is performed.
The next two subfields are the source registers, rs1 and rs2 each of length 5 bits. These are mainly used to store and manipulate the data during the execution of instructions.
The last subfield is func7 also referred as function 7. Here ‘7’ represents the size of the field. The function of func7 field is same as that of func3 field.
2. I-type Instruction
In RV32, each instruction is of size 32 bits. In I-type instruction, I stand for immediate which means that operations use Registers and Immediate value for their execution and are not related with memory location. This instruction type is used in immediate and load operations. The entire 32 bits instruction is divided into 5 fields as shown below.  


**2. I-type Instruction**   

<img width="648" alt="Screenshot 2024-08-11 at 11 25 44 AM" src="https://github.com/user-attachments/assets/21d50a59-6e09-49d0-bd5e-51a80b6f5ed8">  


The first field in the instruction format is known as opcode, also referred as operation code. The opcode is of length 7 bits and is used to determine the type of instruction format.
The next subfield is known as rd field which is referred as Destination Register. The rd field is of length 5 bits and is used to store the final result of operation.
The next subfield is func3 also referred as function 3. Here the ‘3’ represents the size of this field. This field tells the detail about the operation, i.e., the type of arithmetic and logical that is performed.
The next subfield is the source registers, rs1 of length 5 bits. It is mainly used to store and manipulate the data during the execution of instructions.
The only difference between R-type and I-type is rs2 and func7 field of R-type has been replaced by 12-bits signed immediate, imm[11:0].
3. S-type Instruction
In RV32, each instruction is of size 32 bits. In S-type instruction, S stand for store which means it is store type instruction that helps to store the value of register into the memory. Mainly, this instruction type is used for store operations. The entire 32 bits instruction is divided into 6 fields as shown below.

**3. S-type Instruction**   

<img width="654" alt="Screenshot 2024-08-11 at 11 26 02 AM" src="https://github.com/user-attachments/assets/b19ddac0-a333-428d-8de4-6577b4090b10">   


The first field in the instruction format is known as opcode, also referred as operation code. The opcode is of length 7 bits and is used to determine the type of instruction format.
S-type instructions encode a 12-bit signed immediate, with the top seven bits imm[11:5] in bits [31:25] of the instruction and the lower five bits imm[4:0] in bits [11:7] of the instruction.
S-type instruction doesn’t have rd fields which states that these instructions are not used to write value to a register, but to write/store a value to a memory.
The value to be stored is defined in rs1 field and address to which we have to store this value is calculated using rs1 and immediate field. The width of the operation and types of instruction is defined by func3, it can be a word, half-word or byte.
4. B-type Instruction
In RV32, each instruction is of size 32 bits. In B-type instruction, B stand for branching which means it is mainly used for branching based on certain conditions. The entire 32 bits instruction is divided into 8 fields as shown below.

**4. B-type Instruction**    

<img width="649" alt="Screenshot 2024-08-11 at 11 26 18 AM" src="https://github.com/user-attachments/assets/2d10dae1-6f70-41ce-9823-eac5cbc8322f">     


The first field in the instruction format is known as opcode, also referred as operation code. The opcode is of length 7 bits and is used to determine the type of instruction format.
B-type instructions encode a 12-bit signed immediate, with the most significant bit imm[12] in bit [31] of the instruction, six bits imm[10:5] in bits [25:30] of the instruction, four bits imm[4:1] in bits [11:8] and one bit imm[11] on bit[7].
There are two source registers rs1 and rs2 on which various operations are performed based on certain conditions, and those conditions are defined by func3 field.
After performing operations on the source register based on the conditions, it is evaluated that if the condition is true, Program Counter value gets updated by PC = Present PC Value + Immediate Value, and if the condition is false then PC will be given as PC = Present PC value + 4 bytes, which states that PC will move to next instruction set.
RV32 instructions are word-aligned, which means that address is always defined in the multiple of 4 bytes.
5. U-type Instruction
In RV32, each instruction is of size 32 bits. In U-type instruction, U stand for Upper Immediate instructions which means it is simply used to transfer the immediate data into the destination register. The entire 32 bits instruction is divided into 3 fields as shown below.

**6. U-type Instruction**      

<img width="655" alt="Screenshot 2024-08-11 at 11 26 30 AM" src="https://github.com/user-attachments/assets/b8284855-e5da-4646-b804-7267847dd884">    


The first field in the instruction format is known as opcode, also referred as operation code. The opcode is of length 7 bits and is used to determine the type of instruction format.
The U-type instruction only consists of two instructions, i.e., LUI and AUIPC.
For Example, lets take the instruction lui rd, imm and understand this instruction. lui x15, 0x13579 : This instruction will be executed and the immediate value 0x13579 will be written in the MSB of the rd x15, and it will look like x15 = 0x13579000.
6. J-type Instruction
In RV32, each instruction is of size 32 bits. In U-type instruction, J stand for jump, which means that this instruction format is used to implement jump type instruction. The entire 32 bits instruction is divided into 6 fields as shown below.

**7. J-type Instruction**    

<img width="648" alt="Screenshot 2024-08-11 at 11 26 41 AM" src="https://github.com/user-attachments/assets/d43b51cf-464b-4509-b784-de50424a3086">     


The first field in the instruction format is known as opcode, also referred as operation code. The opcode is of length 7 bits and is used to determine the type of instruction format.
The J-type instruction only consists of single instruction, JAL.
J-type instruction encode 20 bits signed immediate which is divided into four fields.
The J-type instructions are often used to perform jump to the desired memory location. The address of the desired memory location is defined in the instruction. These instructions are also used to implement loops.


**Lab Task: Analysis and encode the given RISC-V instruction**
	
 	1. ADD r7, r8, r9

*	All the arithmetic and logical operations are performed using R-type instruction format, hence this instruction belongs to R-type instruction set.
*	r7 is the destination register that will hold the sum of values stored in the register r8 and r9.
  
	```
  	Opcode for ADD = 0110011
 	rd  = r7 = 00111
 	rs1 = r8 = 01000
 	rs2 = r9 = 01001
 	func3 = 000
 	func7 = 0000000
 	**32 bits instruction : 0000000_01001_01000_000_00111_0110011**
 	```

```
2. SUB r9, r7, r8
```

*	r9 is the destination register that will hold the sum of values stored in the register r8 and r9.

	```
 	Opcode for SUB = 0110011
	rd  = r9 = 01001
	rs1 = r7 = 00111
	rs2 = r8 = 01000
	func3 = 000
	func7 = 0100000
	**32 bits instruction : 0100000_01000_00111_000_00111_0110011**
 	```

```
3. AND r8, r7, r9
```

*	r8 is the destination register that will hold the sum of values stored in the register r8 and r9.

	```
 	Opcode for SUB = 0110011
	rd  = r8 = 01000
	rs1 = r7 = 00111
	rs2 = r9 = 01001
	func3 = 111
	func7 = 0100000
	32 bits instruction : 0000000_01001_00111_111_01000_0110011
 	```
 
```
4. OR r8, r8, r5
```

*	r8 is the destination register that will hold the value of r2 | r5, means performing OR operation bit by bit.

	```
 	Opcode for OR = 0110011
	rd = r8 = 01000
	rs1 = r8 = 01000
	rs2 = r5 = 00101
	func3 = 110
	func7 = 0000000
	32 bits instruction : 0000000_00101_01000_110_01000_0110011
 	```

```
5. XOR r8, r7, r4
```
 	
*	r8 is the destination register that will hold the value of r1 ^ r4, means performing XOR operation bit by bit.

	```
 	Opcode for XOR = 0110011
	rd = r8 = 01000
	rs1 = r7 = 00111
	rs2 = r4 = 00100
	func3 = 100
	func7 = 0000000
	32 bits instruction : 0000000_00100_00111_100_01000_0110011
 	```

```
6. SLT r10, r2, r4
```
 	
*	r10 is the destination register that sets to 1, if r2 is less than r4, else 0 if r2 is greater than r4.

	```
 	Opcode for SLT = 0110011
	rd = r10 = 01010
	rs1 = r2 = 00010
	rs2 = r4 = 00100
	func3 = 010
	func7 = 0000000
	32 bits instruction : 0000000_00100_00010_010_01010_0110011
 	```

```
7. ADDI r12, r3, 5
```
 	
*	In this instruction ADD means Addition, I means Immediate, therefore ADDI means Addition with Immediate, hence this instruction belongs to I-type instruction set.
*	r12 is the destination register that will store the value of r3 sum-up with the immediate value 5.

	```
 	Opcode for ADDI = 0010011
	rd  = r12 = 01100
	rs1 = r3 = 00011
	imm[11:0] = 5 = 000000000101
	func3 = 000
	32 bits instruction : 000000000101_00011_000_01100_0010011
 	```

```
8. SW r3, r1, 4
```
 	
*	In this instruction SW means store word, hence this instruction belongs to S-type instruction set.
*	r3 is the source register. This instruction will store the value located in register r3 at the address obtained by adding the immediate address 4 with the address located in register r1.
  
	```
 	Opcode for SW = 0100011
	rs2 = r3 = 00011
	rs1 = r1 = 00001
	imm[11:0] = 4 = 000000000100
	func3 = 010
	32 bits instruction : 0000000_00011_00001_010_00100_0100011
 	```

```
9. SRL r16, r11, r2
```

*	SRL means Logical Shift Right and since the operation is performed on registers, this instruction belongs to R-type instruction set.
*	r16 is the destination register, in which the value stored in r11 will be written after performing logical right shift based on the number stored in r2.
  
	```
 	Opcode for SRL = 0110011
	rd = r16 = 10000
	rs1 = r11 = 01011
	rs2 = r2 = 00010
	func3 = 101
	func7 = 0000000
	32 bits instruction : 0000000_00010_01011_101_10000_0110011
 	```

```
10. BNE r0, r1, 20
```

*	BNE is a branching instruction (B-type) based on conditions. Here BNE specifies the condition that the value stored in r0 != (is not equal to) the value stored in r1.
*	If the condition becomes true, Program Counter will be updated by PC + 20, else PC + 4 for next instruction.
	
	```
 	Opcode for BNE = 1100011
	rs1 = r0 = 00000
	rs2 = r1 = 00001
	imm[12:1] = 20 = 000000010100
	func3 = 001
	32 bits instruction : 0_000001_00001_00000_001_0100_0_1100011
 	```

```
11. BEQ r0, r0, 15
```

*	BEQ is a branching instruction (B-type) based on conditions. Here BEQ specifies the condition that the value stored in r0 == (is equal to) the value stored in r0.
*	If the condition becomes true, Program Counter will be updated by PC + 15, else PC + 4 for next instruction.

	```
 	Opcode for BEQ = 1100011
	rs1 = r0 = 00000
	rs2 = r0 = 00000
	Imm[12:1] = 000000001111
	func3 = 000
	32 bits instruction : 0_000000_00000_00000_000_1111_0_1100011
	```

```
12. LW r13, r11, 2
```

*	LW stands for Load Word. Word is equal to 32 bits or 4 bytes. Since there is an immediate value given in the instruction which helps to calculate the address of memory from where we have to fetch the data, hence this instruction belongs to I-type.
*	r13 is the destination register that will hold the value fetched from the memory location calculated by using (address value stored in r11 + immediate value)

	```
 	Opcode for LW = 0000011
	rd  = r13 = 01101
	rs1 = r11 = 01011
	imm[11:0] = 000000000010
	func3 = 010
	32 bits instruction : 000000000010_01011_010_01101_0000011
	```


```
13. SLL r15, r11, r2
```

*	SLL means Logical Shift Left and since the operation is performed on registers, this instruction belongs to R-type instruction set.
*	r15 is the destination register, in which the value stored in r11 will be written after performing logical left shift based on the number stored in r2.

	```
 	Opcode for SLL = 0110011
	rd  = r15 = 01111
	rs1 = r11 = 01011
	rs2 = r2 = 00010
	func3 = 001
	func7 = 0000000
	32 bits instruction :0000000_00010_01011_001_01111_0110011
 	```
  
	   | Instruction | Type | Standard ISA Code |
	   |:-----------:|:----:|:-----------------:|
	   |ADD r7, r8, r9 | R | 0x009403B3 |
	   |SUB r9, r7, r8 | R | 0x408383B3 |
	   |AND r8, r7, r9 | R | 0x0093F433 |
	   |OR  r8, r8, r5 | R | 0x00546433 |
	   |XOR r8, r7, r4 | R | 0x0043C433 |
	   |SLT r10, r2, r4| R | 0x00412533 |
	   |ADDI r12, r3, 5| I | 0x00518613 |
	   |SW r3, r1, 4   | S | 0x0030A223 |
	   |SRL r16, r11, r2 | R | 0x0025D833 |
	   |BNE r0, r1, 20 | B | 0x02101463 |
	   |BEQ r0, r0, 15 | B | 0x00000F63|
	   |LW r13, r11, 2 | I | 0x0025A683 |
	   |SLL r15, r11, r2 | R | 0x002597B3|
  

   
----
**Lab4: Use RISC-V Core:Verilog netlist and Testbench and perform the function simulation and observe the ouputs**   

 We will be using the Verilog Code Netlist and the Testbench of RISC-V architecture that has already been written. The reference GitHub repository is :   [(https://github.com/vinayrayapati/rv32i/?tab=readme-ov-file#2-BLOCK-DIAGRAM-OF-RISC-V-RV32I)]

* **RISC-V RV32I**
  
This lab provides an insight into the working of a few important instructions of the instruction set of a Single cycle Reduced Instruction Set Computer - Five(RISC-V) Instruction Set Architecture suitable for use across wide-spectrum of Applications from low power embedded devices to high performance Cloud based Server processors. The base RISC-V is a 32-bit processor with 31 general-purpose registers, so all the instructions are 32-bit long. Some Applications where the RISC-V processors have begun to make some significant threads are in Artificial intelligence and machine learning, Embedded systems, Ultra Low power processing systems etc.

* **Block Diagram of RISC-V RV32I**

	![181293948-beb8622c-7696-4b06-b6c9-eeab9b8ab9d3](https://github.com/user-attachments/assets/b176cf60-5e40-451f-a58d-ab906f9925c5)   

* **Instruction Set of RISC-V RV32I**
  
	![181298133-60269bc2-01da-4b5c-8b42-69057b8dc15c](https://github.com/user-attachments/assets/82d9d234-b27b-4e8e-a3e5-4354bc4bce84)  

* **Functional Simulation of RISC-V**
  
Steps to perform functional simulation of RISC-V

1. Create a new directory with your name mkdir <your_name>
	mkdir <priyanka>

2. Create two files by using touch command as name_rv32i.v and name_rv32i_tb.v
   	priyanka_rv32i.v
   	priyanka_rv32i_tb.v

3. Copy the code from the reference github repo and paste it in your verilog and testbench files

4. To run and simulate the verilog code, enter the following command:

	```
 	$ iverilog -o priyanka_rv32i priyanka_rv32i.v priyanka_rv32i_tb.v
	$ ./priytanka_rv32i
 	```
To see the simulation waveform in GTKWave, enter the following command:

	$ gtkwave priyanka_rv32i.vcd
  
 
The GTKWave will be opened and following window will appear  

	<img width="937" alt="Screenshot 2024-08-11 at 12 06 13 PM" src="https://github.com/user-attachments/assets/48614ab2-c8a8-4502-98c4-2b97511a3151">   

As shown in the figure below, all the instructions in the given verilog file is hard-coded. Hard-coded means that instead of following the RISCV specifications bit pattern, the designer has hard-coded each instructions based on their own pattern. Hence the 32-bits instruction that we generated in Task-2 will not match with the given instruction.

```verilog
	always @(posedge RN) begin
	    //NPC<= 32'd0;
	MEM[0] <= 32'h02208300;         // add r6,r1,r2.(i1)
	MEM[1] <= 32'h02209380;         //sub r7,r1,r2.(i2)
	MEM[2] <= 32'h0230a400;         //and r8,r1,r3.(i3)
	MEM[3] <= 32'h02513480;         //or r9,r2,r5.(i4)
	MEM[4] <= 32'h0240c500;         //xor r10,r1,r4.(i5)
	MEM[5] <= 32'h02415580;         //slt r11,r2,r4.(i6)
	MEM[6] <= 32'h00520600;         //addi r12,r4,5.(i7)
	MEM[7] <= 32'h00209181;         //sw r3,r1,2.(i8)
	MEM[8] <= 32'h00208681;         //lw r13,r1,2.(i9)
	MEM[9] <= 32'h00f00002;         //beq r0,r0,15.(i10)
	MEM[25] <= 32'h00210700;         //add r14,r2,r2.(i11)
	//MEM[27] <= 32'h01409002;         //bne r0,r1,20.(i12)
	//MEM[49] <= 32'h00520601;         //addi r12,r4,5.(i13)
	//MEM[50] <= 32'h00208783;         //sll r15,r1,r2(2).(i14)
	//MEM[51] <= 32'h00271803;         //srl r16,r14,r2(2).(i15) */
```
Following are the differences between standard RISCV ISA and the Instruction Set given in the reference repository:

| Operation | Standard RISCV ISA | Hardcoded ISA |
|:---------:|:------------------:|:-------------:|
| ADD R6, R2, R1 | 32'h00110333 | 32'h02208300 |
| SUB R7, R1, R2 | 32'h402083b3	| 32'h02209380 |
| AND R8, R1, R3 | 32'h0030f433	| 32'h0230a400 |
| OR R9, R2, R5	 | 32'h005164b3	| 32'h02513480 |
| XOR R10, R1, R4| 32'h0040c533	| 32'h0240c500 |
| SLT R1, R2, R4 | 32'h0045a0b3	| 32'h02415580 |
| ADDI R12, R4, 5| 32'h004120b3	| 32'h00520600 |
| BEQ R0, R0, 15 | 32'h00000f63	| 32'h00f00002 |
| SW R3, R1, 2	 | 32'h0030a123	| 32'h00209181 |
| LW R13, R1, 2	 | 32'h0020a683	| 32'h00208681 |
| SRL R16, R14, R2 | 32'h0030a123 | 32'h00271803 |
| SLL R15, R1, R2 | 32'h002097b3 | 32'h00208783 |


The simulation output waveforms for various instructions shown in the code above are given below:
	
```
1. Instruction: ADD R6, R2, R1 
```   
 
<img width="1518" alt="ADD" src="https://github.com/user-attachments/assets/1c6b6c40-817d-45d2-94b7-a04301333e6a">    

```
2. Instruction: SUB R7, R1, R2
```     

<img width="1453" alt="SUB" src="https://github.com/user-attachments/assets/47bfca43-e16a-4adb-871c-d126c506265d">         

	
```
3. Instruction: AND R8, R1, R3
```     
  	
![AND](https://github.com/user-attachments/assets/11654c0b-dc3a-4c19-bbf3-5987da3122dd)         

```
4. Instruction: OR R9, R2, R5
```     
   	
<img width="1433" alt="OR" src="https://github.com/user-attachments/assets/487d911e-de83-468b-a4ce-4bc74f26f16e">    

```
5. Instruction: XOR R10, R1, R4
```     
     	
<img width="1442" alt="XOR" src="https://github.com/user-attachments/assets/4edfc938-0cdc-4008-8b4d-3a528927bd67">     

```
6. Instruction: SLT R1, R2, R4
```     
       	
<img width="1514" alt="SLT" src="https://github.com/user-attachments/assets/89ba949e-523f-4173-964f-59f1b976df3c">     

```
7. Instruction: ADDI R12, R4, 5
```    
	
 <img width="1481" alt="ADDI" src="https://github.com/user-attachments/assets/08516ff8-5ebf-4ce9-b35a-63556530c875">     



------
**References:**

*  https://forgefunder.com/~kunal/riscv_workshop.vdi
*  https://gcc.gnu.org/onlinedocs/gcc/RISC-V-Options.html
