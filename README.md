
# Schematic Design

add png

# Examples

```
OPCODE

0010001000
0001001000
0011001000

"ASSEMBLY CODE"
IN  REG1;regester 1. satır
INC REG1
OUT REG1
```
```
OPCODE

0010001000
0010010000
1111001010
0011001000

"ASSEMBLY CODE"

IN  REG1
IN  REG2
ADD REG1,REG2
OUT REG1

```

## Commands List
 Opcode usage
| CODE        | address1 |adress2              |
| ------------- | ------------- | -------------|
| 4 bit ex:(0101) | 3 bit ex:(001)   |3 bit ex:(101  |


| Code | Assembly |Example |           
| ------------- | ------------- |-------------|
|0000| MOV|MOV ADR1 <- ADR2 |
|0001|INC|INC ADR1|
|0010|IN|IN ADR1|
|0011|OUT|OUT ADR1|
|0100|LOAD|LOAD ADR1, ADR2|
|0101|LOADX|LOADX ADR1,ADR2|
|0110|MUL|MUL ADR1|
|0111|DIV|DIV ADR1,ADR2|
|1000|AND|AND ADR1, ADR2|
|1001|NAND|NAND ADR1,ADR2|
|1010|OR|OR ADR1,ADR2|
|1011|NOR|NOR ADR1,ADR2|
|1100|XOR|XOR ADR1,ADR2|
|1101|SUB|SUB ADR1,ADR2|
|1110|DEC|DEC ADR1|
|1111|ADD|ADD ADR1,ADR2|




