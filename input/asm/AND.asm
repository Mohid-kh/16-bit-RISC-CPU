	;; R0 assumed to be 0 after reset
	IOR R1 R0
	IOR R2 R0
	;; Make R1, R2 non-zero
	INC R1 R1
	INC R2 R2	
	;; R3 assume to be 0
	AND R1 R1 R2	
	;; Make R0 all ones
	NOT R3 R3
	AND R2 R2 R3		
	HAL
