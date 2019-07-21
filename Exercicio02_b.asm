# Código em C:
# f = (a + b) - (c + d - e);

# As variáveis a, b, c, d, e, f não estão associadas a nenhum dos registradores. $s0, $s1, $s2, $s3, $s4, $s5. 
# E estão armazenadas sequencialmente na memória a partir do endereço 32.
# Código MIPS compilado:
# DADOS:

addi $t0, $zero, 5 # a = 5
sw $t0, 32
addi $t1, $zero, 9 # b = 10
sw $t1, 36
addi $t2, $zero, 2 # c = 2
sw $t2, 40
addi $t3, $zero, 5 # d = 5
sw $t3, 44
addi $t4, $zero, 4 # e = 4
sw $t4, 48

# CÓDIGO:

addi $t0, $zero, 32
lw $s0, 0($t0)
lw $s1, 4($t0)
lw $s2, 8($t0)
lw $s3, 12($t0)
lw $s4, 16($t0)

add $t1, $s0, $s1
add $t2, $s2, $s3
sub $t2, $t2, $s4
sub $t3, $t1, $t2

sw $t3, 20($t0)
