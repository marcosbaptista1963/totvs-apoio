#***************************************************************************
# Copyright DATASUL S.A. (2010)
# All rights reserved.
#
# Arquivo...............: scripts/CarregaBancos.bat
# Descricao.............: Script de Carga de Bancos
# Criado por............: Instalador Datasul - GAPE
# Data Criacao..........: 2-26-2014 11:04:44
#***************************************************************************
export dlc=/producao/progress/dlc117
export path=/producao/progress/dlc117/bin

#sysctl -w kernel.sem="500 64000 64 1024"

#---- BANCOS SÓ 4GL
#-Mn = 20 / -Ma = 10 (200 conexoes 4GL)
# Se tiver só conexao 4GL este e o calculo


#----4GL
#-Mpb =  19 / -Ma 10 / -Mn 22 / -n 210  (190 conexoes 4GL)
#----SQL
#-Mpb =  2 / -Ma 5 (10 conexoes SQL)
#Quando tiver conexao 4GL e SQL este e o calculo


#####BANCO TOTVS11###################
proserve /producao/totvs11/ems2adt  -B 2000   -spin 120000 -L 200000 -Mm 16384 -N tcp -S 23600 -n 210 -Ma 10 -Mn 20 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/totvs11/ems2adt
proserve /producao/totvs11/ems2mp   -B 1000   -spin 120000 -L 200000 -Mm 16384 -N tcp -S 23602 -n 210 -Ma 10 -Mn 20 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/totvs11/ems2mp
proserve /producao/totvs11/neogrid  -B 50000  -spin 120000 -L 200000 -Mm 16384 -N tcp -S 23603 -n 210 -Ma 10 -Mn 20 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/totvs11/neogrid
proserve /producao/totvs11/hcm      -B 15000  -spin 120000 -L 200000 -Mm 16384 -N tcp -S 23607 -n 210 -Ma 10 -Mn 20 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/totvs11/hcm
proserve /producao/totvs11/srcadger -B 1000   -spin 120000 -L 200000 -Mm 16384 -N tcp -S 23608 -n 210 -Ma 10 -Mn 20 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/totvs11/srcadger
proserve /producao/totvs11/srmovfin -B 1000   -spin 120000 -L 200000 -Mm 16384 -N tcp -S 23609 -n 210 -Ma 10 -Mn 20 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/totvs11/srmovfin

proserve /producao/totvs11/ems2sor  -B 1000   -spin 120000 -L 200000 -Mm 16384 -N tcp -S 23610 -n 210 -Ma 10 -Mn 22 -Mpb 19 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/totvs11/ems2sor
proserve /producao/totvs11/ems2sor  -ServerType SQL -m3  -S 23611 -Ma 5 -Mi 5 -Mpb 2  

proserve /producao/totvs11/finance  -B 1000   -spin 120000 -L 200000 -Mm 16384 -N tcp -S 23614 -n 210 -Ma 10 -Mn 22 -Mpb 19 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/totvs11/finance
proserve /producao/totvs11/finance  -ServerType SQL -m3  -S 23615 -Ma 5 -Mi 5 -Mpb 2  

proserve /producao/totvs11/payroll  -B 1000   -spin 120000 -L 200000 -Mm 16384 -N tcp -S 23616 -n 210 -Ma 10 -Mn 22 -Mpb 19 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/totvs11/payroll
proserve /producao/totvs11/payroll  -ServerType SQL -m3  -S 23617 -Ma 5 -Mi 5 -Mpb 2  

proserve /producao/totvs11/emsdev   -B 3000   -spin 120000 -L 200000 -Mm 16384 -N tcp -S 23618 -n 210 -Ma 10 -Mn 22 -Mpb 19 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/totvs11/emsdev
proserve /producao/totvs11/emsdev   -ServerType SQL -m3  -S 23619 -Ma 5 -Mi 5 -Mpb 2  

