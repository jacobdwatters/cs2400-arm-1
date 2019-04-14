		;		ARM Programming Assignment #1: 16 bit multiplier
		;
		;		Write a 16-bit multiplier, meaning numbers that have their high 16 bits set to 0.
		;		Use the standard shift-and-add operation.
		;		Note that we cannot address half-words here. We can only address words and bytes (B).
		;		Use the two numbers as an example but write it so it works for any two 16-bit numbers.
		;		Write the result in the provided "fill" word.
		;		Indicate if there was a high-bit carry using the provided "fill" word.
		
		;		Your code here
		
numbers	DCD		0b1100101010010001, 0b1111010101000011
result	FILL		4
carry	FILL		4

ADR		r0, numbers
LDR		r1, [r0], #4	
LDR		r2, [r0], #4	
MOV		r3, #0		

loop	
	MOVS		r2, r2, lsr #1
	ADDCS		r3, r3, r1	
	MOV		r1, r1, lsl #1	
	CMP		r2, #1
	BGT		loop			
	MOVS		r2, r2, lsr #1	
	ADDCS		r3, r3, r1	
	STR		r3, [r0], #4
	MOVCC		r4, #0
	MOVCS		r4, #1
	STR		r4, [r0]
	END
