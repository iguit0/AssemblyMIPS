# Código em C:
# A[16] = B[4] - f

# Os vetores A e B de inteiros, tem endereço de base 32 e 128 respectivamente. A variável f está na posição 256
# Código MIPS compilado:
# DADOS:

addi $t0, $zero, 5 
addi $t1, $zero, 256 # f
sw $t0, 0($t1) # f = 5

addi $t0, $zero, 9 
addi $t1, $zero, 128 # B[]
sw $t0, 16($t1) # B[4] = 9

# CÓDIGO:

addi $t0, $zero, 128
addi $t1, $zero, 256

lw $t2, 16($t0)
lw $s0, 0($t1)

sub $t3, $t2, $s0

addi $t4, $zero, 32
sw $t3, 64($t4)
