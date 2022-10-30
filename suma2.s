.data
cad0: .asciiz "Introduzca un numero entero  : " 
cad1: .asciiz "Introduzca otro numero entero: " 
cad4: .asciiz "Ambos Numeros son iguales"
cad5: .asciiz "El Primer numero es Mayor"
cad6: .asciiz "El Segundo numero es Mayor"
cr: .byte 13,10,0
.text 

main: 
#=======================================================
# Se escribe el string pidiendo el primer numero 
addi $v0, $zero, 4 
la $a0, cad0 
syscall 
addi $v0, $zero, 5 		# Se lee el primer numero 
syscall 
add $s0, $v0, $zero 	# Se guarda el numero en $s0 
#=======================================================
# Se escribe el string pidiendo el segundo numero 
addi $v0, $zero, 4 
la $a0, cad1 
syscall 
addi $v0, $zero, 5 		# Se lee el segundo numero 
syscall 
add $s1, $v0, $zero 	# Se guarda el numero en $s1 

#=======================================================
# Usando Instrucciones de comparacion  para decision
# Verificando si son iguales, primero se ejecuta Si es falso
# SI son iguales ejecutamos el codigo inmediatamente siguiente
# caso contrario saltamos a una etiqueta

bne $s0, $s1,NoIguales	
	# Se escribe el mensaje de string previo al resultado 
	addi $v0, $zero, 4 
	la $a0, cad4 
	syscall 
	j exit
	
NoIguales: 
	slt $s2,$s0,$s1   			#    $s2 = 1 si num_1 < Num_2		
	bne $s2, $zero, EsMayor 	# si $s2 = 1 entonces   num_1 < Num_2 de lo contrario salta	
	# Se escribe el mensaje de string previo al resultado 
	addi $v0, $zero, 4 
	la $a0, cad5 
	syscall 
	j exit
	
EsMayor:
	# Se escribe el mensaje de string previo al resultado 
	addi $v0, $zero, 4 
	la $a0, cad6
	syscall 
	j exit


exit:
# Se escribe un return al final 
addi $v0, $zero, 4 
la $a0, cr 
syscall 

# Fin del programa. 
addi $v0, $zero, 10 
syscall 
