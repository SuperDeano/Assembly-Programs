* Experiment 2
* Name: Dean Chong San
* Date: February 05 2019


	ORG $4000
	CLR D1
	CLR D2
	CLR D3
	MOVE.W #$12FF,D2
	MOVE.W #$00FF,d3
	ADD D2,D1
	SUB D3,D1
	TRAP #15
	DC.W $63
