# Código em C:
# B[8] = A[14] + B[12] + h

# Os vetores A e B de inteiros, tem endereço de base 32 e 128 respectivamente. A variável h está na posição 256
# Código MIPS compilado:
# DADOS:

addi $t0, $zero, 7 
addi $t1, $zero, 32 # A[]
sw $t0, 56($t1) # A[14] = 7

addi $t0, $zero, 9 
addi $t1, $zero, 128 # B[]
sw $t0, 48($t1) # B[12] = 9

addi $t0, $zero, 5 
addi $t1, $zero, 256 # f
sw $t0, 0($t1) # f = 5



# CÓDIGO:

addi $t0, $zero, 32
addi $t1, $zero, 128
addi $t2, $zero, 256

lw $t3, 56($t0)
lw $t4, 48($t1)
lw $s0, 0($t2)

add $t5, $t3, $t4
add $t5, $t5, $s0

sw $t5, 32($t1)
