# Assembly
The Netwide Assembler (NASM) is an assembler and disassembler for the Intel x86 architecture. It can be used to write 16-bit, 32-bit (IA-32) and 64-bit (x86-64) programs. NASM is considered to be one of the most popular assemblers for Linux.</br></br>

# Table of contents
* [Architecture of CPU](#architecture-cpu)
  * [Components](#components)
  * [CPU Registers](#cpu-registers)
  * [Instructions Cycle](#instruction-cycle)
  * [Addressing Modes](#addressing-modes)
  * [Interrupts](#interrupts)
* [Introduction to Assembly](#introduction-assembler)
  * [Structure of Assembly Language](#structure-of-assembly)
    * [Variables](#variables)
    * [Instructions](#instructions)
    * [Hello World](#hello-world)
  * [Assembling and Running](#assembling-running)
  * [Add and Subtract](#add-substract)
  * [Multiply and Divide](#add-substract)
</br>

## Architecture of CPU <a name="architecture-cpu"></a>

### Components <a name="components"></a>
### CPU Registers <a name="cpu-registers"></a>
### Instructions Cycle <a name="instruction-cycle"></a>
### Addressing Modes <a name="addressing-modes"></a>
### Interrupts <a name="interrupts"></a>

## Introduction to Assembly <a name="introduction-assembler"></a>
Assembly languages were developed to provide **mnemonics** or symbols for the machine level code instructions. Assembly language programs consist of mnemonics, thus they should be translated into machine code. A program that is responsible for this conversion is known as **assembler**.

### Structure of Assembly Language <a name="structure-of-assembly"></a>
An assembler program written with **NASM** syntax is formatted for three *sections* or *segments*: **.data** for initialize data, **.bss** for non initialized data and **.text** for main code.

 ```assembly
  
  section .data   ; Initialize data
  
  section .bss    ; Initialize data
  
  section .text   ; Main code
  
 ```
 
The **.bss** section is not necessary if you initialize all the variables that are declared to the **.data** section.</br></br>

#### Variables <a name="variables"></a>

**NASM** provides various define directives for reserving storage space for variables. The define assembler directive is used for allocation of storage space. It can be used to reserve as well as initialize one or more bytes.

The syntax for storage allocation statement for initialized data is.

 ```
  [variable-name]    define-directive    initial-value 
 ```
 
Where, variable-name is the identifier for each storage space. The assembler associates an offset value for each variable name defined in the data segment.</br></br>

<div align="center">

  |   Directive   |       Purpose       |     Storage Space      |
  | :-----------: |     :----------:    |     :-----------:      |
  |     DB        |      Define Byte    |   Allocates 1 byte     |
  |     DW        |      Define Word    |   Allocates 2 bytes    |
  |     DD        |   Define Doubleword |   Allocates 4 bytes    |
  |     DQ        |    Define Quadword  |   Allocates 8 bytes    |
  |     DT        |   Define Ten Bytes  |   Allocates 10 bytes   |

</div>
</br>

Let's see a code example.

```assembly
  
  section .data                 ; Initialize data
    
    choice        DB  'y'       ; Allocates 1 byte
    number        DW  12345     ; Allocates 2 bytes
    real_number1  DD  1.234     ; Allocates 4 bytes
    real_number2  DQ  123.456   ; Allocates 8 bytes
  
  section .text                 ; Main code
  
 ```
 </br>

#### Global main <a name="global-main"></a>
The **.text** section **must always start with the global** directive, which indicates to the GCC what is the starting point of the code.

 ```assembly
 
  section .data   ; Initialize data
  
  section .text   ; Main code
    
    global main   ; Define starting point of the code
    
 ```

#### Instructions <a name="instructions"></a>
An assembly language program is a series of statements, which are either assembly language **instructions** such as ADD and MOV, or statements called **directives**. An *instruction* tells the CPU what to do, while a *directive* (also called pseudo-instructions) gives instruction to the assembler.
 
 A program language instruction consists of the following four fields. A [ ] indicates that the field is optional.</br>
 
 ```
 [label:]   mnemonics   [operands]    [;comment]
 ```
</br>

The **label field** allows the program to refer to a line of code by name. The label fields cannot exceed a certain number of characters.

 ```assembly
 
  section .data   ; Initialize data
  
  section .text   ; Main code
    
    global main   ; Define starting point of the code
    
      main:       ; Label starting point
    
 ```

The **mnemonics** and **operands** together perform the real work of the program and accomplish the tasks. Statements like *ADD A, B* where *ADD* is the **mnemonic**, wich produce opcodes, and *A* and *B* are **operands**.

The **comment field** begins with a semicolon which is a comment indicator.</br></br>

#### Hello World <a name="hello-world"></a>
Let's see a **Hello World** code example.

 ```assembly
 
  ;hello.asm
  section .data           ;01: Initialize data

    msg db "Hello!!",10   ;02: Define msg variable
    length equ $ - msg    ;03: Define length variable based on msg length

  section .text           ;04: Main code

    global main           ;05: Define starting point of the code

      main:               ;06: Label starting point

        mov rax,4         ;07: Move 4 (sys_write) to rax
        mov rbx,1         ;08: Move 1 (stdout) to rbx

        mov rcx,msg       ;09: Move msg to rcx
        mov rdx,length    ;10: Move length to rdx

        int 80h           ;11: system call (write msg to stdout)

        mov rax,1         ;12: sys_exit call
        mov rbx,0         ;13: return 0 (exit status)

        int 80h           ;14: system call
    
 ```

### Assembling and Running <a name="assembling-running"></a>
### Add and Subtract <a name="add-substract"></a>
### Multiply and Divide <a name="add-substract"></a>
