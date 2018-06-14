* Lab 4
* March 12
* Dean Chong San

	ORG $3000

mySUB	MOVE.L (SP)+,D5  ;poping the PC value to a d5 register
		MOVE.L (SP)+,D2	;Poping the right values then
		MOVE.L (SP)+,D1
		MOVE.L (SP)+,D0
		MOVE.L D5,-(SP)	;Pushing the PC back to the top of the stack then
		CLR.L D3		;Code from mySUB
		ADD.L D0,D3
		ADD.L D1,D3
		SUB.L D2,D3
		RTS					;Returns the subroutine
		


	ORG $4000					;Main
		CLR D3					
		MOVE.L #8,D0		;Moving values into the registers
		MOVE.L #7,D1
		MOVE.L #5,D2

		MOVE.L D0,-(SP)		;Pushing values to the stack
		MOVE.L D1,-(SP)
		MOVE.L D2,-(SP)

		BSR mySUB

		TRAP #15
		DC.W $63

