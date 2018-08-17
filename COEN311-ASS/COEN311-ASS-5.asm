

	public start    ;Make the entry point public
	org $2000       ;Place the origin at $2000


start:
	;  YOUR CODE HERE
	;Instructions must be indented by at least one space,
	;otherwise the assembler will misinterpret them as labels.
	
	;Then, to terminate the program, spin forever. You can set
	;a breakpoint to the next instruction to be notified of
	;the program's termination.


			ORG $2000					;The origin of the program
main			move Num, d0			;d0 contains the number of numbers in the array, also used for loop
Moving			move.l Array, a3			;Getting the address of the array in a3
				move.l a3,-(sp)			;Moving Data into the stack
		
				dbra d0, Moving			;looping
		
				move Num,-(sp)			;Move the number of elements on top of the stack 
				BSR MEAN_SUB			;Calling the subroutine to calculate the mean	
		
				BSR VARIANCE_SUB		;Sub routine to calculate the variance of the array

				move (sp)+,d0			;Get the Variance in d0 to display
		
				move #248,d7			;To read the result in d0
				trap #14				;To end the program


Array	DC.W 	5, 10, 15, 20, 31, 3	;The array of numbers
Num		DC.W	6						;Number of elements in the array

	ORG $2300

MEAN_SUB 	 	move.l (sp)+,a5	;pops the PC Value into an address register

				move.l SP, a3	;gets the address into the stack of where the numbers are
							;so the datas into the stack remain unharmed when writing the new data later on

				move (sp)+,d3	;pops the number of numbers into the register d3
				move d3,d4		;gets the number of numbers into the register d4
				sub #1, d3	;d3 will be used for a loop so the loop does not go out of bound
				clr d2		;makes sure d2 has nothing

moving			move (sp)+, d1	;Gets the numbers from the stack
				add d1,d2		;gets the sum of the numbers
				dbra d3, moving	;looping

				divs d2,d4		;dividing to get the mean
				move.l a3,sp	;takes the stack pointer back to after the number of numbers in the stack so those data do 	not change

				move d2,-(sp)	;Push the resulting mean back into the stack
				move.l a5,-(sp)	;pushes the PC value back onto the top of the stack
		
				RTS			;exists subroutine

		
			ORG $2500

VARIANCE_SUB	move.l (sp)+,a5	;pops the PC Value into an address register
				move (sp)+,d2 	;pops the mean value into the register d2
				move (sp)+,d3	;pops the number of numbers into the register d3
				move d3,d4		;Register d4 also contains the number of numbers
				clr d5		;d5 contains 0

loop			move (sp)+,d0	;gets numbers from stack
				move d2,d1		;d1 gets mean value	
				sub d0,d1		;X - M
				muls d1,d1		;(x - m)^2	
				add d1,d5		;Addition
		
				dbra d3,loop	;looping
				divs d5,d4		;1/N*(x - m)^2
			
				move d4,-(sp)	;moves the result into the stack	
				move.l a5,-(sp)	;moves PC value back on top of the stack

				RTS			;Exists sub routine



		end



