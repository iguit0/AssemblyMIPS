# Codigo em C:
# f = (a + b) - (c + d - e);

# As variaveis a, b, c, d, e, f sao associadas aos registradores $s0, $s1, $s2, $s3, $s4, $s5.
# Codigo MIPS compilado:
# DADOS:
addi $s0, $zero, 5 # a = 5
addi $s1, $zero, 9 # b = 10
addi $s2, $zero, 2 # c = 2
addi $s3, $zero, 5 # d = 5
addi $s4, $zero, 4 # e = 4

# CODIGO:

add $t0, $s0, $s1
add $t1, $s2, $s3
sub $t1, $t1, $s4
sub $s5, $t0, $t1
