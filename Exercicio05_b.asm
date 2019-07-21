# Código em C:
# ------------
# while(v[0] <= a) 
#   v[0] = v[0] + b;
# ------------
# $s0 -> a
# $s1 -> b
# $s6 -> v[]
# Código MIPS compilado:      
# DADOS:
addi $s0, $zero, 15 # a=15
addi $s1, $zero, 8 # b=8
addi $s6, $zero, 32 # v[0]

addi $t0, $zero, 7 
sw $t0, 0($s6) # v[0]=7

# CÒDIGO: 

LOOP: lw $t0, 0($s6)
      slt $t1, $s0, $t0 
      bne $t1, $zero, EXIT
      add $t0, $t0, $s1
      sw $t0, 0($s6)
      j LOOP
EXIT:      