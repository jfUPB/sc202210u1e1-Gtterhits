// Sebastian Segovia Medina
// 000371417
// sebastian.segovia@upb.edu.co

//Variables

(LEERTECLADO)
@KBD //leer el teclado

@70 //si la tecla "f" es presionada entonces pinte de negro los pixeles


//pintar de negro los pixeles






(BRAWBLACK) //pinta de negro los pixeles asignando un -1 de la RAM[16384]-RAM[24575]
    @0
    D=M
    @FIN //si la RAM[0]=0 entonces salte al END
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
        @

(DRAWWHITE)
    @1
    D=M
    @FIN //si la RAM[1]=0 entonces salte al END
    D;JLE
    @16
    M=D
    @SCREEN
    D=A
    @17
    M=D
    (WHITELOOP)
        @17
        A=M
        M=-1 //pone -1 en la direccion de la memoria actual
        @17
        D=M
        @1
        D=D+A
        @17
        M=D
        @16
        MD=M-1
        @BLACKLOOP //salta a BLACKLOOP hasta que todas las direcciones tengan -1 de la RAM[16384]-RAM[24575] 
        D;JGT


(FIN)
    @FIN
    0;JMP