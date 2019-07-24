# Código em C:
# ------------
# if (v[8] >= c) 
#   a = a + b + c; 
#   v[8] = v[8] + a;
# else
#   a = a - b - c;
#   v[8] = v[8] + a;
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
addi $s6, $zero, 32 # v[0]

addi $t0, $zero, 7 
sw $t0, 32($s6) # v[8] = 7

# CÒDIGO: 

lw $t0, 32($s6)
    slt $t1, $t0, $s2  
    bne $t1, $zero, ELSE
    add $s0, $s0, $s1
    add $s0, $s0, $s2
    add $t0, $t0, $s0
    j EXIT
ELSE: 
    sub $s0, $s0, $s1
    sub $s0, $s0, $s2
    add $t0, $t0, $s0
EXIT: sw $t0, 32($s6)