proserve /producao/totvs11/emsfnd   -B 30000  -spin 120000 -L 500000 -Mm 16384 -N tcp -S 23620 -n 210 -Ma 10 -Mn 22 -Mpb 19 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/totvs11/emsfnd
proserve /producao/totvs11/emsfnd   -ServerType SQL -m3  -S 23621 -Ma 5 -Mi 5 -Mpb 2  
proshut /producao/totvs11/emsfnd -C apw 
proshut /producao/totvs11/emsfnd -C biw 
proshut /producao/totvs11/emsfnd -C aiw
proshut /producao/totvs11/emsfnd -C watchdog 

proserve /producao/totvs11/eai      -B 1000   -spin 120000 -L 200000 -Mm 16384 -N tcp -S 23622 -n 210 -Ma 10 -Mn 22 -Mpb 19 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/totvs11/eai
proserve /producao/totvs11/eai      -ServerType SQL -m3  -S 23623 -Ma 5 -Mi 5 -Mpb 2  

proserve /producao/totvs11/mdtfrw   -B 1000   -spin 120000 -L 200000 -Mm 16384 -N tcp -S 23624 -n 210 -Ma 10 -Mn 22 -Mpb 19 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/totvs11/mdtfrw
proserve /producao/totvs11/mdtfrw   -ServerType SQL -m3  -S 23625 -Ma 5 -Mi 5 -Mpb 2  

proserve /producao/totvs11/mdmerge  -B 1000   -spin 120000 -L 200000 -Mm 16384 -N tcp -S 23626 -n 210 -Ma 10 -Mn 22 -Mpb 19 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/totvs11/mdmerge
proserve /producao/totvs11/mdmerge  -ServerType SQL -m3  -S 23627 -Ma 5 -Mi 5 -Mpb 2  

proserve /producao/totvs11/mdtcrm   -B 2000   -spin 120000 -L 200000 -Mm 16384 -N tcp -S 23628 -n 210 -Ma 10 -Mn 22 -Mpb 19 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/totvs11/mdtcrm
proserve /producao/totvs11/mdtcrm   -ServerType SQL -m3  -S 23629 -Ma 5 -Mi 5 -Mpb 2  

####BANCOS EMS506#####
proserve /producao/ems506/ems5cad   -B 80000  -spin 120000  -L 500000 -Mm 16384 -N tcp -S 23605 -n 210 -Ma 10 -Mn 20 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/ems506/ems5cad
#proserve /producao/ems506/ems5cad   -ServerType SQL -m3  -S 23659 -Ma 5 -Mi 5 -Mpb 2
#proshut /producao/ems506/ems5cad -C apw 
#proshut /producao/ems506/ems5cad -C biw 
#proshut /producao/ems506/ems5cad -C aiw 
#proshut /producao/ems506/ems5cad -C watchdog   

proserve /producao/ems506/ems5mov   -B 600000 -spin 120000  -L 500000 -Mm 16384 -N tcp -S 23606 -n 210 -Ma 10 -Mn 20 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/ems506/ems5mov
#proserve /producao/ems506/ems5mov   -ServerType SQL -m3  -S 23669 -Ma 5 -Mi 5 -Mpb 2
#proshut /producao/ems506/ems5mov -C apw 
#proshut /producao/ems506/ems5mov -C biw   
#proshut /producao/ems506/ems5mov -C aiw  
#proshut /producao/ems506/ems5mov -C watchdog

####BANCO EMS2MULT#####                                                             
proserve /producao/nortene/ems2mult -B 200000  -spin 120000  -L 500000 -Mm 16384 -N tcp -S 23612 -n 210 -Ma 10 -Mn 22 -Mpb 19 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/nortene/ems2mult
proserve /producao/nortene/ems2mult -ServerType SQL -m3  -S 23613 -Ma 5 -Mi 5 -Mpb 2  
proshut /producao/nortene/ems2mult -C apw 
proshut /producao/nortene/ems2mult -C biw 
proshut /producao/nortene/ems2mult -C aiw 
proshut /producao/nortene/ems2mult -C watchdog

####BANCO nortene#####                                                              
proserve /producao/nortene/ems2emp  -B 600000 -spin 120000  -L 500000 -Mm 16384 -N tcp -S 23630 -n 210 -Ma 10 -Mn 20 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/nortene/ems2emp
proshut /producao/nortene/ems2emp -C apw 
proshut /producao/nortene/ems2emp -C biw  
proshut /producao/nortene/ems2emp -C aiw   
proshut /producao/nortene/ems2emp -C watchdog

