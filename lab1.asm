* Experiment 1
* Name: Dean Chong San (40061194)
* Date: 1/22/2018

	ORG $3000
	
	CLR.L D1
	CLR.L D2
	CLR.L D3
	CLR.L D4
	
	MOVE.B #$01,D1
	MOVE.B #$02,D2
	MOVE.B #$03,D3
	
	
START
	ADD D1,D1
	ADD D2,D2
	ADD D2,D3
	MULS D1,D3
	DIVS D2,D1
	SUB D0,D0
	BEQ START
	END