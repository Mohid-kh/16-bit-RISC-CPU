	;; R0 assumed to be 0 after reset
	IOR R1 R0
	INC R1 R1
	NOT R2 R2
	SHR R2 R2
	XOR R1 R1 R2
	;; SLA
	SLA R1 R1 2
	HAL
	
