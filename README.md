
Labs done as a part of the Asic Design course in IIITB  aug-dec 2024 term. 

# Table of contents
-----
1. [Lab Preparations](#Lab-Preparations)
2. [Lab1 : Introduction to RISC-V ISA and GNU compiler toolchain](#Lab1-Introduction-to-RISCV-ISA-and-GNU-compiler-toolchain)
  	- [Task1 : Illustration of GCC GNU compiler](#Task1)
  	- [Task2 : Illustration of RISC-V GNU compiler](#Task2)  
  		- [O1 mode compilation](#a.-O1-Mode-compilation)  
        	- [Ofast mode compilation](#b.-Ofast-mode-compilation) 
        	- [Command explaination](#Commands-Explaination)   
3. [Lab2 : Simulation and debugging of a C program using Spike](#Lab2-Simulation-using-Spike-simulator)
4. [Lab3 : RISC-V Instruction identification](#Lab3-RISCV-Instruction-identification)
5. [Lab4 : Functional simulation of RISC-V Core](#Lab4)
6. [Lab5 : Choose an application and compile the c code for the same using GCC and Spike simulators](#Lab5-Write-a-Custom-real-life-application-C-Code-and-do-the-following)
7. [RISC-V MYTH WORKSHOP](#RISC-V-MYTH-WORKSHOP)
   * [RISCV- Day3 : Digital Logic with TL-Verilog and Makerchip](#Day3-Digital-Logic-with-TL-Verilog-and-Makerchip)
   	* [Basic Combinational Circuits in Makerchip](#Basic-Combinational-Circuits-in-Makerchip)
   	* [Basic Sequential Circuits in Makerchip](#Basic-Sequential-Circuits-in-Makerchip)
   	* [Pipeline Concept](#Pipeline-Concept)
   * [Day4- Building a RISC-V CPU core Micro-architecture](#Day4--Building-a-RISC-V-CPU-core-Micro-architecture)
     	1. [Program Counter](#Program-Counter)
     	2. [Instruction Fetch](#Instruction-Fetch)
     	3. [Instruction Decoder](#Instruction-Decoder)
     	4. [ALU](#ALU)
     	5. [Read Register File](#IRead-Register-File)
     	6. [Register File Write](#Register-File-Write)
     	7. [Branch Instruction](#Branch-Instruction)
     	8. [Final design of CPU](#Final-design-of-CPU)
   * [Day- 5 Complete Pipelined RISC-V CPU Micro-architecture](#Day--5-Complete-Pipelined-RISC-V-CPU-Micro-architecture)
- [References](#References)
  	

--------
## Lab Preparations: 

Create GitHub repository to manage the progress. Install GCC and RISC-V toolchain using VDI shared over whatsapp group. 



## Lab1 Introduction to RISCV ISA and GNU compiler toolchain   


#### Task1:

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

#### Task2:

**Compile and execute the same C program with RISC-V GNU compiler toolchain, and compare the generated output with the output of Lab1 Task A.**

### a. O1 Mode compilation:

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


### b. Ofast mode compilation:

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
#### Commands Explaination:

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

## Lab2 Simulation using Spike simulator:


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

## Lab3 RISCV Instruction identification:

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
## Lab4: 

**Use RISC-V Core: Verilog netlist and Testbench and perform the function simulation and observe the ouputs**

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

```
8. Instruction: BEQ R0, R0, 15
```     


![BEQ](https://github.com/user-attachments/assets/7502d23f-73c7-4ee4-a6de-a60d0cc5e9cf)

-----------     

## Lab5 Write a Custom real life application C Code and do the following:  

* Write compilable C Code for the same
* Compile and simulate it using GCC and upload the screenshot for the output
* Compile and simulate the same using RISC-V GCC compiler and Spike simulator and upload the screenshot
* Compare and validate both the outputs

  * Application choosen:
    
    **A Polynomial Multiplier which takes two polynomials A and B as user inputs and generates the multiplication output of A and B**
   
    The GCC compiler output of the code is shown below
    

    ![Pasted image](https://github.com/user-attachments/assets/596e6a65-f74d-4cc5-ad3d-202a34e723d3)
    

    The RISCV Spike simulator and the comparison of both the outputs is shown below:
    

    ![Pasted image 1](https://github.com/user-attachments/assets/71610743-62c2-4eb6-8698-a5b54d987657)      


    The simulated output O1 with GCC and O2 with RISC-V GCC compilers were found to be same for the given application for same set of user inputs.

------
## RISC-V MYTH WORKSHOP:

## Day3 Digital Logic with TL Verilog and Makerchip:

**Logic Gates**
Logic gates are fundamental building blocks of digital electronic circuits. They are responsible for performing logical operations on input signals and producing output signals based on predefined logic rules. These gates are the foundation of digital computation and are used to design and construct more complex digital systems like processors, memory units, and controllers. Logic gates manipulate binary signals, which are typically represented as "0" and "1". These binary signals correspond to the low and high voltage levels in a digital circuit, respectively. Logic gates take one or more input signals and produce an output signal based on a logical function.

Here are some common types of logic gates:

<img width="1236" alt="Screenshot 2024-08-16 at 11 27 48 PM" src="https://github.com/user-attachments/assets/803e3b49-3b35-4633-987b-728128a62bc3">    

**Multiplexer Using Ternary Operator**

Consider the verilog code for multiplexer gicen below :

```
	assign f = s ? x1 : x0;
```
This code uses ternary operator that will realize a simple 2:1 multiplexer hardware in which the output f follows x1 if s is 1 otherwise it will follow x0. The harware and logic gate representation l is shown below :

<img width="569" alt="Screenshot 2024-08-16 at 11 30 04 PM" src="https://github.com/user-attachments/assets/a86a515f-a92c-42c5-a478-0e96f75cbb58">    

The higher bit multiplexers can also be realized using the coditional operator. Consider the 4:1 multiplexer code given below :

```
	assign f = sel[0] ? a : (sel[1] ? b : (sel[2] ? c : d));
```

This code creates a priority for the inputs with input a getting the highest and input d getting the least. Instead of realizing as a single 4:1 multiplexer it will create a series of 2:1 multiplexers. In this case the sel is a one hot vector i.e, only one of the bit in the sel will be high at a time. The hardware realization is shown below :

<img width="506" alt="Screenshot 2024-08-16 at 11 31 25 PM" src="https://github.com/user-attachments/assets/6aea7668-59e4-4d6b-b382-c804885012d8">    

**Transaction Level(TL) - Verilog**

TL-Verilog is a Verilog implementation of TL-X, a language extension that extends any HDL with transaction-level modeling. TL-Verilog was developed by Redwood EDA, and it's designed to enable more efficient and concise design representation while retaining compatibility with standard Verilog. It eliminates the need for the legacy language features of Verilog and introduces simpler syntax. TL-Verilog is specifically designed for modeling hardware and provides abstract context suited to hardware design with numerous benefits. It is built for the design process, not for the mere description of static designs. In transaction-level design, a transaction is an entity that moves through a microarchitecture and is operated upon and steered through the machinery by flow components such as pipelines, arbiters, and queues. TL-Verilog is the easiest way to write and edit Verilog with fewer bugs and is supported by Makerchip.

**Makerchip IDE**

Makerchip IDE is an integrated development environment specifically designed for digital design and hardware description language (HDL) programming. It offers a comprehensive platform for engineers, students, and hobbyists to design, simulate, and test digital circuits and systems. Makerchip IDE stands out for its user-friendly interface and its ability to support various HDLs like TL Verilog, SystemVerilog, Verilog, and VHDL. Within the Makerchip IDE, users can design complex digital systems by using a combination of pre-built and custom logic elements such as logic gates, flip-flops, multiplexers, and more. It provides a virtual canvas where users can visually construct their designs by interconnecting these components. One of the notable features of Makerchip IDE is its real-time simulation capability, allowing users to simulate their designs and observe their behavior before moving on to actual hardware implementation. This virtual prototyping helps catch errors early and refine designs efficiently. Overall, Makerchip IDE serves as an invaluable tool for both beginners and experienced digital designers to explore, learn, and experiment with digital logic design, fostering innovation and advancement in the field of digital electronics.

**Basic Combinational Circuits in Makerchip**
------
**1. Pythagorean Example Demo**
```
	// Pythagora's Theorem
         $aa_sq[7:0] = $aa[3:0] ** 2;
         $bb_sq[7:0] = $bb[3:0] ** 2;

         $cc_sq[8:0] = $aa_sq + $bb_sq;
         $cc[4:0]    = sqrt($cc_sq);

      	// Print
            always_ff @(posedge clk) begin
               \$display("sqrt((\%2d ^ 2) + (\%2d ^ 2)) = \%2d", $aa, $bb, $cc);
            end

   	// Stop simulation.
   	*passed = *cyc_cnt > 40;
```

<img width="1680" alt="Screenshot 2024-08-16 at 11 44 36 PM" src="https://github.com/user-attachments/assets/1ca1357b-7d06-475c-ac84-2eb2e3c3f1ee">     

-----
**2. Inverter**    

The TL-Verilog code is shown below :
```
   	$out = $in;
```
<img width="1669" alt="inverter" src="https://github.com/user-attachments/assets/aea80830-32ce-407a-a15e-8bc8244bf262">   

-----

**3. 2 input AND Gate:**    

The TL-Verilog code is shown below :
```
	$out = $in1 && $in2;
```
<img width="1668" alt="And" src="https://github.com/user-attachments/assets/a5ab41a5-88bb-4e27-8043-f660d428b638">

------

**4. 2 input OR gate:**    

The TL-Verilog code is shown below :
```
	$out = $in1 || $in2;
```

<img width="1675" alt="or" src="https://github.com/user-attachments/assets/dda68e64-9679-4aaa-8333-201ff22dd82a">

------

**5. 2 input XOR gate:**     

The TL-Verilog code is shown below :
```
	$out = $in1 ^ $in2;
```
<img width="1670" alt="xor" src="https://github.com/user-attachments/assets/476524f7-42ec-4f98-a4c0-f2ba4708e0ab">

-----

**6. Vector Addition:**     

The TL-Verilog code is shown below :
```
	$out[4:0] = $in1[3:0] + $in2[3:0];
```
<img width="1673" alt="Screenshot 2024-08-16 at 5 08 44 PM" src="https://github.com/user-attachments/assets/ed0a8bb9-ec7e-47d1-a22f-8fd46026592a">

-----

**7. 2:1 Multiplexer:**    

The TL-Verilog code is shown below :
```
   	$out = $sel ? $in1 : $in0;
```
<img width="1665" alt="mux2_ip" src="https://github.com/user-attachments/assets/1e413646-2eba-40bb-bc79-c32b55bbb30a">

-----

**8. 2:1 Vector Multiplexer:**    

The TL-Verilog code is shown below :
```
   	$out[7:0] = $sel ? $in1[7:0] : $in0[7:0];
```

<img width="1606" alt="Screenshot 2024-08-16 at 5 17 32 PM" src="https://github.com/user-attachments/assets/71a8106c-cb64-4c68-b13d-092ccb7d8c0f">

-----

**9. Calculator?:**
The function table is given below : 

|Function|opcode|
|:------:|:----:|
|Addition|0x00|
|Subration|0x01|
|Multiplication|0x02|
|Division|0x03|
         

The TL-Verilog code is shown below :
```
	   $reset = *reset;
	   $op[1:0] = $random[1:0];
	   
	   $val1[31:0] = $rand1[3:0];
	   $val2[31:0] = $rand2[3:0];
	   $sum[31:0]  = $val1+$val2;
	   $diff[31:0] = $val1-$val2;
	   $prod[31:0] = $val1*$val2;
	   $quot[31:0] = $val1/$val2;
	   
	   $out[31:0] = $op[1] ? ($op[0] ? $quot : $prod):($op[0] ? $diff : $sum);
```

<img width="1574" alt="calc" src="https://github.com/user-attachments/assets/20dcea3e-d1c3-4ba0-90c1-095553962388">

-----

## Basic Sequential Circuits in Makerchip:

A sequential circuit is a type of digital circuit that employs memory elements to store information and produce outputs based not only on the current input values but also on the circuit's previous state. Unlike combinational circuits, which generate outputs solely based on the present input values, sequential circuits incorporate feedback loops and memory elements like flip-flops or registers to maintain and utilize their internal state.

**1. Fibonacci Series**:   

The TL-Verilog code for fibonacci series is shown below :
```
	   $reset = *reset;
	   $num[31:0] = $reset ? 1 : (>>1$num + >>2$num);
```

Here, 
>>1 indicates the previous value of num 
>>2 indicates Value of num before 2 clock cycle

The block diagram is shown below

<img width="787" alt="Screenshot 2024-08-16 at 6 41 35 PM" src="https://github.com/user-attachments/assets/894e88ea-5b85-4483-ab4c-fe83a7633ad3">

The makerchip simulation is shown below:   

<img width="1676" alt="Screenshot 2024-08-16 at 9 22 12 PM" src="https://github.com/user-attachments/assets/ae6c13f2-e2e2-4b4c-964f-1aa5b05a3018">     

----- 
**2. Free running counter:**    

The TL-Verilog code for free running counter is shown below :
```
	   $reset = *reset;
	   $cnt[31:0] = $reset ? 0 : (>>1$cnt + 1);
```
The block diagram and MAkerchip simulation window are shown below:

<img width="255" alt="Screenshot 2024-08-17 at 12 09 31 AM" src="https://github.com/user-attachments/assets/502957d9-49e1-48a8-9fc2-30a058c33e7c">    

<img width="1657" alt="Screenshot 2024-08-16 at 9 54 15 PM" src="https://github.com/user-attachments/assets/81f38645-dc0b-48cf-bef1-e8d4bfa03348">

-----   

**3. Counter-Output with Calculator Integration:**

The TL-verilog code for sequential calculator is shown below :
```
	   $reset = *reset;
	   
	   $cnt2[2:0] = $reset ? 0 : (>>1$cnt2 + 1);
	   $cnt3[1:0] = $reset ? 0 : (>>1$cnt3 + 1);
	   
	   $op[1:0] = $random[1:0];
	   
	   $val1[31:0] = >>1$out;
	   $val2[31:0] = $rand1[3:0];
	   $sum[31:0] = $val1+$val2;
	   $diff[31:0] = $val1-$val2;
	   $prod[31:0] = $val1*$val2;
	   $div[31:0] = $val1/$val2;
	   
	   $out[31:0] = $reset ? 32'h0 : ($op[1] ? ($op[0] ? $div : $prod):($op[0] ? $diff : $sum));
```

This code works like the normal calculator in which the result of the previous operation is considered as one of the operand for the next operation. Upon reset the result becomes zero.

<img width="1637" alt="counter_with_calc" src="https://github.com/user-attachments/assets/b88c98c4-c10a-4217-afed-d49212393fb2">     

-------
## Pipeline Concept:  

Pipelining is a technique used in computer architecture and digital system design to enhance the efficiency of processing by dividing a complex task into smaller, sequential stages. Each stage performs a specific operation on the data, and these stages are arranged in a pipeline. Pipelining enables multiple instructions or tasks to be executed concurrently, with different stages of different instructions being processed simultaneously. In a pipelined architecture, the processing of an instruction is divided into several stages. This allows for overlapping the execution of multiple instructions, reducing the overall time needed to complete a sequence of tasks.

**Basic Pipelined Circuits:**

**1. Counter and Calculator in Pipeline:**  

The block diagram of the counter with calculator in pipeline is shown below :   

<img width="618" alt="Screenshot 2024-08-18 at 3 46 28 PM" src="https://github.com/user-attachments/assets/046a79cf-dc10-4eaa-9753-e9d379030a8d">

The TL-Verilog code is given below :
```
	$reset = *reset;
   	$op[1:0] = $random[1:0];
   	$val2[31:0] = $rand2[3:0];
   
        |calc
           @1
              $val1[31:0] = >>1$out;
              $sum[31:0] = $val1+$val2;
              $diff[31:0] = $val1-$val2;
              $prod[31:0] = $val1*$val2;
              $div[31:0] = $val1/$val2;
              $out[31:0] = $reset ? 32'h0 : ($op[1] ? ($op[0] ? $div : $prod):($op[0] ? $diff : $sum));
         
              $cnt[31:0] = $reset ? 0 : (>>1$cnt + 1); 	
```     

<img width="1678" alt="cntr_pipeline_reset" src="https://github.com/user-attachments/assets/05891faa-db91-4c68-b486-2b0d7d805ddb">

**2. 2cycle pipelined Calculator:** 
The single stage calculator integrated with a counter can be extended to a 2 stage pipelined architecture. A valid signal along with reset forces the operation-decidiing mux to force an output value of 0.

<img width="591" alt="Screenshot 2024-08-18 at 9 33 08 PM" src="https://github.com/user-attachments/assets/71c9a093-e22d-42f9-9d36-9414e239115b">    

The TL verilog code for two stage calculator is shown below:

```
    $reset = *reset;
    $op[1:0] = $random[1:0];
    $val2[31:0] = $rand2[3:0];
   
    |calc
      @1
         $val1[31:0] = >>2$out;
         $sum[31:0] = $val1+$val2;
         $diff[31:0] = $val1-$val2;
         $prod[31:0] = $val1*$val2;
         $div[31:0] = $val1/$val2;
         $valid = $reset ? 0 : (>>1$valid + 1);
      @2
         $out[31:0] = ($reset | ~($valid))  ? 32'h0 : ($op[1] ? ($op[0] ? $div : $prod):($op[0] ? $diff : $sum));
```     

<img width="1669" alt="cycl2Calc_validsignal" src="https://github.com/user-attachments/assets/405ccc6b-24eb-4297-b24b-e058f294b8db">

**3. 2 Cycle Calculator with Valid_or_reset:**   

The block diagram of 2 Cycle calculator with validity is shown below :

<img width="591" alt="Screenshot 2024-08-18 at 9 33 08 PM" src="https://github.com/user-attachments/assets/06b3c553-c18c-4863-b5ef-d75066fc1dff">

The TL verilog code is given below:

```
   $reset = *reset;
   |calc
      @1
         $valid = $reset ? 0 : >>1$valid+1;
         $valid_or_reset = $valid || $reset;
	 
      ?$valid_or_reset
         @1
            $val1[31:0] = >>2$out;
            $sum[31:0] = $val1+$val2;
            $diff[31:0] = $val1-$val2;
            $prod[31:0] = $val1*$val2;
            $div[31:0] = $val1/$val2;
            $valid = $reset ? 0 : (>>1$valid + 1);
         @2
            $out[31:0] =  ($op[1:0] == 2'b00) ? $sum :
                          ($op[1:0] == 2'b01) ? $diff :
                          ($op[1:0] == 2'b10) ? $prod :
                           $quot ;
```   

<img width="1669" alt="cycl2Calc_validsignal" src="https://github.com/user-attachments/assets/c4428719-e8a3-44bb-9547-e1b72adccf63">

**4. Calculator with Single Value Memory:**

<img width="639" alt="CALC_withMemory copy" src="https://github.com/user-attachments/assets/f0dcb58f-c592-4e80-963f-78dd56d2fc21">


The TL-Verilog code is given below:
```
   |calc
      @0
         $reset = *reset;
         
      @1
         $val1 [31:0] = >>2$out;
         $val2 [31:0] = $rand2[3:0];
         
         $valid = $reset ? 1'b0 : >>1$valid + 1'b1 ;
         $valid_or_reset = $valid || $reset;
         
      ?$vaild_or_reset
         @1   
            $sum [31:0] = $val1 + $val2;
            $diff[31:0] = $val1 - $val2;
            $prod[31:0] = $val1 * $val2;
            $div[31:0] = $val1 / $val2;
            
         @2   
            $mem[31:0] = $reset ? 32'b0 :
                         ($op[2:0] == 3'b101) ? $val1 : >>2$mem ;
            
            $out [31:0] = $reset ? 32'b0 :
                          ($op[2:0] == 3'b000) ? $sum :
                          ($op[2:0] == 3'b001) ? $diff :
                          ($op[2:0] == 3'b010) ? $prod :
                          ($op[2:0] == 3'b011) ? $quot :
                          ($op[2:0] == 3'b100) ? >>2$mem : >>2$out ;
```    

<img width="1679" alt="CALC_withMemory" src="https://github.com/user-attachments/assets/2d634f17-1f9b-42f2-a6b6-e987f9cb6ebd">    

**5. Distance accumulator:**

<img width="694" alt="Screenshot 2024-08-21 at 5 43 02 PM" src="https://github.com/user-attachments/assets/7e314ca3-d716-4bcb-897f-95bd4e578496">    

The TL-Verilog code is given below:

```
   |calc
      @1
         $reset = *reset;
      ?$valid
         @1
            $aa_sq[31:0] = $aa[3:0] * $aa;
            $bb_sq[31:0] = $bb[3:0] * $bb;
         @2
            $cc_sq[31:0] = $aa_sq + $bb_sq;
         @3
            $out[31:0] = sqrt($cc_sq);
       @4
          $tot_dist[31:0] = $reset ? '0 : 
	                    $valid ? (>>1$tot_dist + $out) : 
		            >>1$tot_dist;

```    

<img width="1678" alt="valid_signal" src="https://github.com/user-attachments/assets/378f3a62-869d-42db-812c-6b5bf3bfc704">

---------

## Day4- Building a RISC-V CPU core Micro-architecture:

Micro-architecture describes how a processor is built and designed. Micro-architecture defines, the number and size of caches, cycle counts of instructions, pipeline length, and more. The basic RISC-V CPU block diagram is shown below :    

<img width="790" alt="Top_level" src="https://github.com/user-attachments/assets/b082e7e0-8f18-498d-a869-682747bf079a">    

<img width="859" alt="Screenshot 2024-08-18 at 10 35 25 PM" src="https://github.com/user-attachments/assets/d007bb50-d34a-4afa-aa4f-1cd550550457">     


## 1. Program Counter  

The program counter is a special register in a CPU that keeps track of the memory address of the next instruction to be fetched and executed. It is incremented as instructions are fetched, and it provides the address to the instruction memory for fetching the next instruction in the program.    


<img width="927" alt="Screenshot 2024-08-18 at 10 36 23 PM" src="https://github.com/user-attachments/assets/8a7007b2-8f3f-43bf-9aa1-10932ecff22a">


The TL-Verilog code for the program counter is shown below :   

```
	\m4_TLV_version 1d: tl-x.org
	\SV
	   // This code can be found in: https://github.com/stevehoover/RISC-V_MYTH_Workshop
	   
	   m4_include_lib(['https://raw.githubusercontent.com/BalaDhinesh/RISC-V_MYTH_Workshop/master/tlv_lib/risc-v_shell_lib.tlv'])
	
	\SV
	   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
	\TLV
	
	   // /====================\
	   // | Sum 1 to 9 Program |
	   // \====================/
	   //
	   // Program for MYTH Workshop to test RV32I
	   // Add 1,2,3,...,9 (in that order).
	   //
	   // Regs:
	   //  r10 (a0): In: 0, Out: final sum
	   //  r12 (a2): 10
	   //  r13 (a3): 1..10
	   //  r14 (a4): Sum
	   // 
	   // External to function:
	   m4_asm(ADD, r10, r0, r0)             // Initialize r10 (a0) to 0.
	   // Function:
	   m4_asm(ADD, r14, r10, r0)            // Initialize sum register a4 with 0x0
	   m4_asm(ADDI, r12, r10, 1010)         // Store count of 10 in register a2.
	   m4_asm(ADD, r13, r10, r0)            // Initialize intermediate sum register a3 with 0
	   // Loop:
	   m4_asm(ADD, r14, r13, r14)           // Incremental addition
	   m4_asm(ADDI, r13, r13, 1)            // Increment intermediate register by 1
	   m4_asm(BLT, r13, r12, 1111111111000) // If a3 is less than a2, branch to label named <loop>
	   m4_asm(ADD, r10, r14, r0)            // Store final result to register a0 so that it can be read by main program
	   
	   // Optional:
	   // m4_asm(JAL, r7, 00000000000000000000) // Done. Jump to itself (infinite loop). (Up to 20-bit signed immediate plus implicit 0 bit (unlike JALR) provides byte 		address; last immediate bit should also be 0)
	   m4_define_hier(['M4_IMEM'], M4_NUM_INSTRS)
	
	   |cpu
	      @0
	         $reset = *reset;
		
	
	      // YOUR CODE HERE
	      // ...
	      @0
	         $pc[31:0] = >>1$reset ? 32'd0 : (>>1$pc+32'd4);
	      // Note: Because of the magic we are using for visualisation, if visualisation is enabled below,
	      //       be sure to avoid having unassigned signals (which you might be using for random inputs)
	      //       other than those specifically expected in the labs. You'll get strange errors for these.
	
	   
	   // Assert these to end simulation (before Makerchip cycle limit).
	   *passed = *cyc_cnt > 40;
	   *failed = 1'b0;
	   
	   // Macro instantiations for:
	   //  o instruction memory
	   //  o register file
	   //  o data memory
	   //  o CPU visualization
	   |cpu
	      //m4+imem(@1)    // Args: (read stage)
	      //m4+rf(@1, @1)  // Args: (read stage, write stage) - if equal, no register bypass is required
	      //m4+dmem(@4)    // Args: (read/write stage)
	      //m4+myth_fpga(@0)  // Uncomment to run on fpga
	
	   //m4+cpu_viz(@4)    // For visualisation, argument should be at least equal to the last stage of CPU logic. @4 would work for all labs.
	\SV
	   endmodule
```       


<img width="1644" alt="PC_1stBlock" src="https://github.com/user-attachments/assets/186187f7-9aa1-49de-a2b4-cf365804d16f">       


## 2. Instruction Fetch   

The Instruction Fetch Unit (IFU) in a CPU is responsible for ensuring that program instructions are retrieved from memory and executed in the correct order, serving as a crucial part of the core's control logic. The program counter plays a key role by indicating the address of the next instruction that needs to be fetched from the instruction memory. This step is essential for continuing the program’s execution and performing subsequent computations.

In this setup, the instruction memory is integrated into the program, allowing the Instruction Fetch logic to access and retrieve the required instructions. Once an instruction is fetched, it is passed on to the Decode logic for further processing. The program counter provides the read address for the instruction memory, which in turn outputs a 32-bit instruction (instr[31:0]). This sequence ensures that instructions are fetched and processed efficiently, maintaining the flow of the program.   


<img width="1059" alt="Screenshot 2024-08-18 at 10 57 38 PM" src="https://github.com/user-attachments/assets/fb61c90e-23d1-4473-a830-32ce5da002ef">


TL verilog code for Instruction Fetch is:   

```    
	\m4_TLV_version 1d: tl-x.org
	\SV
	   // This code can be found in: https://github.com/stevehoover/RISC-V_MYTH_Workshop
	   
	   m4_include_lib(['https://raw.githubusercontent.com/BalaDhinesh/RISC-V_MYTH_Workshop/master/tlv_lib/risc-v_shell_lib.tlv'])
	
	\SV
	   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
	\TLV
	
	   // /====================\
	   // | Sum 1 to 9 Program |
	   // \====================/
	   //
	   // Program for MYTH Workshop to test RV32I
	   // Add 1,2,3,...,9 (in that order).
	   //
	   // Regs:
	   //  r10 (a0): In: 0, Out: final sum
	   //  r12 (a2): 10
	   //  r13 (a3): 1..10
	   //  r14 (a4): Sum
	   // 
	   // External to function:
	   m4_asm(ADD, r10, r0, r0)             // Initialize r10 (a0) to 0.
	   // Function:
	   m4_asm(ADD, r14, r10, r0)            // Initialize sum register a4 with 0x0
	   m4_asm(ADDI, r12, r10, 1010)         // Store count of 10 in register a2.
	   m4_asm(ADD, r13, r10, r0)            // Initialize intermediate sum register a3 with 0
	   // Loop:
	   m4_asm(ADD, r14, r13, r14)           // Incremental addition
	   m4_asm(ADDI, r13, r13, 1)            // Increment intermediate register by 1
	   m4_asm(BLT, r13, r12, 1111111111000) // If a3 is less than a2, branch to label named <loop>
	   m4_asm(ADD, r10, r14, r0)            // Store final result to register a0 so that it can be read by main program
	   
	   // Optional:
	   // m4_asm(JAL, r7, 00000000000000000000) // Done. Jump to itself (infinite loop). (Up to 20-bit signed immediate plus implicit 0 bit (unlike JALR) provides byte 
	     address; last immediate bit should also be 0)
	   m4_define_hier(['M4_IMEM'], M4_NUM_INSTRS)
	
	   |cpu
	      @0
	         $reset = *reset;	
	
	      // YOUR CODE HERE
	      // ...
	      @0
	         $pc[31:0] = >>1$reset ? 32'd0 : (>>1$pc+32'd4);
	      @1
	         $imem_rd_en = !$reset;
	         $imem_rd_addr[M4_IMEM_INDEX_CNT-1:0] = $pc[M4_IMEM_INDEX_CNT+1:2];
	         $instr[31:0] = $imem_rd_data[31:0];
	      ?$imem_rd_en
	         @1
	            $imem_rd_data[31:0] = /imem[$imem_rd_addr]$instr;
	      // Note: Because of the magic we are using for visualisation, if visualisation is enabled below,
	      //       be sure to avoid having unassigned signals (which you might be using for random inputs)
	      //       other than those specifically expected in the labs. You'll get strange errors for these.
	
	   
	   // Assert these to end simulation (before Makerchip cycle limit).
	   *passed = *cyc_cnt > 40;
	   *failed = 1'b0;
	   
	   // Macro instantiations for:
	   //  o instruction memory
	   //  o register file
	   //  o data memory
	   //  o CPU visualization
	   |cpu
	      m4+imem(@1)    // Args: (read stage)
	      //m4+rf(@1, @1)  // Args: (read stage, write stage) - if equal, no register bypass is required
	      //m4+dmem(@4)    // Args: (read/write stage)
	      //m4+myth_fpga(@0)  // Uncomment to run on fpga
	
	   m4+cpu_viz(@4)    // For visualisation, argument should be at least equal to the last stage of CPU logic. @4 would work for all labs.
	\SV
	   endmodule   
```    

 
<img width="1665" alt="Screenshot 2024-08-18 at 11 07 18 PM" src="https://github.com/user-attachments/assets/50504db4-f31d-4d34-b311-22f61992d24d">    


<img width="1671" alt="Screenshot 2024-08-18 at 11 07 05 PM" src="https://github.com/user-attachments/assets/4063a759-baaa-46d6-b984-36c07b5e240d">


## 3. Instruction Decoder:

The instruction decoder is a circuit within the CPU that interprets the machine instructions fetched from memory. It decodes the binary representation of the instruction and generates control signals that govern the operation of other components in the CPU to execute the instruction.    


<img width="797" alt="Screenshot 2024-08-18 at 11 27 08 PM" src="https://github.com/user-attachments/assets/6abfb272-5480-4b36-941c-dc4fc2626560">     


The TL verilog code is given below:

```
	\m4_TLV_version 1d: tl-x.org
	\SV
	   // This code can be found in: https://github.com/stevehoover/RISC-V_MYTH_Workshop
	   
	   m4_include_lib(['https://raw.githubusercontent.com/BalaDhinesh/RISC-V_MYTH_Workshop/master/tlv_lib/risc-v_shell_lib.tlv'])
	
	\SV
	   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
	\TLV
	
	   // /====================\
	   // | Sum 1 to 9 Program |
	   // \====================/
	   //
	   // Program for MYTH Workshop to test RV32I
	   // Add 1,2,3,...,9 (in that order).
	   //
	   // Regs:
	   //  r10 (a0): In: 0, Out: final sum
	   //  r12 (a2): 10
	   //  r13 (a3): 1..10
	   //  r14 (a4): Sum
	   // 
	   // External to function:
	   m4_asm(ADD, r10, r0, r0)             // Initialize r10 (a0) to 0.
	   // Function:
	   m4_asm(ADD, r14, r10, r0)            // Initialize sum register a4 with 0x0
	   m4_asm(ADDI, r12, r10, 1010)         // Store count of 10 in register a2.
	   m4_asm(ADD, r13, r10, r0)            // Initialize intermediate sum register a3 with 0
	   // Loop:
	   m4_asm(ADD, r14, r13, r14)           // Incremental addition
	   m4_asm(ADDI, r13, r13, 1)            // Increment intermediate register by 1
	   m4_asm(BLT, r13, r12, 1111111111000) // If a3 is less than a2, branch to label named <loop>
	   m4_asm(ADD, r10, r14, r0)            // Store final result to register a0 so that it can be read by main program
	   
	   // Optional:
	   // m4_asm(JAL, r7, 00000000000000000000) // Done. Jump to itself (infinite loop). (Up to 20-bit signed immediate plus implicit 0 bit (unlike JALR) provides byte 
           address; last immediate bit should also be 0)
	   m4_define_hier(['M4_IMEM'], M4_NUM_INSTRS)
	
	   |cpu
	      @0
	         $reset = *reset;
	
	
	
	      // YOUR CODE HERE
	      // ...
	      @0
	         $pc[31:0] = >>1$reset ? 32'd0 : (>>1$pc+32'd4);
	      @1
	         //Instruction Fetch
	         $imem_rd_en = !$reset;
	         $imem_rd_addr[M4_IMEM_INDEX_CNT-1:0] = $pc[M4_IMEM_INDEX_CNT+1:2];
	         $instr[31:0] = $imem_rd_data[31:0];
	      ?$imem_rd_en
	         @1
	            $imem_rd_data[31:0] = /imem[$imem_rd_addr]$instr;
	      @1
	         //Instruction Decode
	         $is_i_instr = $instr[6:2] ==? 5'b0000x ||
	                       $instr[6:2] ==? 5'b001x0 ||
	                       $instr[6:2] ==? 5'b11001 ||
	                       $instr[6:2] ==? 5'b11100;
	         
	         $is_u_instr = $instr[6:2] ==? 5'b0x101;
	         
	         $is_r_instr = $instr[6:2] ==? 5'b01011 ||
	                       $instr[6:2] ==? 5'b011x0 ||
	                       $instr[6:2] ==? 5'b10100;
	         
	         $is_b_instr = $instr[6:2] ==? 5'b11000;
	         
	         $is_j_instr = $instr[6:2] ==? 5'b11011;
	         
	         $is_s_instr = $instr[6:2] ==? 5'b0100x;
	         
	         $imm[31:0] = $is_i_instr ? {{21{$instr[31]}}, $instr[30:20]} :
	                      $is_s_instr ? {{21{$instr[31]}}, $instr[30:25], $instr[11:7]} :
	                      $is_b_instr ? {{20{$instr[31]}}, $instr[7], $instr[30:25], $instr[11:8], 1'b0} :
	                      $is_u_instr ? {$instr[31:12], 12'b0} :
	                      $is_j_instr ? {{12{$instr[31]}}, $instr[19:12], $instr[20], $instr[30:21], 1'b0} :
	                                    32'b0;
	         $opcode[6:0] = $instr[6:0];
	         
	         $rs2_valid = $is_r_instr || $is_s_instr || $is_b_instr;
	         ?$rs2_valid
	            $rs2[4:0] = $instr[24:20];
	            
	         $rs1_valid = $is_r_instr || $is_i_instr || $is_s_instr || $is_b_instr;
	         ?$rs1_valid
	            $rs1[4:0] = $instr[19:15];
	         
	         $funct3_valid = $is_r_instr || $is_i_instr || $is_s_instr || $is_b_instr;
	         ?$funct3_valid
	            $funct3[2:0] = $instr[14:12];
	            
	         $funct7_valid = $is_r_instr ;
	         ?$funct7_valid
	            $funct7[6:0] = $instr[31:25];
	            
	         $rd_valid = $is_r_instr || $is_i_instr || $is_u_instr || $is_j_instr;
	         ?$rd_valid
	            $rd[4:0] = $instr[11:7];
	            
	         $dec_bits [10:0] = {$funct7[5], $funct3, $opcode};
	         $is_beq = $dec_bits ==? 11'bx_000_1100011;
	         $is_bne = $dec_bits ==? 11'bx_001_1100011;
	         $is_blt = $dec_bits ==? 11'bx_100_1100011;
	         $is_bge = $dec_bits ==? 11'bx_101_1100011;
	         $is_bltu = $dec_bits ==? 11'bx_110_1100011;
	         $is_bgeu = $dec_bits ==? 11'bx_111_1100011;
	         $is_addi = $dec_bits ==? 11'bx_000_0010011;
	         $is_add = $dec_bits ==? 11'b0_000_0110011;
	      
	      // Note: Because of the magic we are using for visualisation, if visualisation is enabled below,
	      //       be sure to avoid having unassigned signals (which you might be using for random inputs)
	      //       other than those specifically expected in the labs. You'll get strange errors for these.
	
	   
	   // Assert these to end simulation (before Makerchip cycle limit).
	   *passed = *cyc_cnt > 40;
	   *failed = 1'b0;
	   
	   // Macro instantiations for:
	   //  o instruction memory
	   //  o register file
	   //  o data memory
	   //  o CPU visualization
	   |cpu
	      m4+imem(@1)    // Args: (read stage)
	      //m4+rf(@1, @1)  // Args: (read stage, write stage) - if equal, no register bypass is required
	      //m4+dmem(@4)    // Args: (read/write stage)
	      //m4+myth_fpga(@0)  // Uncomment to run on fpga
	
	   m4+cpu_viz(@4)    // For visualisation, argument should be at least equal to the last stage of CPU logic. @4 would work for all labs.
	\SV
	   endmodule    

```       



<img width="1631" alt="imme_bits" src="https://github.com/user-attachments/assets/778bf196-147c-4fcf-8e13-e284025a8be0">     



<img width="1632" alt="Screenshot 2024-08-18 at 11 17 43 PM" src="https://github.com/user-attachments/assets/c5e5087a-4f25-4c72-959c-88ba276ddebb">     



<img width="1619" alt="other_fields_decode" src="https://github.com/user-attachments/assets/8f30278b-835f-482b-8ea4-5b7ea6bb56eb">    


## 4. Register File Read   

Most instructions, particularly arithmetic ones, require data from source registers, which means the CPU needs to read from these registers. To facilitate this, the CPU's register file is designed to handle two simultaneous reads for the source operands (rs1 and rs2) and one write operation per cycle to the destination register. The register file receives rs1 and rs2 as inputs and outputs the corresponding register values. The enable bits for rs1 and rs2 are activated based on their validity, as determined earlier in the process. This setup, known as a 2-port register file, allows the CPU to read from two registers at the same time. The retrieved data is then stored in registers and sent to the ALU for further processing.    


<img width="896" alt="RF_read" src="https://github.com/user-attachments/assets/b616c16f-8a1f-4c6c-b929-8e3bfe345b83">

   
The TL-Verilog code is given below :

```
	\m4_TLV_version 1d: tl-x.org
	\SV
	   // This code can be found in: https://github.com/stevehoover/RISC-V_MYTH_Workshop
	   
	   m4_include_lib(['https://raw.githubusercontent.com/BalaDhinesh/RISC-V_MYTH_Workshop/master/tlv_lib/risc-v_shell_lib.tlv'])
	
	\SV
	   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
	\TLV
	
	   // /====================\
	   // | Sum 1 to 9 Program |
	   // \====================/
	   //
	   // Program for MYTH Workshop to test RV32I
	   // Add 1,2,3,...,9 (in that order).
	   //
	   // Regs:
	   //  r10 (a0): In: 0, Out: final sum
	   //  r12 (a2): 10
	   //  r13 (a3): 1..10
	   //  r14 (a4): Sum
	   // 
	   // External to function:
	   m4_asm(ADD, r10, r0, r0)             // Initialize r10 (a0) to 0.
	   // Function:
	   m4_asm(ADD, r14, r10, r0)            // Initialize sum register a4 with 0x0
	   m4_asm(ADDI, r12, r10, 1010)         // Store count of 10 in register a2.
	   m4_asm(ADD, r13, r10, r0)            // Initialize intermediate sum register a3 with 0
	   // Loop:
	   m4_asm(ADD, r14, r13, r14)           // Incremental addition
	   m4_asm(ADDI, r13, r13, 1)            // Increment intermediate register by 1
	   m4_asm(BLT, r13, r12, 1111111111000) // If a3 is less than a2, branch to label named <loop>
	   m4_asm(ADD, r10, r14, r0)            // Store final result to register a0 so that it can be read by main program
	   
	   // Optional:
	   // m4_asm(JAL, r7, 00000000000000000000) // Done. Jump to itself (infinite loop). (Up to 20-bit signed immediate plus implicit 0 bit (unlike JALR) provides byte 	   address; last immediate bit should also be 0)
	   m4_define_hier(['M4_IMEM'], M4_NUM_INSTRS)
	
	   |cpu
	      @0
	         $reset = *reset;
	
	
	
	      // YOUR CODE HERE
	      // ...
	      @0
	         $pc[31:0] = >>1$reset ? 32'd0 : (>>1$pc+32'd4);
	      @1
	         //Instruction Fetch
	         $imem_rd_en = !$reset;
	         $imem_rd_addr[M4_IMEM_INDEX_CNT-1:0] = $pc[M4_IMEM_INDEX_CNT+1:2];
	         $instr[31:0] = $imem_rd_data[31:0];
	      ?$imem_rd_en
	         @1
	            $imem_rd_data[31:0] = /imem[$imem_rd_addr]$instr;
	      @1
	         //Instruction Decode
	         $is_i_instr = $instr[6:2] ==? 5'b0000x ||
	                       $instr[6:2] ==? 5'b001x0 ||
	                       $instr[6:2] ==? 5'b11001 ||
	                       $instr[6:2] ==? 5'b11100;
	         
	         $is_u_instr = $instr[6:2] ==? 5'b0x101;
	         
	         $is_r_instr = $instr[6:2] ==? 5'b01011 ||
	                       $instr[6:2] ==? 5'b011x0 ||
	                       $instr[6:2] ==? 5'b10100;
	         
	         $is_b_instr = $instr[6:2] ==? 5'b11000;
	         
	         $is_j_instr = $instr[6:2] ==? 5'b11011;
	         
	         $is_s_instr = $instr[6:2] ==? 5'b0100x;
	         
	         $imm[31:0] = $is_i_instr ? {{21{$instr[31]}}, $instr[30:20]} :
	                      $is_s_instr ? {{21{$instr[31]}}, $instr[30:25], $instr[11:7]} :
	                      $is_b_instr ? {{20{$instr[31]}}, $instr[7], $instr[30:25], $instr[11:8], 1'b0} :
	                      $is_u_instr ? {$instr[31:12], 12'b0} :
	                      $is_j_instr ? {{12{$instr[31]}}, $instr[19:12], $instr[20], $instr[30:21], 1'b0} :
	                                    32'b0;
	         $opcode[6:0] = $instr[6:0];
	         
	         $rs2_valid = $is_r_instr || $is_s_instr || $is_b_instr;
	         ?$rs2_valid
	            $rs2[4:0] = $instr[24:20];
	            
	         $rs1_valid = $is_r_instr || $is_i_instr || $is_s_instr || $is_b_instr;
	         ?$rs1_valid
	            $rs1[4:0] = $instr[19:15];
	         
	         $funct3_valid = $is_r_instr || $is_i_instr || $is_s_instr || $is_b_instr;
	         ?$funct3_valid
	            $funct3[2:0] = $instr[14:12];
	            
	         $funct7_valid = $is_r_instr ;
	         ?$funct7_valid
	            $funct7[6:0] = $instr[31:25];
	            
	         $rd_valid = $is_r_instr || $is_i_instr || $is_u_instr || $is_j_instr;
	         ?$rd_valid
	            $rd[4:0] = $instr[11:7];
	            
	         $dec_bits [10:0] = {$funct7[5], $funct3, $opcode};
	         $is_beq = $dec_bits ==? 11'bx_000_1100011;
	         $is_bne = $dec_bits ==? 11'bx_001_1100011;
	         $is_blt = $dec_bits ==? 11'bx_100_1100011;
	         $is_bge = $dec_bits ==? 11'bx_101_1100011;
	         $is_bltu = $dec_bits ==? 11'bx_110_1100011;
	         $is_bgeu = $dec_bits ==? 11'bx_111_1100011;
	         $is_addi = $dec_bits ==? 11'bx_000_0010011;
	         $is_add = $dec_bits ==? 11'b0_000_0110011;
	         
	      @1
	         //Register File Read
	         $rf_wr_en = 1'b0;
	         $rf_wr_index[4:0] = 5'b0;
	         $rf_wr_data[31:0] = 32'b0;
	         
	         $rf_rd_en1 = $rs1_valid;
	         $rf_rd_index1[4:0] = $rs1;
	         
	         $rf_rd_en2 = $rs2_valid;
	         $rf_rd_index2[4:0] = $rs2;
	         
	         $src1_value[31:0] = $rf_rd_data1;
	         $src2_value[31:0] = $rf_rd_data2;
	         
	      // Note: Because of the magic we are using for visualisation, if visualisation is enabled below,
	      //       be sure to avoid having unassigned signals (which you might be using for random inputs)
	      //       other than those specifically expected in the labs. You'll get strange errors for these.
	
	   
	   // Assert these to end simulation (before Makerchip cycle limit).
	   *passed = *cyc_cnt > 40;
	   *failed = 1'b0;
	   
	   // Macro instantiations for:
	   //  o instruction memory
	   //  o register file
	   //  o data memory
	   //  o CPU visualization
	   |cpu
	      m4+imem(@1)    // Args: (read stage)
	      m4+rf(@1, @1)  // Args: (read stage, write stage) - if equal, no register bypass is required
	      //m4+dmem(@4)    // Args: (read/write stage)
	      //m4+myth_fpga(@0)  // Uncomment to run on fpga
	
	   m4+cpu_viz(@4)    // For visualisation, argument should be at least equal to the last stage of CPU logic. @4 would work for all labs.
	\SV
	   endmodule

```

## 5. ALU 

The ALU is a fundamental digital circuit within the CPU that performs arithmetic and logical operations on data. It can perform tasks such as addition, subtraction, multiplication, division, bitwise operations (AND, OR, XOR), and comparisons. The ALU generates results that are used in various computations specified by the instructions.   


<img width="924" alt="ALU_BLOCK" src="https://github.com/user-attachments/assets/69717c56-bf73-4110-bdb3-db9c67dc6200">


The TL-Verilog Code is given below:    

```
	\m4_TLV_version 1d: tl-x.org
	\SV
	   // This code can be found in: https://github.com/stevehoover/RISC-V_MYTH_Workshop
	   
	   m4_include_lib(['https://raw.githubusercontent.com/BalaDhinesh/RISC-V_MYTH_Workshop/master/tlv_lib/risc-v_shell_lib.tlv'])
	
	\SV
	   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
	\TLV
	
	   // /====================\
	   // | Sum 1 to 9 Program |
	   // \====================/
	   //
	   // Program for MYTH Workshop to test RV32I
	   // Add 1,2,3,...,9 (in that order).
	   //
	   // Regs:
	   //  r10 (a0): In: 0, Out: final sum
	   //  r12 (a2): 10
	   //  r13 (a3): 1..10
	   //  r14 (a4): Sum
	   // 
	   // External to function:
	   m4_asm(ADD, r10, r0, r0)             // Initialize r10 (a0) to 0.
	   // Function:
	   m4_asm(ADD, r14, r10, r0)            // Initialize sum register a4 with 0x0
	   m4_asm(ADDI, r12, r10, 1010)         // Store count of 10 in register a2.
	   m4_asm(ADD, r13, r10, r0)            // Initialize intermediate sum register a3 with 0
	   // Loop:
	   m4_asm(ADD, r14, r13, r14)           // Incremental addition
	   m4_asm(ADDI, r13, r13, 1)            // Increment intermediate register by 1
	   m4_asm(BLT, r13, r12, 1111111111000) // If a3 is less than a2, branch to label named <loop>
	   m4_asm(ADD, r10, r14, r0)            // Store final result to register a0 so that it can be read by main program
	   
	   // Optional:
	   // m4_asm(JAL, r7, 00000000000000000000) // Done. Jump to itself (infinite loop). (Up to 20-bit signed immediate plus implicit 0 bit (unlike JALR) provides byte 	   address; last immediate bit should also be 0)
	   m4_define_hier(['M4_IMEM'], M4_NUM_INSTRS)
	
	   |cpu
	      @0
	         $reset = *reset;
	
	
	
	      // YOUR CODE HERE
	      // ...
	      @0
	         $pc[31:0] = >>1$reset ? 32'd0 : (>>1$pc+32'd4);
	      @1
	         //Instruction Fetch
	         $imem_rd_en = !$reset;
	         $imem_rd_addr[M4_IMEM_INDEX_CNT-1:0] = $pc[M4_IMEM_INDEX_CNT+1:2];
	         $instr[31:0] = $imem_rd_data[31:0];
	      ?$imem_rd_en
	         @1
	            $imem_rd_data[31:0] = /imem[$imem_rd_addr]$instr;
	      @1
	         //Instruction Decode
	         $is_i_instr = $instr[6:2] ==? 5'b0000x ||
	                       $instr[6:2] ==? 5'b001x0 ||
	                       $instr[6:2] ==? 5'b11001 ||
	                       $instr[6:2] ==? 5'b11100;
	         
	         $is_u_instr = $instr[6:2] ==? 5'b0x101;
	         
	         $is_r_instr = $instr[6:2] ==? 5'b01011 ||
	                       $instr[6:2] ==? 5'b011x0 ||
	                       $instr[6:2] ==? 5'b10100;
	         
	         $is_b_instr = $instr[6:2] ==? 5'b11000;
	         
	         $is_j_instr = $instr[6:2] ==? 5'b11011;
	         
	         $is_s_instr = $instr[6:2] ==? 5'b0100x;
	         
	         $imm[31:0] = $is_i_instr ? {{21{$instr[31]}}, $instr[30:20]} :
	                      $is_s_instr ? {{21{$instr[31]}}, $instr[30:25], $instr[11:7]} :
	                      $is_b_instr ? {{20{$instr[31]}}, $instr[7], $instr[30:25], $instr[11:8], 1'b0} :
	                      $is_u_instr ? {$instr[31:12], 12'b0} :
	                      $is_j_instr ? {{12{$instr[31]}}, $instr[19:12], $instr[20], $instr[30:21], 1'b0} :
	                                    32'b0;
	         $opcode[6:0] = $instr[6:0];
	         
	         $rs2_valid = $is_r_instr || $is_s_instr || $is_b_instr;
	         ?$rs2_valid
	            $rs2[4:0] = $instr[24:20];
	            
	         $rs1_valid = $is_r_instr || $is_i_instr || $is_s_instr || $is_b_instr;
	         ?$rs1_valid
	            $rs1[4:0] = $instr[19:15];
	         
	         $funct3_valid = $is_r_instr || $is_i_instr || $is_s_instr || $is_b_instr;
	         ?$funct3_valid
	            $funct3[2:0] = $instr[14:12];
	            
	         $funct7_valid = $is_r_instr ;
	         ?$funct7_valid
	            $funct7[6:0] = $instr[31:25];
	            
	         $rd_valid = $is_r_instr || $is_i_instr || $is_u_instr || $is_j_instr;
	         ?$rd_valid
	            $rd[4:0] = $instr[11:7];
	            
	         $dec_bits [10:0] = {$funct7[5], $funct3, $opcode};
	         $is_beq = $dec_bits ==? 11'bx_000_1100011;
	         $is_bne = $dec_bits ==? 11'bx_001_1100011;
	         $is_blt = $dec_bits ==? 11'bx_100_1100011;
	         $is_bge = $dec_bits ==? 11'bx_101_1100011;
	         $is_bltu = $dec_bits ==? 11'bx_110_1100011;
	         $is_bgeu = $dec_bits ==? 11'bx_111_1100011;
	         $is_addi = $dec_bits ==? 11'bx_000_0010011;
	         $is_add = $dec_bits ==? 11'b0_000_0110011;
	         
	      @1
	         //Register File Read
	         $rf_wr_en = 1'b0;
	         $rf_wr_index[4:0] = 5'b0;
	         $rf_wr_data[31:0] = 32'b0;
	         
	         $rf_rd_en1 = $rs1_valid;
	         $rf_rd_index1[4:0] = $rs1;
	         
	         $rf_rd_en2 = $rs2_valid;
	         $rf_rd_index2[4:0] = $rs2;
	         
	         $src1_value[31:0] = $rf_rd_data1;
	         $src2_value[31:0] = $rf_rd_data2;
	         
	      @1
	         //ALU
	         $result[31:0] = $is_addi ? $src1_value + $imm :
	                         $is_add ? $src1_value + $src2_value :
	                         32'bx ;
	         
	      // Note: Because of the magic we are using for visualisation, if visualisation is enabled below,
	      //       be sure to avoid having unassigned signals (which you might be using for random inputs)
	      //       other than those specifically expected in the labs. You'll get strange errors for these.
	
	   
	   // Assert these to end simulation (before Makerchip cycle limit).
	   *passed = *cyc_cnt > 40;
	   *failed = 1'b0;
	   
	   // Macro instantiations for:
	   //  o instruction memory
	   //  o register file
	   //  o data memory
	   //  o CPU visualization
	   |cpu
	      m4+imem(@1)    // Args: (read stage)
	      m4+rf(@1, @1)  // Args: (read stage, write stage) - if equal, no register bypass is required
	      //m4+dmem(@4)    // Args: (read/write stage)
	      //m4+myth_fpga(@0)  // Uncomment to run on fpga
	
	   m4+cpu_viz(@4)    // For visualisation, argument should be at least equal to the last stage of CPU logic. @4 would work for all labs.
	\SV
	   endmodule   
   
```    

<img width="1639" alt="ALU" src="https://github.com/user-attachments/assets/08c62efe-4566-4127-9ead-b854290b5991">      


## 6. Register File Write

The write register file is responsible for storing the results of operations back into registers. After an instruction is executed, the result is often written back to the register file. This ensures that the updated data is available for subsequent instructions.

These components work together to execute machine instructions in a CPU. The program counter guides the instruction fetch process, the instruction decoder interprets instructions, the ALU performs computations, the register files hold data, and the memory components provide data storage and access. This orchestration allows a CPU to carry out the tasks required by a program's instructions.   


The TL-Verilog code is given below :      

```     
	\m4_TLV_version 1d: tl-x.org
	\SV
	   // This code can be found in: https://github.com/stevehoover/RISC-V_MYTH_Workshop
	   
	   m4_include_lib(['https://raw.githubusercontent.com/BalaDhinesh/RISC-V_MYTH_Workshop/master/tlv_lib/risc-v_shell_lib.tlv'])
	
	\SV
	   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
	\TLV
	
	   // /====================\
	   // | Sum 1 to 9 Program |
	   // \====================/
	   //
	   // Program for MYTH Workshop to test RV32I
	   // Add 1,2,3,...,9 (in that order).
	   //
	   // Regs:
	   //  r10 (a0): In: 0, Out: final sum
	   //  r12 (a2): 10
	   //  r13 (a3): 1..10
	   //  r14 (a4): Sum
	   // 
	   // External to function:
	   m4_asm(ADD, r10, r0, r0)             // Initialize r10 (a0) to 0.
	   // Function:
	   m4_asm(ADD, r14, r10, r0)            // Initialize sum register a4 with 0x0
	   m4_asm(ADDI, r12, r10, 1010)         // Store count of 10 in register a2.
	   m4_asm(ADD, r13, r10, r0)            // Initialize intermediate sum register a3 with 0
	   // Loop:
	   m4_asm(ADD, r14, r13, r14)           // Incremental addition
	   m4_asm(ADDI, r13, r13, 1)            // Increment intermediate register by 1
	   m4_asm(BLT, r13, r12, 1111111111000) // If a3 is less than a2, branch to label named <loop>
	   m4_asm(ADD, r10, r14, r0)            // Store final result to register a0 so that it can be read by main program
	   
	   // Optional:
	   // m4_asm(JAL, r7, 00000000000000000000) // Done. Jump to itself (infinite loop). (Up to 20-bit signed immediate plus implicit 0 bit (unlike JALR) provides byte 		address; last immediate bit should also be 0)
	   m4_define_hier(['M4_IMEM'], M4_NUM_INSTRS)
	
	   |cpu
	      @0
	         $reset = *reset;
	
	
	
	      // YOUR CODE HERE
	      // ...
	      @0
	         $pc[31:0] = >>1$reset ? 32'd0 : (>>1$pc+32'd4);
	      @1
	         //Instruction Fetch
	         $imem_rd_en = !$reset;
	         $imem_rd_addr[M4_IMEM_INDEX_CNT-1:0] = $pc[M4_IMEM_INDEX_CNT+1:2];
	         $instr[31:0] = $imem_rd_data[31:0];
	      ?$imem_rd_en
	         @1
	            $imem_rd_data[31:0] = /imem[$imem_rd_addr]$instr;
	      @1
	         //Instruction Decode
	         $is_i_instr = $instr[6:2] ==? 5'b0000x ||
	                       $instr[6:2] ==? 5'b001x0 ||
	                       $instr[6:2] ==? 5'b11001 ||
	                       $instr[6:2] ==? 5'b11100;
	         
	         $is_u_instr = $instr[6:2] ==? 5'b0x101;
	         
	         $is_r_instr = $instr[6:2] ==? 5'b01011 ||
	                       $instr[6:2] ==? 5'b011x0 ||
	                       $instr[6:2] ==? 5'b10100;
	         
	         $is_b_instr = $instr[6:2] ==? 5'b11000;
	         
	         $is_j_instr = $instr[6:2] ==? 5'b11011;
	         
	         $is_s_instr = $instr[6:2] ==? 5'b0100x;
	         
	         $imm[31:0] = $is_i_instr ? {{21{$instr[31]}}, $instr[30:20]} :
	                      $is_s_instr ? {{21{$instr[31]}}, $instr[30:25], $instr[11:7]} :
	                      $is_b_instr ? {{20{$instr[31]}}, $instr[7], $instr[30:25], $instr[11:8], 1'b0} :
	                      $is_u_instr ? {$instr[31:12], 12'b0} :
	                      $is_j_instr ? {{12{$instr[31]}}, $instr[19:12], $instr[20], $instr[30:21], 1'b0} :
	                                    32'b0;
	         $opcode[6:0] = $instr[6:0];
	         
	         $rs2_valid = $is_r_instr || $is_s_instr || $is_b_instr;
	         ?$rs2_valid
	            $rs2[4:0] = $instr[24:20];
	            
	         $rs1_valid = $is_r_instr || $is_i_instr || $is_s_instr || $is_b_instr;
	         ?$rs1_valid
	            $rs1[4:0] = $instr[19:15];
	         
	         $funct3_valid = $is_r_instr || $is_i_instr || $is_s_instr || $is_b_instr;
	         ?$funct3_valid
	            $funct3[2:0] = $instr[14:12];
	            
	         $funct7_valid = $is_r_instr ;
	         ?$funct7_valid
	            $funct7[6:0] = $instr[31:25];
	            
	         $rd_valid = $is_r_instr || $is_i_instr || $is_u_instr || $is_j_instr;
	         ?$rd_valid 
	            $rd[4:0] = $instr[11:7]; //rd - Destination Register
	            
	         $dec_bits [10:0] = {$funct7[5], $funct3, $opcode};
	         $is_beq = $dec_bits ==? 11'bx_000_1100011;
	         $is_bne = $dec_bits ==? 11'bx_001_1100011;
	         $is_blt = $dec_bits ==? 11'bx_100_1100011;
	         $is_bge = $dec_bits ==? 11'bx_101_1100011;
	         $is_bltu = $dec_bits ==? 11'bx_110_1100011;
	         $is_bgeu = $dec_bits ==? 11'bx_111_1100011;
	         $is_addi = $dec_bits ==? 11'bx_000_0010011;
	         $is_add = $dec_bits ==? 11'b0_000_0110011;
	         
	      @1
	         //Register File Read
	         $rf_wr_en = 1'b0;
	         $rf_wr_index[4:0] = 5'b0;
	         $rf_wr_data[31:0] = 32'b0;
	         
	         $rf_rd_en1 = $rs1_valid;
	         $rf_rd_index1[4:0] = $rs1;
	         
	         $rf_rd_en2 = $rs2_valid;
	         $rf_rd_index2[4:0] = $rs2;
	         
	         $src1_value[31:0] = $rf_rd_data1;
	         $src2_value[31:0] = $rf_rd_data2;
	         
	      @1
	         //ALU
	         $result[31:0] = $is_addi ? $src1_value + $imm :
	                         $is_add ? $src1_value + $src2_value :
	                         32'bx ;
	      @1
	         //Register File Write
	         $rf_wr_en = $rd_valid && $rd != 5'b0;
	         $rf_wr_index[4:0] = $rd;
	         $rf_wr_data[31:0] = $result;
	         
	      // Note: Because of the magic we are using for visualisation, if visualisation is enabled below,
	      //       be sure to avoid having unassigned signals (which you might be using for random inputs)
	      //       other than those specifically expected in the labs. You'll get strange errors for these.
	
	   
	   // Assert these to end simulation (before Makerchip cycle limit).
	   *passed = *cyc_cnt > 40;
	   *failed = 1'b0;
	   
	   // Macro instantiations for:
	   //  o instruction memory
	   //  o register file
	   //  o data memory
	   //  o CPU visualization
	   |cpu
	      m4+imem(@1)    // Args: (read stage)
	      m4+rf(@1, @1)  // Args: (read stage, write stage) - if equal, no register bypass is required
	      //m4+dmem(@4)    // Args: (read/write stage)
	      //m4+myth_fpga(@0)  // Uncomment to run on fpga
	
	   m4+cpu_viz(@4)    // For visualisation, argument should be at least equal to the last stage of CPU logic. @4 would work for all labs.
	\SV
	   endmodule

```      


<img width="1613" alt="CPU_RF_write" src="https://github.com/user-attachments/assets/c71f0a1b-ddc3-426d-9f04-87982131b0b5">       



## 7. Branch Instructions

The last stage involves adding support for branch instructions. In the RISC-V instruction set architecture, branches are conditional, so a branch is executed only when a particular condition is fulfilled. Moreover, the target address for the branch (Program Counter or PC) needs to be computed. If the branch condition is met, the PC is updated to this new target address. This ensures that when a branch occurs, the program counter correctly points to the desired instruction.   


<img width="847" alt="Branch_instructions" src="https://github.com/user-attachments/assets/45dac366-7f73-4a2b-ada6-62e9cb3fe413">     


The TL-Verilog Code is given below :

```
	\m4_TLV_version 1d: tl-x.org
	\SV
	   // This code can be found in: https://github.com/stevehoover/RISC-V_MYTH_Workshop
	   
	   m4_include_lib(['https://raw.githubusercontent.com/BalaDhinesh/RISC-V_MYTH_Workshop/master/tlv_lib/risc-v_shell_lib.tlv'])
	
	\SV
	   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
	\TLV
	
	   // /====================\
	   // | Sum 1 to 9 Program |
	   // \====================/
	   //
	   // Program for MYTH Workshop to test RV32I
	   // Add 1,2,3,...,9 (in that order).
	   //
	   // Regs:
	   //  r10 (a0): In: 0, Out: final sum
	   //  r12 (a2): 10
	   //  r13 (a3): 1..10
	   //  r14 (a4): Sum
	   // 
	   // External to function:
	   m4_asm(ADD, r10, r0, r0)             // Initialize r10 (a0) to 0.
	   // Function:
	   m4_asm(ADD, r14, r10, r0)            // Initialize sum register a4 with 0x0
	   m4_asm(ADDI, r12, r10, 1010)         // Store count of 10 in register a2.
	   m4_asm(ADD, r13, r10, r0)            // Initialize intermediate sum register a3 with 0
	   // Loop:
	   m4_asm(ADD, r14, r13, r14)           // Incremental addition
	   m4_asm(ADDI, r13, r13, 1)            // Increment intermediate register by 1
	   m4_asm(BLT, r13, r12, 1111111111000) // If a3 is less than a2, branch to label named <loop>
	   m4_asm(ADD, r10, r14, r0)            // Store final result to register a0 so that it can be read by main program
	   
	   // Optional:
	   // m4_asm(JAL, r7, 00000000000000000000) // Done. Jump to itself (infinite loop). (Up to 20-bit signed immediate plus implicit 0 bit (unlike JALR) provides byte 	address; last immediate bit should also be 0)
	   m4_define_hier(['M4_IMEM'], M4_NUM_INSTRS)
	
	   |cpu
	      @0
	         $reset = *reset;
	
	
	
	      // YOUR CODE HERE
	      // ...
	      @0
	         $pc[31:0] = >>1$reset ? 32'd0 : (>>1$taken_branch ? >>1$br_tgt_pc :  (>>1$pc+32'd4));
	      @1
	         //Instruction Fetch
	         $imem_rd_en = !$reset;
	         $imem_rd_addr[M4_IMEM_INDEX_CNT-1:0] = $pc[M4_IMEM_INDEX_CNT+1:2];
	         $instr[31:0] = $imem_rd_data[31:0];
	      ?$imem_rd_en
	         @1
	            $imem_rd_data[31:0] = /imem[$imem_rd_addr]$instr;
	      @1
	         //Instruction Decode
	         $is_i_instr = $instr[6:2] ==? 5'b0000x ||
	                       $instr[6:2] ==? 5'b001x0 ||
	                       $instr[6:2] ==? 5'b11001 ||
	                       $instr[6:2] ==? 5'b11100;
	         
	         $is_u_instr = $instr[6:2] ==? 5'b0x101;
	         
	         $is_r_instr = $instr[6:2] ==? 5'b01011 ||
	                       $instr[6:2] ==? 5'b011x0 ||
	                       $instr[6:2] ==? 5'b10100;
	         
	         $is_b_instr = $instr[6:2] ==? 5'b11000;
	         
	         $is_j_instr = $instr[6:2] ==? 5'b11011;
	         
	         $is_s_instr = $instr[6:2] ==? 5'b0100x;
	         
	         $imm[31:0] = $is_i_instr ? {{21{$instr[31]}}, $instr[30:20]} :
	                      $is_s_instr ? {{21{$instr[31]}}, $instr[30:25], $instr[11:7]} :
	                      $is_b_instr ? {{20{$instr[31]}}, $instr[7], $instr[30:25], $instr[11:8], 1'b0} :
	                      $is_u_instr ? {$instr[31:12], 12'b0} :
	                      $is_j_instr ? {{12{$instr[31]}}, $instr[19:12], $instr[20], $instr[30:21], 1'b0} :
	                                    32'b0;
	         $opcode[6:0] = $instr[6:0];
	         
	         $rs2_valid = $is_r_instr || $is_s_instr || $is_b_instr;
	         ?$rs2_valid
	            $rs2[4:0] = $instr[24:20];
	            
	         $rs1_valid = $is_r_instr || $is_i_instr || $is_s_instr || $is_b_instr;
	         ?$rs1_valid
	            $rs1[4:0] = $instr[19:15];
	         
	         $funct3_valid = $is_r_instr || $is_i_instr || $is_s_instr || $is_b_instr;
	         ?$funct3_valid
	            $funct3[2:0] = $instr[14:12];
	            
	         $funct7_valid = $is_r_instr ;
	         ?$funct7_valid
	            $funct7[6:0] = $instr[31:25];
	            
	         $rd_valid = $is_r_instr || $is_i_instr || $is_u_instr || $is_j_instr;
	         ?$rd_valid 
	            $rd[4:0] = $instr[11:7]; //rd - Destination Register
	            
	         $dec_bits [10:0] = {$funct7[5], $funct3, $opcode};
	         $is_beq = $dec_bits ==? 11'bx_000_1100011;
	         $is_bne = $dec_bits ==? 11'bx_001_1100011;
	         $is_blt = $dec_bits ==? 11'bx_100_1100011;
	         $is_bge = $dec_bits ==? 11'bx_101_1100011;
	         $is_bltu = $dec_bits ==? 11'bx_110_1100011;
	         $is_bgeu = $dec_bits ==? 11'bx_111_1100011;
	         $is_addi = $dec_bits ==? 11'bx_000_0010011;
	         $is_add = $dec_bits ==? 11'b0_000_0110011;
	         
	      @1
	         //Register File Read
	         $rf_wr_en = 1'b0;
	         $rf_wr_index[4:0] = 5'b0;
	         $rf_wr_data[31:0] = 32'b0;
	         
	         $rf_rd_en1 = $rs1_valid;
	         $rf_rd_index1[4:0] = $rs1;
	         
	         $rf_rd_en2 = $rs2_valid;
	         $rf_rd_index2[4:0] = $rs2;
	         
	         $src1_value[31:0] = $rf_rd_data1;
	         $src2_value[31:0] = $rf_rd_data2;
	         
	      @1
	         //ALU
	         $result[31:0] = $is_addi ? $src1_value + $imm :
	                         $is_add ? $src1_value + $src2_value :
	                         32'bx ;
	      @1
	         //Register File Write
	         $rf_wr_en = $rd_valid && $rd != 5'b0;
	         $rf_wr_index[4:0] = $rd;
	         $rf_wr_data[31:0] = $result;
	         
	      @1
	         //Branch Instructions
	         $taken_branch = $is_beq ? ($src1_value == $src2_value):
	                         $is_bne ? ($src1_value != $src2_value):
	                         $is_blt ? (($src1_value < $src2_value) ^ ($src1_value[31] != $src2_value[31])):
	                         $is_bge ? (($src1_value >= $src2_value) ^ ($src1_value[31] != $src2_value[31])):
	                         $is_bltu ? ($src1_value < $src2_value):
	                         $is_bgeu ? ($src1_value >= $src2_value):
	                                    1'b0;
	         `BOGUS_USE($taken_branch)
	         $br_tgt_pc[31:0] = $pc + $imm;
	      // Note: Because of the magic we are using for visualisation, if visualisation is enabled below,
	      //       be sure to avoid having unassigned signals (which you might be using for random inputs)
	      //       other than those specifically expected in the labs. You'll get strange errors for these.
	
	   
	   // Assert these to end simulation (before Makerchip cycle limit).
	   *passed = *cyc_cnt > 40;
	   *failed = 1'b0;
	   
	   // Macro instantiations for:
	   //  o instruction memory
	   //  o register file
	   //  o data memory
	   //  o CPU visualization
	   |cpu
	      m4+imem(@1)    // Args: (read stage)
	      m4+rf(@1, @1)  // Args: (read stage, write stage) - if equal, no register bypass is required
	      //m4+dmem(@4)    // Args: (read/write stage)
	      //m4+myth_fpga(@0)  // Uncomment to run on fpga
	
	   m4+cpu_viz(@4)    // For visualisation, argument should be at least equal to the last stage of CPU logic. @4 would work for all labs.
	\SV
	   endmodule
```  


<img width="1625" alt="CPU_branch_Ins" src="https://github.com/user-attachments/assets/edd711ec-f8d5-4aa7-b72f-f08e02436536">     

	   

<img width="1628" alt="br_tgt_pc" src="https://github.com/user-attachments/assets/e16b21c8-22c3-48c7-9385-c4b9ceb00e75">    



## 8. Final design of CPU:

   To test the code using the testbech include the line in @1 stage :

```   
	*passed = |cpu/xreg[10]>>5$value == (1+2+3+4+5+6+7+8+9) ;

```

<img width="1662" alt="final_simulation" src="https://github.com/user-attachments/assets/4ec047cb-56ed-4ae7-bf7f-6420a8bf3a73">

---------

## Day-5 Complete Pipelined RISC-V CPU Micro-architecture:

Hazards in Pipelinig
Pipelining introduces certain hazards, which are situations that can potentially stall or disrupt the smooth execution of instructions. One of the most significant hazards is the "branch instruction hazard," also known as the "branch penalty."

Branch instructions are used to alter the sequence of instructions being executed by the processor. They allow the program to make decisions, such as jumping to a different section of code depending on a certain condition. Branch instructions introduce hazards in pipelining due to the fact that the outcome of the branch (taken or not taken) is often determined later in the pipeline than the fetch and decode stages.

There are three main types of branch hazards:

Structural Hazard: This occurs when there's a resource conflict in the pipeline. For instance, a branch instruction might need to access the same execution unit or memory stage as another instruction already in the pipeline. This leads to a pipeline stall while the resources are being reallocated or the conflict is resolved.

Data Hazard: Data hazards arise when instructions depend on the results of previous instructions, and the data needed for the current instruction is not yet available. This can lead to incorrect results if not handled properly. In the context of branch instructions, data hazards can occur when instructions following a branch instruction depend on the outcome of that branch, but the branch decision hasn't been made yet.

Control Hazard (Branch Hazard): This is the primary concern when dealing with branch instructions in pipelining. It occurs due to the uncertainty of whether a branch will be taken or not taken. In a pipelined processor, instructions are fetched ahead of time, but the actual outcome of a branch might not be known until it reaches the execution stage. If the branch outcome is different from what was predicted, instructions fetched after the branch could be incorrect, leading to a need to flush, or discard, these incorrect instructions and restart from the correct point. This process is called "pipeline flushing" and results in a performance penalty, known as the "branch penalty."

## Final 5 Stage Pipelined Logic:

```
	\m4_TLV_version 1d: tl-x.org
	\SV
	   // This code can be found in: https://github.com/stevehoover/RISC-V_MYTH_Workshop
	   
	   m4_include_lib(['https://raw.githubusercontent.com/BalaDhinesh/RISC-V_MYTH_Workshop/master/tlv_lib/risc-v_shell_lib.tlv'])
	
	\SV
	   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
	\TLV
	     
	   // /====================\
	   // | Sum 1 to 9 Program |
	   // \====================/
	   //
	   // Program for MYTH Workshop to test RV32I
	   // Add 1,2,3,...,9 (in that order).
	   //
	   // Regs:
	   //  r10 (a0): In: 0, Out: final sum
	   //  r12 (a2): 10
	   //  r13 (a3): 1..10
	   //  r14 (a4): Sum
	   // 
	   // External to function:
	   m4_asm(ADD, r10, r0, r0)             // Initialize r10 (a0) to 0.
	   // Function:
	   m4_asm(ADD, r14, r10, r0)            // Initialize sum register a4 with 0x0
	   m4_asm(ADDI, r12, r10, 1010)         // Store count of 10 in register a2.
	   m4_asm(ADD, r13, r10, r0)            // Initialize intermediate sum register a3 with 0
	   // Loop:
	   m4_asm(ADD, r14, r13, r14)           // Incremental addition
	   m4_asm(ADDI, r13, r13, 1)            // Increment intermediate register by 1
	   m4_asm(BLT, r13, r12, 1111111111000) // If a3 is less than a2, branch to label named <loop>
	   m4_asm(ADD, r10, r14, r0)            // Store final result to register a0 so that it can be read by main program
	   m4_asm(SW, r0, r10, 100)
	   m4_asm(LW, r15, r0, 100)
	   // Optional:
	   // m4_asm(JAL, r7, 00000000000000000000) // Done. Jump to itself (infinite loop). (Up to 20-bit signed immediate plus implicit 0 bit (unlike JALR) provides byte 	   address; last immediate bit should also be 0)
	   m4_define_hier(['M4_IMEM'], M4_NUM_INSTRS)
	   
	   $clk_pri = *clk;
	   
	   |cpu
	      @0
	         $reset = *reset;
	         //$start = !$reset && >>1$reset ;
	         
	         $pc[31:0] = >>1$reset ? 32'b0 :
	                     >>3$valid_taken_br ? >>3$br_tgt_pc :
	                     >>3$valid_load ? >>3$inc_pc : 
	                     (>>3$valid_jump && >>3$is_jal) ? >>3$br_tgt_pc :
	                     (>>3$valid_jump && >>3$is_jalr) ? >>3$jalr_tgt_pc :
	                     >>1$inc_pc;
	                     
	      @1
	         $inc_pc[31:0] = $pc + 32'd4;
	         $imem_rd_en = !(>>1$reset);
	         $imem_rd_addr[M4_IMEM_INDEX_CNT-1:0] = $pc[M4_IMEM_INDEX_CNT+1:2];
	         
	         $instr[31:0] = $imem_rd_data[31:0];
	            
	         //Instruction Type Decode
	         $is_i_instr = $instr[6:2] ==? 5'b0000x || 
	                       $instr[6:2] ==? 5'b001x0 || 
	                       $instr[6:2] ==? 5'b11001 ;
	         $is_r_instr = $instr[6:2] ==? 5'b011x0 || 
	                       $instr[6:2] ==? 5'b01011 || 
	                       $instr[6:2] ==? 5'b10100 ; 
	         $is_s_instr = $instr[6:2] ==? 5'b0100x ;
	         $is_b_instr = $instr[6:2] ==? 5'b11000 ;
	         $is_j_instr = $instr[6:2] ==? 5'b11011 ;
	         $is_u_instr = $instr[6:2] ==? 5'b0x101 ;
	         
	      //Extract Immediate bits
	         $imm[31:0] = $is_i_instr ? {{21{$instr[31]}}, $instr[30:20]} :
	                      $is_s_instr ? {{21{$instr[31]}}, $instr[30:25], $instr[11:7]} :
	                      $is_b_instr ? {{20{$instr[31]}}, $instr[7], $instr[30:25], $instr[11:8], 1'b0} :
	                      $is_u_instr ? {$instr[31:12], 12'b0} :
	                      $is_j_instr ? {{12{$instr[31]}}, $instr[19:12], $instr[20], $instr[30:21], 1'b0} :
	                                    32'b0;
	                                    
	         $opcode[6:0] = $instr[6:0];
	         
	         //function3 decode
	         $funct3_valid = $is_r_instr || $is_i_instr || $is_s_instr || $is_b_instr;
	         ?$funct3_valid
	            $funct3[2:0] = $instr[14:12];
	         
	         //function7 decode
	         $funct7_valid = $is_r_instr ;
	         ?$funct7_valid
	            $funct7[6:0] = $instr[31:25];
	            
	         //rs1/2_valid
	         $rs2_valid = $is_r_instr || $is_s_instr || $is_b_instr;
	         ?$rs2_valid
	            $rs2[4:0] = $instr[24:20];
	            
	         $rs1_valid = $is_r_instr || $is_i_instr || $is_s_instr || $is_b_instr;
	         ?$rs1_valid
	            $rs1[4:0] = $instr[19:15];
	            
	         $rd_valid = $is_r_instr || $is_i_instr || $is_u_instr || $is_j_instr;
	         ?$rd_valid
	            $rd[4:0] = $instr[11:7];
	            
	         $dec_bits[10:0] = {$funct7[5], $funct3, $opcode};
	         
	         // Branch Instruction
	         $is_beq = $dec_bits ==? 11'bx_000_1100011;
	         $is_bne = $dec_bits ==? 11'bx_001_1100011;
	         $is_blt = $dec_bits ==? 11'bx_100_1100011;
	         $is_bge = $dec_bits ==? 11'bx_101_1100011;
	         $is_bltu = $dec_bits ==? 11'bx_110_1100011;
	         $is_bgeu = $dec_bits ==? 11'bx_111_1100011;
	         
	         // Arithmetic Instruction
	         $is_add = $dec_bits ==? 11'b0_000_0110011;
	         $is_addi = $dec_bits ==? 11'bx_000_0010011;
	         $is_or = $dec_bits ==? 11'b0_110_0110011;
	         $is_ori = $dec_bits ==? 11'bx_110_0010011;
	         $is_xor = $dec_bits ==? 11'b0_100_0110011;
	         $is_xori = $dec_bits ==? 11'bx_100_0010011;
	         $is_and = $dec_bits ==? 11'b0_111_0110011;
	         $is_andi = $dec_bits ==? 11'bx_111_0010011;
	         $is_sub = $dec_bits ==? 11'b1_000_0110011;
	         $is_slti = $dec_bits ==? 11'bx_010_0010011;
	         $is_sltiu = $dec_bits ==? 11'bx_011_0010011;
	         $is_slli = $dec_bits ==? 11'b0_001_0010011;
	         $is_srli = $dec_bits ==? 11'b0_101_0010011;
	         $is_srai = $dec_bits ==? 11'b1_101_0010011;
	         $is_sll = $dec_bits ==? 11'b0_001_0110011;
	         $is_slt = $dec_bits ==? 11'b0_010_0110011;
	         $is_sltu = $dec_bits ==? 11'b0_011_0110011;
	         $is_srl = $dec_bits ==? 11'b0_101_0110011;
	         $is_sra = $dec_bits ==? 11'b1_101_0110011;
	         
	         // Load Instruction
	         $is_load = $dec_bits ==? 11'bx_xxx_0000011;
	         
	         // Store Instruction
	         $is_sb = $dec_bits ==? 11'bx_000_0100011;
	         $is_sh = $dec_bits ==? 11'bx_001_0100011;
	         $is_sw = $dec_bits ==? 11'bx_010_0100011;
	         
	         // Jump Instruction
	         $is_lui = $dec_bits ==? 11'bx_xxx_0110111;
	         $is_auipc = $dec_bits ==? 11'bx_xxx_0010111;
	         $is_jal = $dec_bits ==? 11'bx_xxx_1101111;
	         $is_jalr = $dec_bits ==? 11'bx_000_1100111;
	         $is_jump = $is_jal || $is_jalr ;
	         
	         //`BOGUS_USE($is_beq $is_bne $is_blt $is_bge $is_bltu $is_bgeu)
	         
	      @2
	         //Register file read
	         $rf_rd_en1 = $rs1_valid && >>2$result ;
	         $rf_rd_index1[4:0] = $rs1 ;
	         $rf_rd_en2 = $rs2_valid && >>2$result;
	         $rf_rd_index2[4:0] = $rs2 ;
	
	         
	         //O/P of read register assigned to input signals to ALU 
	         //Handling Data Hazards in Register File with Bypassing
	         
	         $src1_value[31:0] = (>>1$rf_wr_index == $rf_rd_index1) && >>1$rf_wr_en ?
	                             >>1$result :
	                             $rf_rd_data1;
	         $src2_value[31:0] = (>>1$rf_wr_index == $rf_rd_index2) && >>1$rf_wr_en ?
	                             >>1$result :
	                             $rf_rd_data2;
	         
	         //Update branch target PC
	         $br_tgt_pc[31:0] = $pc + $imm;
	         
	      @3
	         //jump target pc 
	         $jalr_tgt_pc[31:0] = $src1_value + $imm ;
	         
	         //Branch insturctions
	         $taken_br = $is_beq ? ($src1_value == $src2_value):
	                     $is_bne ? ($src1_value != $src2_value):
	                     $is_blt ? (($src1_value < $src2_value) ^ ($src1_value[31] != $src2_value[31])):
	                     $is_bge ? (($src1_value >= $src2_value) ^ ($src1_value[31]!= $src2_value[31])):
	                     $is_bltu ? ($src1_value > $src2_value) :
	                     $is_bgeu ? ($src1_value >= $src2_value) :
	                     1'b0 ;
	                     
	         //for invalid instruction
	         $valid_taken_br = $valid && $taken_br ;
	         
	         $valid = !(>>1$valid_taken_br || >>2$valid_taken_br || >>1$valid_load || >>2$valid_load 
	                  || >>1$valid_jump || >>2$valid_jump) ;
	                    
	         $valid_load = $valid && $is_load ;
	         $valid_jump = $valid && $is_jump ;
	         
	         //Register file write
	         $rf_wr_en = $rd_valid && $rd != 5'b0 && $valid || >>2$valid_load ;
	         $rf_wr_index[4:0] = >>2$valid_load ? >>2$rd : $rd ;
	         $rf_wr_data[31:0] = >>2$valid_load ? >>2$ld_data : $result ;
	         
	         
	         //ALU for the given code needs only addi and add instructions
	         $sltu_rslt[31:0] = $src1_value < $src2_value ;
	         $sltiu_rslt[31:0]  = $src1_value < $imm ;
	         
	         $result[31:0] =
	              $is_addi ? $src1_value + $imm :
	              $is_add ? $src1_value + $src2_value :
	              $is_andi ? $src1_value & $imm :
	              $is_ori  ? $src1_value | $imm :
	              $is_xori ? $src1_value ^ $imm :
	              $is_slli ? $src1_value << $imm[5:0] :
	              $is_srli ? $src1_value >> $imm[5:0] :
	              $is_and ? $src1_value & $src2_value :
	              $is_or ? $src1_value | $src2_value :
	              $is_xor ? $src1_value ^ $src2_value :
	              $is_sub ? $src1_value - $src2_value :
	              $is_sll ? $src1_value << $src2_value[4:0] :
	              $is_srl ? $src1_value >> $src2_value[4:0] :
	              $is_sltu ? $src1_value < $src2_value :
	              $is_sltiu ? $src1_value < $imm :
	              $is_lui ? {$imm[31:12], 12'b0} :
	              $is_auipc ? $pc + $imm : 
	              $is_jal ? $pc + 32'd4 :
	              $is_jalr ? $pc + 32'd4 :
	              $is_srai ? {{32{$src1_value[31]}}, $src1_value} >> $imm[4:0] :
	              $is_slt ? ($src1_value[31] == $src2_value[31]) ? $sltu_rslt : {31'b0, $src1_value[31]} :
	              $is_slti ? ($src1_value[31] == $imm[31]) ? $sltiu_rslt : {31'b0, $src1_value[31]} :
	              $is_sra ? {{32{$src1_value[31]}}, $src1_value} >> $src2_value[4:0] :
	              $is_load || $is_s_instr ? $src1_value + $imm :
	              32'bx ;
	         
	         //data memory interface:1-R/W memory             
	      @4
	         $dmem_wr_en = $is_s_instr && $valid ;
	         $dmem_addr[3:0] = $result[5:2] ;
	         $dmem_wr_data[31:0] = $src2_value ;
	         $dmem_rd_en = $is_load ;
	       
	      @5
	         //LOAD DATA from dmem
	         $ld_data[31:0] = $dmem_rd_data ;
	         
	   // Assert these to end simulation (before Makerchip cycle limit).
	   *passed = |cpu/xreg[15]>>5$value == (1+2+3+4+5+6+7+8+9) ;
	   *failed = 1'b0;

	   //Until instrutions are implemented, quiet down the warniongs
	   `BOGUS_USE($is_beq $is_bne $is_blt $is_bge $is_bltu $is_bgeu)
	   
	   |cpu
	      m4+imem(@1)    // Args: (read stage)
	      m4+rf(@2, @3)  // Args: (read stage, write stage) - if equal, no register bypass is required
	      m4+dmem(@4)    // Args: (read/write stage)
	   
	   m4+cpu_viz(@4)    // For visualisation, argument should be at least equal to the last stage of CPU logic. @4 would work for all labs.
	\SV
	   endmodule

```   

**customised clock signal clk_pri:**     

<img width="1478" alt="Screenshot 2024-08-21 at 4 16 55 PM" style="margin-bottom: 20px;" src="https://github.com/user-attachments/assets/94a50f38-6493-4bed-891c-88ccea8a2535">

**Reset Signal and the result output:**  

<img width="1609" alt="out_1" style="margin-bottom: 80px;" src="https://github.com/user-attachments/assets/eec22b43-67e8-4b56-8561-677e811f4861">   

 <br>

<img width="1557" alt="out2" style="margin-bottom: 80px;" src="https://github.com/user-attachments/assets/4f8254bf-3e77-447f-9d57-a123ab3b666b">   

**dmem write signal**   
	
<img width="1596" alt="Screenshot 2024-08-21 at 4 28 26 PM" src="https://github.com/user-attachments/assets/1ccc7dd8-c342-4009-a4da-ed2ffae638d6">


-----
## References:

*  https://forgefunder.com/~kunal/riscv_workshop.vdi
*  https://gcc.gnu.org/onlinedocs/gcc/RISC-V-Options.html
*  https://github.com/vinayrayapati/rv32i
*  [https://github.com/stevehoover](https://github.com/stevehoover/RISC-V_MYTH_Workshop)
*  https://makerchip.com/sandbox
*  https://gcc.gnu.org/onlinedocs/gcc/RISC-V-Options.html
  

------

