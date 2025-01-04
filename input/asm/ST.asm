	;; R0 assumed to be 0 after reset
	IOR R1 R0
	INC R1 R1
;;; ST: M[R0] = 16
	LDI R0 4
	SHL R0 R0
	SHL R0 R0	
	ST R0 R1
	HAL
	