proserve /producao/nortene/ems2esp  -B 350000 -spin 120000  -L 200000 -Mm 16384 -N tcp -S 23633 -n 210 -Ma 10 -Mn 20 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/nortene/ems2esp
proshut /producao/nortene/ems2esp -C apw  
proshut /producao/nortene/ems2esp -C biw   
proshut /producao/nortene/ems2esp -C aiw 
proshut /producao/nortene/ems2esp -C watchdog

#####BANCO engepol#####                                                             
proserve /producao/engepol/ems2emp  -B 50000 -spin 120000  -L 500000 -Mm 16384 -N tcp -S 23631 -n 210 -Ma 10 -Mn 20 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/engepol/ems2emp
proshut /producao/engepol/ems2emp -C apw  
proshut /producao/engepol/ems2emp -C biw   
proshut /producao/engepol/ems2emp -C aiw 
proshut /producao/engepol/ems2emp -C watchdog

proserve /producao/engepol/ems2emp2  -B 50000 -spin 120000  -L 500000 -Mm 16384 -N tcp -S 23692 -n 210 -Ma 10 -Mn 20 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/engepol/ems2emp2
proshut /producao/engepol/ems2emp2 -C apw  
proshut /producao/engepol/ems2emp2 -C biw   
proshut /producao/engepol/ems2emp2 -C aiw 
proshut /producao/engepol/ems2emp2 -C watchdog

proserve /producao/engepol/ems2esp  -B 30000 -spin 120000  -L 200000 -Mm 16384 -N tcp -S 23634 -n 210 -Ma 10 -Mn 20 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/engepol/ems2esp
proshut /producao/engepol/ems2esp -C apw  
proshut /producao/engepol/ems2esp -C biw  
proshut /producao/engepol/ems2esp -C aiw 
proshut /producao/engepol/ems2esp -C watchdog

proserve /producao/engepol/ems2esp2  -B 30000 -spin 120000  -L 200000 -Mm 16384 -N tcp -S 23693 -n 210 -Ma 10 -Mn 20 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/engepol/ems2esp2
proshut /producao/engepol/ems2esp2 -C apw  
proshut /producao/engepol/ems2esp2 -C biw  
proshut /producao/engepol/ems2esp2 -C aiw 
proshut /producao/engepol/ems2esp2 -C watchdog

#####BANCO santeno ########                                                         
proserve /producao/santeno/ems2emp  -B 50000 -spin 120000  -L 500000 -Mm 16384 -N tcp -S 23632 -n 210 -Ma 10 -Mn 20 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/santeno/ems2emp
proshut /producao/santeno/ems2emp -C apw
proshut /producao/santeno/ems2emp -C biw   
proshut /producao/santeno/ems2emp -C aiw 
proshut /producao/santeno/ems2emp -C watchdog

proserve /producao/santeno/ems2emp2  -B 50000 -spin 120000  -L 500000 -Mm 16384 -N tcp -S 23694 -n 210 -Ma 10 -Mn 20 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/santeno/ems2emp2
proshut /producao/santeno/ems2emp2 -C apw
proshut /producao/santeno/ems2emp2 -C biw   
proshut /producao/santeno/ems2emp2 -C aiw 
proshut /producao/santeno/ems2emp2 -C watchdog

proserve /producao/santeno/ems2esp  -B 15000 -spin 120000  -L 200000 -Mm 16384 -N tcp -S 23635 -n 210 -Ma 10 -Mn 20 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/santeno/ems2esp
proshut /producao/santeno/ems2esp -C apw
proshut /producao/santeno/ems2esp -C biw   
proshut /producao/santeno/ems2esp -C aiw  
proshut /producao/santeno/ems2esp -C watchdog

