.data
cad0: .asciiz "Introduzca un número entero: "
cad1: .asciiz "Introduzca otro número entero: "
cad2: .asciiz "La suma de ambos es: "
cad3: .asciiz "La multimplicacion es: "
cr: .byte 13,10,0
.text

main:
# Se escribe el string pidiendo el primer número
addi $v0, $zero, 4
la $a0, cad0
syscall

# Se lee el primer número
addi $v0, $zero, 5
syscall
add $s0, $v0, $zero # Se guarda el número en $s0



# Se escribe el string pidiendo el segundo número
addi $v0, $zero, 4
la $a0, cad1
syscall

# Se lee el segundo número
addi $v0, $zero, 5
syscall
add $s1, $v0, $zero # Se guarda el número en $s1


add $s2, $s0, $s1 # Se suman ambos números
mul $s3, $s0, $s1   # Se multiplica


# Se escribe el mensaje de string previo al resultado de la suma
addi $v0, $zero, 4
la $a0, cad2
syscall

# Se escribe el resultado
addi $v0, $zero, 1
add $a0, $zero, $s2
syscall



# Se escribe el mensaje de string previo al resultado de la multiplicacion
addi $v0, $zero, 4
la $a0, cad3
syscall

# Se escribe el resultado
addi $v0, $zero, 1
add $a0, $zero, $s3
syscall



# Se escribe un return al final
addi $v0, $zero, 4
la $a0, cr
syscall


# Fin del programa.
addi $v0, $zero, 10
syscall
