.model small
.data
a	dd ?
b	dd ?
msga	db 'Enter a = $'
msgb	db 13,10,'Enter b = $'
msgc	db 13,10,'Result a - b = $'
.stack 256
.code
include Message.inc
start:
	mov ax,@data
	mov ds,ax
	mov dx,offset msga
	call puts
	call inputfloat
	fstp a

	mov dx,offset msgb
	call puts
	call inputfloat
	fstp b
	
	mov dx,offset msgc
	call puts
	fld a
	fsub b
	call outfloat
	
	call getch
	mov ax,4c00h
	int 21h
end start