proserve /producao/santeno/ems2esp2  -B 15000 -spin 120000  -L 200000 -Mm 16384 -N tcp -S 23695 -n 210 -Ma 10 -Mn 20 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/santeno/ems2esp2
proshut /producao/santeno/ems2esp2 -C apw
proshut /producao/santeno/ems2esp2 -C biw   
proshut /producao/santeno/ems2esp2 -C aiw  
proshut /producao/santeno/ems2esp2 -C watchdog

#####BANCO RAZU ########                                                         
proserve /producao/razu/ems2emp     -B 30000 -spin 120000  -L 200000 -Mm 16384 -N tcp -S 23640 -n 210 -Ma 10 -Mn 20 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/razu/ems2emp
proserve /producao/razu/ems2esp     -B 1000  -spin 120000  -L 200000 -Mm 16384 -N tcp -S 23643 -n 210 -Ma 10 -Mn 20 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/razu/ems2esp

#####BANCO CEMOCA ########                                                         
proserve /producao/cemoca/ems2emp   -B 10000 -spin 120000  -L 200000 -Mm 16384 -N tcp -S 23641 -n 210 -Ma 10 -Mn 20 -Mi 5 -bibufs 60 -minport 22000 -maxport 25100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/cemoca/ems2emp
proserve /producao/cemoca/ems2esp   -B 1000  -spin 120000  -L 200000 -Mm 16384 -N tcp -S 23644 -n 210 -Ma 10 -Mn 20 -Mi 5 -bibufs 60 -minport 22000 -maxport 25100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/cemoca/ems2esp

#####BANCO ANSIL ########                                                         
proserve /producao/ansil/ems2emp    -B 10000 -spin 120000  -L 200000 -Mm 16384 -N tcp -S 23642 -n 210 -Ma 10 -Mn 20 -Mi 5 -bibufs 60 -minport 22000 -maxport 25100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/ansil/ems2emp
proserve /producao/ansil/ems2esp    -B 1000  -spin 120000  -L 200000 -Mm 16384 -N tcp -S 23645 -n 210 -Ma 10 -Mn 20 -Mi 5 -bibufs 60 -minport 22000 -maxport 25100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/ansil/ems2esp

#####BANCO NCM ########                                                         
proserve /producao/ncm/ems2emp    -B 10000 -spin 120000  -L 200000 -Mm 16384 -N tcp -S 23648 -n 210 -Ma 10 -Mn 20 -Mi 5 -bibufs 60 -minport 22000 -maxport 25100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/ncm/ems2emp
proserve /producao/ncm/ems2esp    -B 1000  -spin 120000  -L 200000 -Mm 16384 -N tcp -S 23649 -n 210 -Ma 10 -Mn 20 -Mi 5 -bibufs 60 -minport 22000 -maxport 25100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/ncm/ems2esp

####BANCO SILOX#####
proserve /producao/silox/ems2emp -B 10000 -spin 120000 -L 500000 -Mm 16384 -N tcp -S 23650 -n 210 -Ma 10 -Mn 20 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500  -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/silox/ems2emp 
proshut /producao/silox/ems2emp -C apw
proshut /producao/silox/ems2emp -C biw
proshut /producao/silox/ems2emp -C aiw
proshut /producao/silox/ems2emp -C watchdog

proserve /producao/silox/ems2esp -B 1000  -spin 120000 -L 200000 -Mm 16384 -N tcp -S 23651 -n 210 -Ma 10 -Mn 20 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/silox/ems2esp 
proshut /producao/silox/ems2esp -C apw
proshut /producao/silox/ems2esp -C biw
proshut /producao/silox/ems2esp -C aiw
proshut /producao/silox/ems2esp -C watchdog

####BANCO MULTITEC#####
proserve /producao/multitec/ems2emp -B 10000 -spin 120000  -L 500000 -Mm 16384 -N tcp -S 23671 -n 210 -Ma 10 -Mn 20 -Mpb 11 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/multitec/ems2emp
proserve /producao/multitec/ems2emp   -ServerType SQL -m3  -S 21671 -Ma 5 -Mi 5 -Mpb 2 
proshut /producao/multitec/ems2emp -C apw
proshut /producao/multitec/ems2emp -C biw
proshut /producao/multitec/ems2emp -C aiw
proshut /producao/multitec/ems2emp -C watchdog

