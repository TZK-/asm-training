section .data
	msgEnter db 'Enter your name: '
	lenMsgEnter equ $ - msgEnter

	msgEntered db 'You have entered: '
	lenMsgEntered equ $ - msgEntered

section .bss
	name resb 20

section .text
	global _start

_start:
	; write(msgEnter, stdout, len(msgEnter))
	mov al, 4
	mov bl, 1
	mov ecx, msgEnter
	mov dl, lenMsgEnter
	int 0x80

	; read(stdin, name, 20)
	mov al, 3
	mov bl, 0
	mov ecx, name
	mov dl, 20
	int 0x80

	; write(msgEntered, stdout, len(msgEntered))
	mov al, 4
	mov bl, 1
	mov ecx, msgEntered
	mov dl, lenMsgEntered
	int 0x80

	; write(name, stdout, len(name))
	mov al, 4
	mov bl, 1
	mov ecx, name
	mov dl, 20
	int 0x80

	; return 0
	xor al, 0
	mov bl, 0
	int 0x80

