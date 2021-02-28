grammar Enquanto;

programa : seqComando;     // sequência de comandos

seqComando: comando (';' comando)* ;

comando: ID ':=' expressao                               # atribuicao
       | 'skip'                                          # skip
       | ('se' | 'senaose') booleano 'entao' comando 'senao' comando   # se
       | 'enquanto' booleano 'faca' comando              # enquanto
       | 'exiba' TEXTO                                   # exiba
       | 'escreva' expressao                             # escreva
       | '{' seqComando '}'                              # bloco
       | 'para' ID 'de' expressao 'ate' expressao ('passo' expressao)? 'faca' comando     # para
       | 'escolha' ID ('caso' expressao ':' | 'outro')  comando     # escolha
       ;

expressao: INT                                           # inteiro
         | 'leia'                                        # leia
         | ID                                            # id
         | expressao ('*' | '/') expressao               # opBin
         | expressao ('+' | '-') expressao               # opBin
         | expressao '^' expressao                       # opBin
         | '(' expressao ')'                             # expPar
         ;

booleano: BOOLEANO                                       # bool
        | expressao '=' expressao                        # opRel
        | expressao '<=' expressao                       # opRel
        | expressao '<' expressao                        # opRel
        | expressao '>=' expressao                       # opRel
        | expressao '>' expressao                        # opRel
        | expressao '<>' expressao                       # opRel
        | 'nao' booleano                                 # naoLogico
        | booleano 'e' booleano                          # eLogico
        | booleano 'ou' booleano                         # ouLogico
        | booleano 'xor' booleano                        # xorLogico
        | '(' booleano ')'                               # boolPar
        ;


BOOLEANO: 'verdadeiro' | 'falso';
INT: ('0'..'9')+ ;
ID: ('a'..'z')+;
TEXTO: '"' .*? '"';

Comentario: '#' .*? '\n' -> skip;
Espaco: [ \t\n\r] -> skip;