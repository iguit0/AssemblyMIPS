# Código em C:
# ------------
# if (a < b) 
#   a = b + c; 
# else
#   a = b - c;
# ------------
# $s0 -> a
# $s1 -> b
# $s2 -> c
# $s3 -> d
# $s6 -> v[]
# Código MIPS compilado:      

# DADOS:
addi $s0, $zero, 5 # a=5
addi $s1, $zero, 8 # b=8
addi $s2, $zero, 4 # c=4
addi $s3, $zero, 4 # d=4

# CÒDIGO: 
    
    slt $t0, $s0, $s1  
    beq $t0, $zero, ELSE
    add $s0, $s1, $s2
    j EXIT
ELSE: 
    sub $s0, $s1, $s2
EXIT:
