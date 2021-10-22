;hello-world.asm
section .data           		;01: Initialize data

	msg db "Hello World!!",10	;02: Define msg variable
	length equ $ - msg    		;03: Define length variable based on msg length

section .text           		;04: Main code

	global main           		;05: Define starting point of the code

    main:               		;06: Label starting point

		mov rax,4         		;07: Move 4 (sys_write) to rax
		mov rbx,1         		;08: Move 1 (stdout) to rbx

		mov rcx,msg       		;09: Move msg to rcx
		mov rdx,length    		;10: Move length to rdx

		int 80h           		;11: system call (write msg to stdout)

		mov rax,1         		;12: sys_exit call
		mov rbx,0         		;13: return 0 (exit status)

		int 80h           		;14: system call
   

