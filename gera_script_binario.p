DEFINE VARIABLE dir-name     AS CHARACTER NO-UNDO FORMAT "X(35)".
DEFINE VARIABLE db-name      AS CHARACTER NO-UNDO.
DEFINE VARIABLE front-end    AS CHARACTER NO-UNDO.
DEFINE VARIABLE outstring    AS CHARACTER NO-UNDO FORMAT "X(150)".
DEFINE VARIABLE delim        AS CHARACTER NO-UNDO FORMAT "X(1)".
DEFINE VARIABLE script-saida AS CHARACTER NO-UNDO FORMAT "X(50)".

DEFINE STREAM dumpcmds.
DEFINE STREAM loadcmds.

SET dir-name.

IF OPSYS = "WIN32" THEN
DO:
    ASSIGN delim = "~\" .
    OUTPUT STREAM dumpcmds TO "/totvs/scripts/dumpcad2loc".   
    OUTPUT STREAM loadcmds TO "/totvs/scripts/loadcad2loc".
    ASSIGN front-end = "call proutil " + DBNAME.
END.
ELSE
DO:
    ASSIGN delim = "/".

    script-saida = "dump_" + STRING(LC(LDBNAME(1))) + ".sh". 
    OUTPUT STREAM dumpcmds TO VALUE(script-saida).

    script-saida = "load_" + STRING(LC(LDBNAME(1))) + ".sh". 
    OUTPUT STREAM loadcmds TO VALUE(script-saida).
    ASSIGN front-end = "proutil " + DBNAME.
END.

outstring = " echo 'Inicio do Processamento de Exportacao ' `date`" + " > " + LDBNAME(1) + ".log".

PUT STREAM dumpcmds outstring SKIP.
PUT STREAM loadcmds outstring SKIP.

FOR EACH _file WHERE _file-num > 0 AND _file-num < 32768:
    /* Linha de Status Inicio de Processamento (Dump) */
    ASSIGN outstring = " echo 'Inicio tabela " + STRING(_file._file-name) + "' "  + STRING("`date`") + " >> " + LDBNAME(1) + ".log".
    PUT STREAM dumpcmds outstring SKIP.

    /* Comando Progress */
    /*ASSIGN outstring = front-end + " -C dump " + _file-name + " " + dir-name.*/
    ASSIGN outstring = front-end + " -C dump " + _file-name + " " + dir-name + " -RO -B 100 -spin 2000 >> " + LDBNAME(1) + ".log". .

    PUT STREAM dumpcmds outstring SKIP.
    
    
    /* Linha de Status Fim de Processamento (Dump) */
    ASSIGN outstring = " echo 'Fim tabela " + STRING(_file._file-name) + "' "  + STRING("`date`") + " >> " + LDBNAME(1) + ".log".
    PUT STREAM dumpcmds outstring SKIP.

    /* Linha de Status Inicio de Processamento (Load) */
    ASSIGN outstring = " echo 'Inicio tabela " + STRING(_file._file-name) + "' "  + STRING("`date`") + " >> " + LDBNAME(1) + ".log".
    PUT STREAM loadcmds outstring SKIP.

    /*Comando Progress */
    ASSIGN outstring = front-end + " -C load " + dir-name + delim + _file-name + ".bd" + " -B 1000 -spin 2000 -TB 31 -TM 32 -i -G 0 >> " + LDBNAME(1) + ".log". 
    PUT STREAM loadcmds outstring SKIP.

    /* Linha de Status Fim de Processamento (Load) */
    ASSIGN outstring = " echo 'Fim tabela " + STRING(_file._file-name) + "' "  + STRING("`date`") + " >> " + LDBNAME(1) + ".log".
    PUT STREAM loadcmds outstring SKIP.
END.

outstring = " echo 'Fim do Processamento de Exportacao ' `date`" + " >> " + LDBNAME(1) + ".log".
PUT STREAM dumpcmds outstring SKIP.
PUT STREAM loadcmds outstring SKIP.

OUTPUT STREAM dumpcmds CLOSE.
OUTPUT STREAM loadcmds CLOSE.
quit.
