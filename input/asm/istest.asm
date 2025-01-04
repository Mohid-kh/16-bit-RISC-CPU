        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;; IOR
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        LDI R0 0
        LDI R1 0
        LDI R2 0
        LDI R3 0
        LDI R4 0
        LDI R5 0
        LDI R6 0
        LDI R7 0
        ;;
	;;
	IOR R1 R0
	IOR R2 R0	
	IOR R3 R0
	IOR R4 R0
	
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;; LDI
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        LDI R0 0
        LDI R1 0
        LDI R2 0
        LDI R3 0
        LDI R4 0
        LDI R5 0
        LDI R6 0
        LDI R7 0
        ;;
	;;
	LDI R0 7
	LDI R1 7
	LDI R2 7	
	LDI R3 7
	LDI R4 7
	LDI R5 7
	LDI R6 7
	LDI R7 7	
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;; MOVA
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        LDI R0 0
        LDI R1 0
        LDI R2 0
        LDI R3 0
        LDI R4 0
        LDI R5 0
        LDI R6 0
        LDI R7 0
        ;;
	;;
	IOR R1 R0
	IOR R2 R0	
	IOR R3 R0
	IOR R4 R0
	IOR R5 R0
	IOR R6 R0
	IOR R7 R0	
	IOR R0 R0
	MOVA R0 R1
	MOVA R1 R2
	MOVA R2 R3
	MOVA R3 R4
	MOVA R4 R5
	MOVA R5 R6
	MOVA R6 R7
	MOVA R7 R0		
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;; MOVB
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        LDI R0 0
        LDI R1 0
        LDI R2 0
        LDI R3 0
        LDI R4 0
        LDI R5 0
        LDI R6 0
        LDI R7 0
        ;;
	;;
	IOR R1 R0
	IOR R2 R0	
	IOR R3 R0
	IOR R4 R0
	IOR R5 R0
	IOR R6 R0
	IOR R7 R0	
	IOR R0 R0
	MOVB R0 R1
	MOVB R1 R2
	MOVB R2 R3
	MOVB R3 R4
	MOVB R4 R5
	MOVB R5 R6
	MOVB R6 R7
	MOVB R7 R0		
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;; NOT
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        LDI R0 0
        LDI R1 0
        LDI R2 0
        LDI R3 0
        LDI R4 0
        LDI R5 0
        LDI R6 0
        LDI R7 0
        ;;
	;;
	IOR R1 R0
	IOR R2 R0	
	IOR R3 R0
	IOR R4 R0
	NOT R1 R1
	NOT R2 R2
	NOT R3 R3
	NOT R4 R4	
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;; AND
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        LDI R0 0
        LDI R1 0
        LDI R2 0
        LDI R3 0
        LDI R4 0
        LDI R5 0
        LDI R6 0
        LDI R7 0
        ;;
	;;
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
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;; OR
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        LDI R0 0
        LDI R1 0
        LDI R2 0
        LDI R3 0
        LDI R4 0
        LDI R5 0
        LDI R6 0
        LDI R7 0
        ;;
	;;
	IOR R1 R0
	IOR R2 R0
	;; Make R1, R2 non-zero
	INC R1 R1
	INC R2 R2	
	;; R3 assume to be 0
	OR R1 R1 R3	
	;; Make R0 all ones
	NOT R3 R3
	OR R2 R2 R3		
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;; XOR
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        LDI R0 0
        LDI R1 0
        LDI R2 0
        LDI R3 0
        LDI R4 0
        LDI R5 0
        LDI R6 0
        LDI R7 0
        ;;
	;;
	IOR R1 R0
	INC R1 R1
	NOT R2 R1
	;; Set R0=0 so that change can be seen in XOR
	LDI R0 1
	XOR R0 R1 R1
	XOR R0 R1 R2
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;; INC
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        LDI R0 0
        LDI R1 0
        LDI R2 0
        LDI R3 0
        LDI R4 0
        LDI R5 0
        LDI R6 0
        LDI R7 0
        ;;
	;;
	IOR R1 R0
	IOR R2 R0	
	IOR R3 R0
	IOR R4 R0
	IOR R5 R0
	IOR R6 R0
	IOR R7 R0	
	IOR R0 R0
	INC R0 R0
	INC R1 R1
	INC R2 R2
	INC R3 R3
	INC R4 R4
	INC R5 R5
	INC R6 R6
	INC R7 R7		
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;; DEC
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        LDI R0 0
        LDI R1 0
        LDI R2 0
        LDI R3 0
        LDI R4 0
        LDI R5 0
        LDI R6 0
        LDI R7 0
        ;;
	;;
	IOR R1 R0
	IOR R2 R0	
	IOR R3 R0
	IOR R4 R0
	IOR R5 R0
	IOR R6 R0
	IOR R7 R0	
	IOR R0 R0
	DEC R0 R0
	DEC R1 R1
	DEC R2 R2
	DEC R3 R3
	DEC R4 R4
	DEC R5 R5
	DEC R6 R6
	INC R7 R7		
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;; ADD
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        LDI R0 0
        LDI R1 0
        LDI R2 0
        LDI R3 0
        LDI R4 0
        LDI R5 0
        LDI R6 0
        LDI R7 0
        ;;
	;;
	IOR R1 R0
	IOR R2 R0	
	IOR R3 R0
	IOR R4 R0
	IOR R5 R0
	IOR R6 R0
	IOR R7 R0	
	IOR R0 R0
	ADD R0 R0 R1
	ADD R1 R1 R2
	ADD R2 R2 R3
	ADD R3 R3 R4
	ADD R4 R4 R5
	ADD R5 R5 R6
	ADD R6 R6 R7
	ADD R7 R7 R0		
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;; SUB
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        LDI R0 0
        LDI R1 0
        LDI R2 0
        LDI R3 0
        LDI R4 0
        LDI R5 0
        LDI R6 0
        LDI R7 0
        ;;
	;;
	IOR R1 R0
	IOR R2 R0	
	IOR R3 R0
	IOR R4 R0
	IOR R5 R0
	IOR R6 R0
	IOR R7 R0	
	IOR R0 R0
	SUB R0 R0 R1
	SUB R1 R1 R2
	SUB R2 R2 R3
	SUB R3 R3 R4
	SUB R4 R4 R5
	SUB R5 R5 R6
	SUB R6 R6 R7
	SUB R7 R7 R0		
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;; MUL
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        LDI R0 0
        LDI R1 0
        LDI R2 0
        LDI R3 0
        LDI R4 0
        LDI R5 0
        LDI R6 0
        LDI R7 0
        ;;
	;;
	IOR R1 R0
	IOR R2 R0	
	IOR R3 R0
	IOR R4 R0
	IOR R5 R0
	IOR R6 R0
	IOR R7 R0	
	IOR R0 R0
	MUL R0 R0 R1
	MUL R1 R1 R2
	MUL R2 R2 R3
	MUL R3 R3 R4
	MUL R4 R4 R5
	MUL R5 R5 R6
	MUL R6 R6 R7
	MUL R7 R7 R0		
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;; ADI
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        LDI R0 0
        LDI R1 0
        LDI R2 0
        LDI R3 0
        LDI R4 0
        LDI R5 0
        LDI R6 0
        LDI R7 0
        ;;
	;;
	IOR R1 R0
	IOR R2 R0	
	IOR R3 R0
	IOR R4 R0
	ADI R1 R1 1
	ADI R2 R2 2
	ADI R3 R2 3
	ADI R4 R2 4			
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;; SHR
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        LDI R0 0
        LDI R1 0
        LDI R2 0
        LDI R3 0
        LDI R4 0
        LDI R5 0
        LDI R6 0
        LDI R7 0
        ;;
	;;
	IOR R1 R0
	INC R1 R1
	NOT R2 R2
	XOR R1 R1 R2
	SHR R1 R1
	
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;; SHL
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        LDI R0 0
        LDI R1 0
        LDI R2 0
        LDI R3 0
        LDI R4 0
        LDI R5 0
        LDI R6 0
        LDI R7 0
        ;;
	;;
	IOR R1 R0
	INC R1 R1
	;; Make R1 = 01111...^R1
	NOT R2 R2
	SHR R2 R2
	XOR R1 R1 R2
	SHL R1 R1
	
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;; SRA
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        LDI R0 0
        LDI R1 0
        LDI R2 0
        LDI R3 0
        LDI R4 0
        LDI R5 0
        LDI R6 0
        LDI R7 0
        ;;
	;;
	IOR R1 R0
	INC R1 R1
	NOT R2 R2
	XOR R1 R1 R2
	;; SRA
	SRA R1 R1 2
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;; SLA
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        LDI R0 0
        LDI R1 0
        LDI R2 0
        LDI R3 0
        LDI R4 0
        LDI R5 0
        LDI R6 0
        LDI R7 0
        ;;
	;;
	IOR R1 R0
	INC R1 R1
	NOT R2 R2
	SHR R2 R2
	XOR R1 R1 R2
	;; SLA
	SLA R1 R1 2
	
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;; LD
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        LDI R0 0
        LDI R1 0
        LDI R2 0
        LDI R3 0
        LDI R4 0
        LDI R5 0
        LDI R6 0
        LDI R7 0
        ;;
	;;
	LD R0 R0
	
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;; ST
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        LDI R0 0
        LDI R1 0
        LDI R2 0
        LDI R3 0
        LDI R4 0
        LDI R5 0
        LDI R6 0
        LDI R7 0
        ;;
	;;
	IOR R1 R0
	INC R1 R1