proserve /producao/multitec/ems2esp -B 1000  -spin 120000  -L 200000 -Mm 16384 -N tcp -S 23672 -n 210 -Ma 10 -Mn 20 -Mpb 11 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/multitec/ems2esp
proserve /producao/multitec/ems2esp   -ServerType SQL -m3  -S 21672 -Ma 5 -Mi 5 -Mpb 2 
proshut /producao/multitec/ems2esp -C apw
proshut /producao/multitec/ems2esp -C biw
proshut /producao/multitec/ems2esp -C aiw
proshut /producao/multitec/ems2esp -C watchdog


####BANCO TECNOFIL#####
proserve /producao/tecnofil/ems2emp -B 10000 -spin 120000  -L 500000 -Mm 16384 -N tcp -S 23653 -n 210 -Ma 10 -Mn 20 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/tecnofil/ems2emp
proshut /producao/tecnofil/ems2emp -C apw
proshut /producao/tecnofil/ems2emp -C biw
proshut /producao/tecnofil/ems2emp -C aiw
proshut /producao/tecnofil/ems2emp -C watchdog

proserve /producao/tecnofil/ems2esp -B 1000  -spin 120000  -L 200000 -Mm 16384 -N tcp -S 23654 -n 210 -Ma 10 -Mn 20 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/tecnofil/ems2esp
proshut /producao/tecnofil/ems2esp -C apw
proshut /producao/tecnofil/ems2esp -C biw
proshut /producao/tecnofil/ems2esp -C aiw
proshut /producao/tecnofil/ems2esp -C watchdog

####BANCO MOCA#####
proserve /producao/moca/ems2emp -B 1000 -spin 120000  -L 20000 -Mm 16384 -N tcp -S 23656 -n 210 -Ma 10 -Mn 20 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500

####BANCO EZGEO#####
proserve /producao/ezgeo/ems2emp -B 10000 -spin 120000  -L 500000 -Mm 16384 -N tcp -S 23657 -n 210 -Ma 10 -Mn 20 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/ezgeo/ems2emp
proshut /producao/ezgeo/ems2emp -C apw
proshut /producao/ezgeo/ems2emp -C biw
proshut /producao/ezgeo/ems2emp -C aiw
proshut /producao/ezgeo/ems2emp -C watchdog

proserve /producao/ezgeo/ems2emp2 -B 10000 -spin 120000  -L 500000 -Mm 16384 -N tcp -S 23690 -n 210 -Ma 10 -Mn 20 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/ezgeo/ems2emp2
proshut /producao/ezgeo/ems2emp2 -C apw
proshut /producao/ezgeo/ems2emp2 -C biw
proshut /producao/ezgeo/ems2emp2 -C aiw
proshut /producao/ezgeo/ems2emp2 -C watchdog

proserve /producao/ezgeo/ems2esp -B 1000  -spin 120000  -L 200000 -Mm 16384 -N tcp -S 23658 -n 210 -Ma 10 -Mn 20 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/ezgeo/ems2esp
proshut /producao/ezgeo/ems2esp -C apw
proshut /producao/ezgeo/ems2esp -C biw
proshut /producao/ezgeo/ems2esp -C aiw
proshut /producao/ezgeo/ems2esp -C watchdog

proserve /producao/ezgeo/ems2esp2 -B 1000  -spin 120000  -L 200000 -Mm 16384 -N tcp -S 23691 -n 210 -Ma 10 -Mn 20 -Mi 5 -bibufs 60 -minport 23700 -maxport 24100 -basetable 1 -tablerangesize 3500 -aiarcinterval 1800 -aiarcdircreate -aibufs 50 -aistall -aiarcdir /backup/producao/afterimage/ezgeo/ems2esp2
proshut /producao/ezgeo/ems2esp2 -C apw
proshut /producao/ezgeo/ems2esp2 -C biw
proshut /producao/ezgeo/ems2esp2 -C aiw
proshut /producao/ezgeo/ems2esp2 -C watchdog

sh /producao/scripts/tms/carrega_banco
sh /producao/scripts/dtviewer/carrega_banco
