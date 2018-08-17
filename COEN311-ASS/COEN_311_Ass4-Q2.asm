

	public start    ;Make the entry point public
	org $2000       ;Place the origin at $2000


start:
	;  YOUR CODE HERE
	;Instructions must be indented by at least one space,
	;otherwise the assembler will misinterpret them as labels.
	
	;Then, to terminate the program, spin forever. You can set
	;a breakpoint to the next instruction to be notified of
	;the program's termination.
		
		
		;Address of the Array in a0
		move.l Array, a0
		
		;Copies the address of Array into A1 and A2
		move.l a0, a1
		move.l a0, a2
		
		;makes sure d1 contains 0
		CLR d2
		
		;moves N into d1 for FOR loop
		move.b N, d1
		
		;moves value of N into d5 for division
		move.b N, d5
		
		;for the second for loop 2
		move.b N,d0
		
;for loop to find mean
		;move values from array in memory to register d0
for1 	move.w (a1)+, d0
		add.w d0,d2

		;Checks for FOR loop 1
		dbra d1, for1
		
		;1/N*SUM
		divu d5,d2
		
		;Makes sure d1 contains 0
		clr d1

		;Makes sure d5 contains Value of N
		move.w N, d5
		
;for loop to find Variance
		;move values from Array to register d3
for2 	move.w (a2)+,d3
 		
 		;get Mean value in d4
 		move.w d2,d4
 		
 		;Xi - M
 		sub.w d3, d4
 		
 		;(Xi - M)^2
 		muls d4,d4

		;To Store and Keep Track of sum
		add.w d4,d1
		
		;Checks for FOR loop 2
		dbra d0, for2
		
		;1/N * (Xi-M)^2
		divs d5, d1
		
		;Stores variance in memory location v
		move.w d1, v
		
		;To end the program
		move #228,d7
		trap #14



;reserves space for an array of 10 elements
Array ds.w 10
;Number of elements, also Size of Array
N ds.w 1 
;To store final result
v ds.w 1


	end