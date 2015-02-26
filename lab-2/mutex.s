	.syntax unified
	.arch armv7-a
	.text

	.equ locked, 1
	.equ unlocked, 0

	.global lock_mutex
	.type lock_mutex, function
lock_mutex:
        @ INSERT CODE BELOW
	//ldr r1, =locked  
	ldr r2,  =locked
.L1:
 		swp r1,r2,[r0]  
		cmp r1,r2
		beq .L1  	
		//ldrex r2, [r0]
	    	//cmp r2, #0
            //strexeq r2, r1, [r0] 
            //cmpeq r2, #0
            //bne .L1
		//DMB
        @ END CODE INSERT
	bx lr

	.size lock_mutex, .-lock_mutex

	.global unlock_mutex
	.type unlock_mutex, function
unlock_mutex:
	@ INSERT CODE BELOW
	ldr r1, =unlocked
	
    	str r1, [r0]
         //mov [ro], #0
	
    	bx lr

        @ END CODE INSERT
	
	.size unlock_mutex, .-unlock_mutex

	.end
