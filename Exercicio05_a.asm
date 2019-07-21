# Código em C:
# ------------
# while(b < 32) {
#   a = a + a; 
#   v[4] = a + b;
#   b = b + 1;
# }
# ------------
# $s0 -> a
# $s1 -> b
# $s6 -> v[]
# Código MIPS compilado:      
# DADOS:
addi $s0, $zero, 5 # a=5
addi $s1, $zero, 30 # b=30
addi $s6, $zero, 32 # v[0]

addi $t0, $zero, 7 
sw $t0, 16($s6) # v[4]=7

# CÒDIGO: 

LOOP: slti $t0, $s1, 32
      beq $t0, $zero, EXIT
      add $s0, $s0, $s0
      add $t1, $s0, $s1
      sw $t1, 16($s6)
      addi $s1, $s1, 1
      j LOOP
EXIT:      