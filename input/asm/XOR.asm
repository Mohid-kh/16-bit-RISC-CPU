	;; R0 assumed to be 0 after reset
	IOR R1 R0
	INC R1 R1
	NOT R2 R1
	;; Set R0=0 so that change can be seen in XOR
	LDI R0 1
	XOR R0 R1 R1
	XOR R0 R1 R2
	HAL