;;; ST: M[R0] = 16
	LDI R0 4
	SHL R0 R0
	SHL R0 R0	
	ST R0 R1
	
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;; BRZ
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        LDI R0 0
        LDI R1 0
        LDI R2 0
        LDI R3 0
        LDI R4 0
        LDI R5 0
        LDI R6 0
        LDI R7 0
        ;;
	LDI R0 0
	BRZ R0 2
	INC R0 R0
	INC R0 R0
	LDI R0 1
	BRZ R0 2
	INC R0 R0
	INC R0 R0
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;; BRN
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        LDI R0 0
        LDI R1 0
        LDI R2 0
        LDI R3 0
        LDI R4 0
        LDI R5 0
        LDI R6 0
        LDI R7 0
        ;;
	LDI R0 1
	BRN R0 2
	INC R0 R0
	INC R0 R0	
	LDI R0 0
	DEC R0 R0
	BRN R0 2
	INC R0 R0
	INC R0 R0	
	
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;; JMP to 7*7*7 + 7*7 + 2
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        LDI R0 7
        MUL R1 R0 R0
        MOVA R2 R1
        MUL R1 R1 R0
        ADD R3 R2 R1
        ADI R0 R3 2
        LDI R7 0
        LDI R7 0
	LDI R7 0
	;; #391
	JMP R0
	;; #392	
	HAL
	;; #393
	HAL
	;; #394
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;; IOW
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        LDI R0 0
        LDI R1 0
        LDI R2 0
        LDI R3 0
        LDI R4 0
        LDI R5 0
        LDI R6 0
        LDI R7 0
        ;;
	;;
	IOR R1 R0
	IOR R2 R0	
	IOR R3 R0
	IOR R4 R0
	IOW R0 R1
	IOW R0 R2	
	IOW R0 R3
	IOW R0 R4
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;; USR
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        LDI R0 0
        LDI R1 0
        LDI R2 0
        LDI R3 0
        LDI R4 0
        LDI R5 0
        LDI R6 0
        LDI R7 0
	;;
	IOR R1 R0
	IOR R2 R0	
	IOR R3 R0
	IOR R4 R0
	IOR R5 R0
	IOR R6 R0
	IOR R7 R0	
	IOR R0 R0
	USR R1 R2 R3
        ;;
        ;;
        HAL
