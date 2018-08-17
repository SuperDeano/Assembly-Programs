

	public start    ;Make the entry point public
	org $1000       ;Place the origin at $1000


start:
	
	;  YOUR CODE HERE
	;Instructions must be indented by at least one space,
	;otherwise the assembler will misinterpret them as labels.
	
	;Then, to terminate the program, spin forever. You can set
	;a breakpoint to the next instruction to be notified of
	;the program's termination.


;d1 is n
;d2 is sortflag


		;makes sure d1 contains nothing
	 	 CLR.W D1	
	 	 ;d2 will be sortflag			
	 	 CLR.w D2				
	  						    ;0 for true and 1 for false
	  	
	  	 move.l Array, a0				    
	  		
	  	;moves 4 into d1					    
	  	 MOVE.b #$04,d1	
	  	 
	  	 ;substract 1 from the content of d1		
	   	 sub.b #1,d1
	   	 
	   	 ;making sortflag false			
	     move.b #$1,d2			
	     
	     ;d1 = 3
	     ;sortflag is false
	  	 
	  	 ;checks if d1 is greater than 0
	  	 cmpi.b #$0,d1			
	  	 blt  exit
	  	 
	  	 ;checks if d2 is false
	  	 cmpi.b #$0,d2			
	  	 beq.b  exit
	  	 
	  	 ;marks sorfflag as true
	  	 clr.w d2
	  	 				
	  	 ;d4 is i
;..................Start While Loop ..........................	  	 
	  	 ;d4 = n
while: 	 move.b d1, d4				
	  	 
	  	 ;d6 = 0
	  	 move.b #$0,d6
		
		;puts the address of Array in a2
		move.l a0,a2
		
		;Puts the address of Array in a1
		move.l a0, a1
		
		;Increments a2 with 2 bytes
		;addi.l #2,a2
	
			
;--------------------Start of For LOOP------------------------	  	 
	  	 ;checks two values in array 
for1:     cmpm.b (a1)+,(a2)+ 	
		;if they are equal or greater than then exit  
			 
	  	 bge.b back	;branch
	  	 							
	  	 ;d5 is temp 
	  	 
	  	 ;d5 holds the value of a[i]
	  	 move.b (a1), d5
	  	 		
	  	 ;moves data: a[i] = a[i+1]
	  	 move.b -2(a1), (a1) 
	  	 
	  	 ;moves data a[i + 1] = temp 
	  	 move.b d5, -2(a1)		
	  	 
	  	 ;marks sortflag as false			
	  	 move.b #$1, d2							
	    
	
;----------------------End For Loop ---------------------------			
		 ;i ++ 	
back:	 addi.b #$1,d6	
	    
	    ;if i is still not equal to 0, starts the loop again
	     dbra d4, for1 ;loop
	     	       
	       ;n -= 1
  		 sub.b #1, d1
	 	  
	 	  ;Compares n and 0
	     cmpi.b #$0, d1
	     ;if n is smaller than 0 exit while loop
	     blt exit ;branch
			
		;checks if sortflag is false
		cmpi.b #$1,d2
		;if sortflag is false, goes back into while loop	
	 	beq.b while
;.................End of While Loop .............................

		;d3 used for second for loop		 
exit:     move.w #$4,d3	 

		;new i = 0
		move.b #$0, d6
		
		;move a[i] to d0 
		
;''''''''''''''''''''Start of second For Loop '''''''''''''''''''
for2:	move (a0), d0
		;To display character in d0
		move #248, d7
		trap #14
		
		;increment i
		addi.w #$1,d6
		
		;for loop until i = 0
		dbra d3, for2 ;loop
		
;''''''''''''''''''''End of Second For loop '''''''''''''''''''''

		;To end the program
		move.w #228,d7
 		trap #14
 		
	
;Declaring the array
Array DC.W 5, 4, 3, 2, 1 
;Declaring the other variables

temp ds.w 1	

		end



