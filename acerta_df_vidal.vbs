[10:34] Rodrigo Vidal
'#***************************************************************************
'# File..................: acerta-df.vbs
'# Description...........: Manipula arquivos .df para ajudar em conversao TOTVS 11
'# Created by............: Fernando de Freitas Ciarelli
'#***************************************************************************option explicit
on error resume nextdim objFSO
dim objArq
const Overwrite = True
dim strArqOrig
dim strArq
dim strLinha
dim strOpcao
dim strDir
dim strDirBkp
dim strIdxNome
dim strTblNome
dim Arq1
dim Arq2
dim Idx
dim TblMainsub Main() 'Solicita função
strOpcao = InputBox("Informe a opção desejada: " & chr(13) & chr(13) & "1 - Desativa índices em DF de Correção" & chr(13) & "2 - Altera Schema Area em DF" & chr(13) & "3 - Sair")
If strOpcao = "" Then
WScript.Quit
End if select case strOpcao
case 1
strDir = InputBox("Informe o diretório onde as DFs se encontram: ")
SelecArq strDir, strOpcao, "0", "0"
case 2
strDir = InputBox("Informe o diretório onde as DFs se encontram: ")
strTblNome = InputBox("Informe o nome da área de dados: ")
strIdxNome = InputBox("Informe o nome da área de índices: ")
SelecArq strDir, strOpcao, strTblNome, strIdxNome
case else
WScript.Quit
end selectend subfunction SelecArq(strDir,strOpcao,strTblNome,strIdxNome) set objFSO = CreateObject("Scripting.FileSystemObject")
strDirBkp=strDir + "\orig"
' Create a new folder
if not objFSO.FolderExists(strDirBkp) then
objFSO.CreateFolder strDirBkp
end if ' Move files into the new folder
objFSO.MoveFile strDir + "\*.df", strDirBkp Set objFSO = objFSO.GetFolder(strDirBkp)
For Each objArq in objFSO.Files
Arq1=objArq.Path
Arq2=objArq.Path
Arq2=replace(Arq1,"\orig","")
select case strOpcao
case 1 AcertaIdx Arq1, Arq2
case 2 AcertaArea Arq1, Arq2, strTblNome, strIdxNome
end select
Next
end functionfunction AcertaIdx(strArq1, strArq2) set objFSO = CreateObject("Scripting.FileSystemObject")
set Arq1 = objFSO.OpenTextFile(strArq1)
set Arq2 = objFSO.CreateTextFile(strArq2) do while not Arq1.AtEndofStream
strLinha = Arq1.ReadLine
if InStr(strLinha,"ADD INDEX")> 0 Then
Arq2.WriteLine strLinha
Arq2.WriteLine " INACTIVE"
else
Arq2.WriteLine strLinha
end if
loop
Arq1.close
set Arq1 = nothing
Arq2.close
set Arq2 = nothing
end functionfunction AcertaArea(strArq1, strArq2, strTblNome, strIdxNome) set objFSO = CreateObject("Scripting.FileSystemObject")
set Arq1 = objFSO.OpenTextFile(strArq1)
set Arq2 = objFSO.CreateTextFile(strArq2)' TblNome = InputBox("Informe o nome da área de dados: ")
'IdxNome = InputBox("Informe o nome da área de índices: ")
do while not Arq1.AtEndofStream
strLinha = Arq1.ReadLine
if InStr(strLinha,"ADD INDEX")> 0 then
Idx=1
Arq2.WriteLine strLinha
else
if InStr(strLinha,"ADD TABLE")> 0 then
Tbl=1
Arq2.WriteLine strLinha
else
if InStr(strLinha,"AREA")> 0 and Idx then
Idx=0
Arq2.WriteLine " AREA """ & strIdxNome & """"
else
if InStr(strLinha,"AREA")> 0 and Tbl then
Tbl=0
Arq2.WriteLine " AREA """ & strTblNome & """"
else
Arq2.WriteLine strLinha
end if
end if
end if
end if
loop
Arq1.close
set Arq1 = nothing
Arq2.close
set Arq2 = nothing
end function

