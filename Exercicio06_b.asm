# Código em C:
# ------------
# 1. int busca_r(int x, int n, int v[]) {
# 2.   if(n == 0)
# 3.     return -1;
# 4.   if(x == v[n-1])
# 5.     return n-1;
# 6.   return busca_r(x, n-1, v);
# 7. }
# ------------
# Código MIPS compilado:

# DADOS:
addi $a0, $zero, 2 # x=2
addi $a1, $zero, 3 # n=3
addi $a2, $zero, 0 # v[0]=0
addi $t0, $zero, 1
sw $t0, ($a3)      # v[0]=1
addi $t1, $zero, 2
sw $t1, 4($a3)     # v[1]=2
addi $t2, $zero, 3
sw $t2, 8($a3)     # v[2]=3

# CÓDIGO
busca_r: addi $sp, $sp, -16  # ajusta pilha para 4 itens
         sw $t0, 12($sp)          # empilha (salva) os valores do registrador $t0
         sw $t1, 8($sp)           # empilha (salva) os valores do registrador $t1
         sw $ra, 4($sp)           # empilha (salva) endereço de retorno
         sw $a0, 0($sp)           # empilha (salva) o argumento n         
         
         bne $a1, $zero, EXIT_1
           addi $v0, $zero, -1
           j END
         
         EXIT_1: 
         subi $a1, $a1, 1
         sll $t0, $a1, 2
         lw $t1, 0($t0)
         bne $a0, $t1, EXIT_2
           add $v0, $zero, $a1
           j END
        
         EXIT_2:
         jal busca_r 
         
         END:  
         lw $a0, 0($sp)       # desempilha (retorna) o argumento n         
         lw $ra, 4($sp)       # desempilha (retorna) endereço de retorno
         lw $t1, 8($sp)       # desempilha (retorna) os valores do registrador $t1       
         lw $t0, 8($sp)       # desempilha (retorna) os valores do registrador $t0 

         addi $sp, $sp, 16    # exclui 3 itens da pilha       
           
         jr $ra              # Retorna para o endereço em $ra
