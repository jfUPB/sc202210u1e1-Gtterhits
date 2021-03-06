// Sebastian Segovia Medina
// 000371417
// sebastian.segovia@upb.edu.co


//Cargar pixeles
@8192
D=A
@R0
M=D

@8192
D=A
@R1
M=D

(READKBDF)
    @KBD //leer el teclado
    D=M
    @70 //'f' 
    D=D-A //si la tecla 'f' es presionada entonces pinte de negro los pixeles
    @DRAWBLACK
    D;JEQ //si D=0 salte
    @READKBDF
    0;JMP
   
(DRAWBLACK) //pinta de negro los pixeles asignando un -1 de la RAM[16384]-RAM[24575]
    @0
    D=M
    @END //si la RAM[0]=0 entonces salte al END
    D;JLE
    @2
    M=D
    @SCREEN
    D=A
    @3
    M=D
    (BLACKLOOP)
        @3
        A=M
        M=-1 //pone -1 en la direccion de la memoria actual
        @3
        D=M
        @1
        D=D+A
        @3
        M=D
        @2
        MD=M-1
        @BLACKLOOP //salta a BLACKLOOP hasta que todas las direcciones tengan -1 de la RAM[16384]-RAM[24575] 
        D;JGT

(READKBDC)
@KBD //de lo contrario lea el teclado de nuevo
D=M
@67 //'c'
D=D-A //si la tecla 'C' es presionada entonces pinte de negro los pixeles
@DRAWWHITE
D;JEQ
@READKBDC
0;JMP

(DRAWWHITE) //pinta de negro los pixeles asignando un 0 de la RAM[16384]-RAM[24575]
    @1
    D=M
    @END //si la RAM[1]=0 entonces salte al END
    D;JLE
    @5
    M=D
    @SCREEN
    D=A
    @6
    M=D
    (WHITELOOP)
        @6
        A=M
        M=0 //pone 0 en la direccion de la memoria actual
        @6
        D=M
        @1
        D=D+A
        @6
        M=D
        @5
        MD=M-1
        @WHITELOOP //salta a WHITELOOP hasta que todas las direcciones tengan 0 de la RAM[16384]-RAM[24575] 
        D;JGT
        @READKBDF
        0;JMP

(END)
    @END
    0;JMP