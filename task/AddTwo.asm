INCLUDE Irvine32.inc
.data

	var DWORD 5 dup (?)
	arraySum DWORD 0
	str1 BYTE "Sum in Greater than EAX",0
	str2 BYTE "Sum in Less than EAX",0

.code

main PROC
	mov ecx,5
	mov ebx,0
	ptr1:
		Call readint
		mov var[ebx],eax
		add arraySum, eax
		add ebx,1
		loop ptr1

	call readint
	cmp arraySum,eax
	jg message1
	jl message2
	exit


main ENDP

message1 Proc
	mov  edx, OFFSET str1
	call writestring
	ret

message1 ENDP


message2 Proc
	mov  edx, OFFSET str2
	call writestring
	ret

message2 ENDP


END main