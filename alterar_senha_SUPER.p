def var v_cod_senha as char no-undo INIT 'super'.

DISABLE TRIGGERS FOR LOAD OF usuar_mestre.

find usuar_mestre where cod_usuario = 'SUPER'.

assign usuar_mestre.cod_senha = BASE64-ENCODE(sha1-digest(v_cod_senha))
       usuar_mestre.cod_senha_framework = BASE64-ENCODE(sha1-digest(v_cod_senha)).
