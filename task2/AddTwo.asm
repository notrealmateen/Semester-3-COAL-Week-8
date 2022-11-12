Include Irvine32.inc

.stack 4086
.data
	input BYTE 100 dup(?)
	count DWORD ?
.code
main proc
	MOV edx,OFFSET input
	MOV ecx, 4
	CALL ReadString
	MOV count, eax
	MOV bl, 'h'
	CALL arrayFind
	MOV bh, dl
	MOV EDX , OFFSET input
	MOV ECX, 4
	CALL ReadString
	MOV count , EAX
	CALL UpperCase
	MOV bl, "R"
	MOV dh, dl
	MOV dl, BH
	ADD dh, dl
	CMP dh, 25
	inf:
	JLE inf
	invoke ExitProcess,0
main endp

UpperCase PROC
MOV ECX, LENGTHOF Input-1
	MOV ESI, 0
	l1:
		MOV AL, Input[esi]
		AND AL, 11011111b
		MOV Input[esi] , AL
		INC ESI
	LOOP l1
	ret
UpperCase ENDP

arrayFind PROC
	MOV ecx, count
	MOV esi, 0
	l1:
		MOV dl, input[esi]
		cmp input[ESI], bl
		JE final
		iNC ESI
	LOOP l1
	MOV dl, 0 
	ret
	final:
		ret
arrayFind ENDP

end main