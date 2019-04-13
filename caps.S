;Created by Jacob Watters 4-13-19
		;		ARM Programming Assignment #1: Capitalizer
		;
		;		Write a program that goes through the characters in chars,
		;		and Capitalizes every lower-case letter that it finds.
		;		Assume you are given the count of array elements.
		;		Write the number of capitalizations the program performed
		;		In the caps "fill" memory provided.
		
chars	DCD		'a', 'B', '5', 'q', '0', 'O', '1', 's', 'b', 'i', 'G'
count	DCD		11
caps		FILL		4
		ADR		r0, chars
		ADR		r1, count
		LDR		r1, [r1]
		ADR		r2, caps
		
loop
		LDR		r3, [r0]
		CMP		r3, #'a'  ;compare ASCII of a to value in r4
		BLGE		TOCAP	;If r3 > 97 goto TOCAP subroutine
		STR		r3, [r0], #4
		SUBS		r1, r1, #1
		BNE		loop
		END
TOCAP
		CMP		r3, #'z' 		;compare ASCII of 'z' to value in r4
		SUBLE	r3, r3, #32	;If r3>122 subtract 32 from ASCII making character capuital
		ADDLE	r2, r2, #1	;Increment number of elements in caps
		MOV		PC, LR
