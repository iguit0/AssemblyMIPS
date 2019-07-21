# Código em C:
# ------------
# 1. int busca(int x, int n, int v[]) {
# 2.   int k;
# 3.   k = n-1;
# 4.   while(k>=0 && v[k] != x)
# 5.     k -= 1;
# 6.   return k;
# 7. }
# ------------
# Código MIPS compilado:

# DADOS:
addi $a0, $zero, 1 # x=1
addi $a1, $zero, 3 # n=3
addi $a2, $zero, 0 # v[0]=0
addi $t0, $zero, 1
sw $t0, ($a3)      # v[0]=1
addi $t1, $zero, 2
sw $t1, 4($a3)     # v[1]=2
addi $t2, $zero, 3
sw $t2, 8($a3)     # v[2]=3

# CÓDIGO
busca: addi $sp, $sp, -12  # ajusta pilha para 3 itens
       sw $s0, 8($sp)           # empilha (salva) os valores do registrador $s0
       sw $t0, 4($sp)           # empilha (salva) os valores do registrador $t0
       sw $t1, 0($sp)           # empilha (salva) os valores do registrador $t1
      
       subi $s0, $a1, 1
       
       LOOP: 
             slti $t1, $s0, 0
             bne $t1, $zero, EXIT
             sll $t0, $s0, 2
             lw $t1, 0($t0)
             beq $t1, $a0, EXIT
             subi $s0, $s0, 1
             j LOOP
       EXIT: 
       add $v0, $zero, $s0
       
       lw $t1, 0($sp)       # desempilha (retorna) os valores do registrador $t1       
       lw $t0, 4($sp)       # desempilha (retorna) os valores do registrador $t0
       lw $s0, 8($sp)       # desempilha (retorna) os valores do registrador $s0              
       addi $sp, $sp, 12    # exclui 3 itens da pilha       
       
       jr $ra              # Retorna para o endereço em $ra