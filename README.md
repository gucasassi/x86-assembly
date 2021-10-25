# Assembly
The Netwide Assembler (NASM) is an assembler and disassembler for the Intel x86 architecture. It can be used to write 16-bit, 32-bit (IA-32) and 64-bit (x86-64) programs. NASM is considered to be one of the most popular assemblers for Linux.</br></br>

# Table of contents
* [Architecture of CPU](#architecture-cpu)
  * [Components](#components)
  * [CPU Registers](#cpu-registers)
  * [Instructions Cycle](#instruction-cycle)
* [Introduction to Assembly](#introduction-assembler)
  * [Structure of Assembly Language](#structure-of-assembly)
    * [Variables](#variables)
    * [Constants](#constants)
    * [Global](#global)
    * [Instructions](#instructions)
    * [Code Example: Hello World](#hello-world)
  * [Execute](#execute)
    * [Assembling](#assembling)
    * [Running](#running)
    * [Debugging](#debuging) 
* [Address Modes](#address-modes)
  * [Register Addressing](#register)   
  * [Immediate Addressing](#immediate)   
  * [Direct Memory Addressing](#direct-memory)   
  * [Direct Offset Addressing](#direct-offset)   
  * [Indirect Offset Addressing](#indirect-offset)   
  * [MOV - Move](#move)  
* [Arithmetic instructions](#arithmetic-instructions)
  * [Increment (INC)](#increment) 
  * [Decrement (DEC)](#decrement)
  * [Addition (ADD)](#addition)
  * [Substraction (SUB)](#substraction)
  * [Multiply (MUL/IMUL)](#multiply)
  * [Divide (DIV/IDIV)](#divide)     
* [Logical instructions](#logical-instructions)
  * [AND](#and)
  * [OR](#or)  
  * [XOR](#xor)  
  * [NOT](#not)  
* [Conditions](#conditions)
  * [Compare (CMP)](#compare)
  * [Unconditial Jump](#unconditial-jump) 
  * [Conditional Jump](#conditial-jump) 
  * [IF](#if)
  * [IF/ELSE](#if-else)  
* [Loops](#loops)
* [Macros and Procedures](#macros-procedures)
* [Files](#files)
* [Assembly and C](#assembly-c)
</br>

## Introduction to Assembly <a name="introduction-assembler"></a>
Assembly languages were developed to provide **mnemonics** or symbols for the machine level code instructions. Assembly language programs consist of mnemonics, thus they should be translated into machine code. A program that is responsible for this conversion is known as **assembler**.

### Structure of Assembly Language <a name="structure-of-assembly"></a>
An assembler program written with **NASM** syntax is formatted for three *sections* or *segments*: **.data** for initialize data, **.bss** for non initialized data and **.text** for main code.

 ```assembly
  
  section .data   ; Initialized data
  
  section .bss    ; Non initialized data
  
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
  
  section .data                 ; Initialized data
    
    choice        DB  'y'       ; Allocates 1 byte
    number        DW  12345     ; Allocates 2 bytes
    real_number1  DD  1.234     ; Allocates 4 bytes
    real_number2  DQ  123.456   ; Allocates 8 bytes
  
  section .text                 ; Main code
  
 ```
 </br>

#### Constants <a name="constants"></a>

#### Global <a name="global"></a>
The **.text** section **must always start with the global** directive, which indicates to the GCC what is the starting point of the code.

 ```assembly
 
  section .data   ; Initialized data
  
  section .text   ; Main code
    
    global main   ; Define starting point of the code
    
 ```
</br>

#### Instructions <a name="instructions"></a>
An assembly language program is a series of statements, which are either assembly language **instructions** such as ADD and MOV, or statements called **directives**. An *instruction* tells the CPU what to do, while a *directive* (also called pseudo-instructions) gives instruction to the assembler.
 
 A program language instruction consists of the following four fields. A [ ] indicates that the field is optional.</br>
 
 ```
 [label:]   mnemonics   [operands]    [;comment]
 ```
</br>

The **label field** allows the program to refer to a line of code by name. The label fields cannot exceed a certain number of characters.

 ```assembly
 
  section .data   ; Initialized data
  
  section .text   ; Main code
    
    global main   ; Define starting point of the code
    
      main:       ; Label starting point
    
 ```
 </br>

The **mnemonics** and **operands** together perform the real work of the program and accomplish the tasks. Statements like *mov rax, 4* where *mov* is the **mnemonic**, wich produce opcodes, and *rax* and *4* are **operands**. In this case, *mov rax,4* is used to move 4 (sys_write) to rax register.
 
 ```assembly
   mov rax,4
 ```
 </br>
 
The **comment field** begins with a semicolon (;) which is a comment indicator. 
 ```assembly
   mov rax,4 ; This is a comment
 ```
</br>

#### Code Example: Hello World <a name="hello-world"></a>
Let's see a **Hello World** code example.

 ```assembly
 
  ;hello-world.asm
  section .data                 ;01: Initialized data

    msg db "Hello World!!",10   ;02: Define msg variable
    length equ $ - msg          ;03: Define length constant based on msg variable length

  section .text                 ;04: Main code

    global main                 ;05: Define starting point of the code

      main:                     ;06: Label starting point

        mov rax,4               ;07: Move 4 (sys_write) to rax
        mov rbx,1               ;08: Move 1 (stdout) to rbx

        mov rcx,msg             ;09: Move msg to rcx
        mov rdx,length          ;10: Move length to rdx

        int 80h                 ;11: system call (write msg to stdout)

        mov rax,1               ;12: sys_exit call
        mov rbx,0               ;13: return 0 (exit status)

        int 80h                 ;14: system call (finish execution 0)
    
 ```
