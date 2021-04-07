@ECHO OFF
#### First parameter - systemname, second - username, 
#### third - password, fourth - output name
ECHO Let's go!
ECHO ***** Simple Healthcheck of %1 ***** >%4.txt
ECHO. >>%4.txt
ECHO %date% %time% >>%4.txt
ECHO. >>%4.txt
ECHO. >>%4.txt
ECHO. >>%4.txt

ECHO 1. Overall info of %1 >>%4.txt
ECHO _______________________________ >>%4.txt
ECHO. >>%4.txt
ECHO. >>%4.txt

ECHO   1.1 Sysconfig Output >>%4.txt 
ECHO   ____________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 sysconfig -a>>%4.txt 
ECHO. >>%4.txt

ECHO   1.2 %1's RC file >>%4.txt 
ECHO   ________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 rdfile /etc/rc >>%4.txt 
ECHO. >>%4.txt

ECHO   1.3 %1's Hosts file >>%4.txt 
ECHO   ___________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 rdfile /etc/hosts >>%4.txt 
ECHO. >>%4.txt

ECHO   1.4 %1's RSH Access overview >>%4.txt 
ECHO   _____________________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 rdfile /etc/hosts.equiv >>%4.txt 
ECHO. >>%4.txt

ECHO   1.5 License info >>%4.txt 
ECHO   _______________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 license >>%4.txt
ECHO. >>%4.txt

ECHO 2. Filer %1 Network info >>%4.txt
ECHO ______________________________>>%4.txt
ECHO. >>%4.txt
ECHO. >>%4.txt

ECHO   2.1 Network config >>%4.txt 
ECHO   ________________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 ifconfig -a >>%4.txt 
ECHO. >>%4.txt

ECHO   2.2 Netdiag Output >>%4.txt 
ECHO   __________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 netdiag >>%4.txt 
ECHO. >>%4.txt

ECHO   2.3 Netstat Output >>%4.txt 
ECHO   __________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 netstat >>%4.txt 
ECHO. >>%4.txt

ECHO   2.4 ifstat -a Output >>%4.txt 
ECHO   __________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 ifstat -a >>%4.txt 
ECHO. >>%4.txt


ECHO   2.5 Virtual Interface Status >>%4.txt 
ECHO   ____________________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 vif status >>%4.txt 
ECHO. >>%4.txt

ECHO 3. Filer %1 Volume info >>%4.txt
ECHO _____________________________ >>%4.txt
ECHO. >>%4.txt
ECHO. >>%4.txt

ECHO   3.1 Volume overview >>%4.txt 
ECHO   ____________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 vol status >>%4.txt 
ECHO. >>%4.txt

ECHO   3.2 Volume Language overview >>%4.txt 
ECHO   _____________________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 vol status -l >>%4.txt 
ECHO. >>%4.txt

ECHO   3.3 Volume full overview >>%4.txt 
ECHO   ______________________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 vol status -v >>%4.txt 
ECHO. >>%4.txt

ECHO 4. Filer %1 Storage Capacity info >>%4.txt
ECHO _________________________________________ >>%4.txt
ECHO. >>%4.txt
ECHO. >>%4.txt

ECHO   4.1 Capacity Overview in GB's per volume >>%4.txt 
ECHO   ____________________________________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 df -g >>%4.txt
ECHO. >>%4.txt

ECHO   4.2 Capacity Overview in GB's per aggregate >>%4.txt 
ECHO   _______________________________________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 df -g -A >>%4.txt
ECHO. >>%4.txt

ECHO 5. Filer %1 Snapshot info >>%4.txt
ECHO _______________________________ >>%4.txt
ECHO. >>%4.txt
ECHO. >>%4.txt

ECHO   5.1 Volume Snapshot Schedule >>%4.txt 
ECHO   ____________________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 snap sched >>%4.txt
ECHO. >>%4.txt

ECHO   5.2 Aggregate Snapshot Schedule >>%4.txt 
ECHO   _______________________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 snap sched -A >>%4.txt
ECHO. >>%4.txt

ECHO   5.3 Volume Snapshot List >>%4.txt
ECHO   _________________________>>%4.txt 
ECHO. >>%4.txt
rsh %1 -l %2:%3 snap list >>%4.txt
ECHO. >>%4.txt

ECHO   5.4 Aggregate Snapshot List >>%4.txt 
ECHO   ____________________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 snap list -A >>%4.txt
ECHO. >>%4.txt

ECHO   5.5 Volume Snapshot Reserve >>%4.txt
ECHO   _______________________________>>%4.txt 
ECHO. >>%4.txt
rsh %1 -l %2:%3 snap reserve >>%4.txt
ECHO. >>%4.txt

ECHO   5.6 Aggregate Snapshot Reserve >>%4.txt 
ECHO   __________________________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 snap reserve -A >>%4.txt
ECHO. >>%4.txt

ECHO 6. Filer %1 LUNs and LUN protocol info >>%4.txt
ECHO __________________________________________ >>%4.txt
ECHO. >>%4.txt
ECHO. >>%4.txt

ECHO   6.1 iSCSI info >>%4.txt
ECHO   ____________________ >>%4.txt
ECHO. >>%4.txt
ECHO. >>%4.txt
ECHO    6.1.1 iSCSI Status >>%4.txt 
ECHO    __________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 iscsi status >>%4.txt
ECHO. >>%4.txt

ECHO    6.1.2 iSCSI Nodename %1 >>%4.txt 
ECHO    ____________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 iscsi nodename >>%4.txt
ECHO. >>%4.txt

ECHO    6.1.3 iSCSI Initiators >>%4.txt 
ECHO    ______________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 iscsi initiator show >>%4.txt
ECHO. >>%4.txt

ECHO    6.1.4 iSCSI Configuration info >>%4.txt 
ECHO    _____________________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 iscsi config >>%4.txt
ECHO. >>%4.txt

ECHO   6.2 FCP info >>%4.txt
ECHO   __________________ >>%4.txt
ECHO. >>%4.txt
ECHO. >>%4.txt
ECHO    6.2.1 FCP Status >>%4.txt 
ECHO    ________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 fcp status >>%4.txt
ECHO. >>%4.txt

ECHO    6.2.2 FCP Nodename %1 >>%4.txt 
ECHO    __________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 fcp nodename >>%4.txt
ECHO. >>%4.txt

ECHO    6.2.3 FCP Initiators >>%4.txt 
ECHO    ____________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 fcp show initiators >>%4.txt
ECHO. >>%4.txt

ECHO    6.2.4 FCP Config info >>%4.txt 
ECHO    ___________________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 fcp config >>%4.txt
ECHO. >>%4.txt

ECHO   6.3 LUN info >>%4.txt
ECHO   __________________ >>%4.txt
ECHO. >>%4.txt
ECHO. >>%4.txt
ECHO    6.3.1 LUN Status >>%4.txt 
ECHO    ________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 lun show >>%4.txt
ECHO. >>%4.txt

ECHO 7. Filer %1 Storage info >>%4.txt
ECHO ______________________________ >>%4.txt
ECHO. >>%4.txt
ECHO. >>%4.txt

ECHO   7.1 Disk/Tape Info >>%4.txt 
ECHO   ________________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 sysconfig -r >>%4.txt
ECHO. >>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 storage show disk >>%4.txt
ECHO. >>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 storage show mc >>%4.txt
ECHO. >>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 storage show tape >>%4.txt
ECHO. >>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 ndmpd status >>%4.txt
ECHO. >>%4.txt

ECHO 8. Filer %1 CIFS info >>%4.txt
ECHO ___________________________ >>%4.txt
ECHO. >>%4.txt
ECHO. >>%4.txt

ECHO   8.1 CIFS Shares overview >>%4.txt 
ECHO   _________________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 cifs shares >>%4.txt
ECHO. >>%4.txt

ECHO   8.2 CIFS Domain Controller test >>%4.txt 
ECHO   _______________________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 cifs testdc >>%4.txt
ECHO. >>%4.txt

ECHO   8.3 CIFS Options overview >>%4.txt 
ECHO   __________________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 options cifs >>%4.txt
ECHO. >>%4.txt

ECHO   8.4 CIFS Domain info >>%4.txt 
ECHO   __________________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 cifs domaininfo >>%4.txt
ECHO. >>%4.txt

ECHO   8.5 CIFS Stat >>%4.txt 
ECHO   _____________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 cifs stat >>%4.txt
ECHO. >>%4.txt

ECHO 9. Filer %1 NFS info >>%4.txt
ECHO __________________________ >>%4.txt
ECHO. >>%4.txt
ECHO. >>%4.txt

ECHO   9.1 NFS Exports overview >>%4.txt 
ECHO   _________________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 rdfile /etc/exports >>%4.txt
ECHO. >>%4.txt

ECHO   9.2 NFS Options overview >>%4.txt 
ECHO   _________________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 options nfs >>%4.txt
ECHO. >>%4.txt

ECHO   9.3 NIS info >>%4.txt 
ECHO   __________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 nis info >>%4.txt
ECHO. >>%4.txt

ECHO   9.4 NFS Stat >>%4.txt 
ECHO   ____________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 nfs stat >>%4.txt
ECHO. >>%4.txt

ECHO 10. Filer %1 Environment info >>%4.txt
ECHO ___________________________________ >>%4.txt
ECHO. >>%4.txt
ECHO. >>%4.txt

ECHO   10.1 Environment / Hardware info - overall>>%4.txt 
ECHO   ______________________________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 environment status >>%4.txt
ECHO. >>%4.txt

ECHO   10.2 Environment / Hardware info - sensors>>%4.txt 
ECHO   ______________________________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 environment status chassis list-sensors>>%4.txt
ECHO. >>%4.txt

ECHO 11. Filer %1 Replication info >>%4.txt
ECHO __________________________________ >>%4.txt
ECHO. >>%4.txt
ECHO. >>%4.txt
ECHO. >>%4.txt
ECHO. >>%4.txt
ECHO   11.1 Snapmirror info >>%4.txt
ECHO   __________________________ >>%4.txt
ECHO. >>%4.txt
ECHO. >>%4.txt

ECHO    11.1.1 %1 Snapmirror status output >>%4.txt 
ECHO    __________________________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 snapmirror status >>%4.txt
ECHO. >>%4.txt

ECHO    11.1.2 %1 Snapmirror full status >>%4.txt 
ECHO    ____________________________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 snapmirror status -l >>%4.txt
ECHO. >>%4.txt

ECHO    11.1.3 %1 Snapmirror config file output >>%4.txt 
ECHO    _____________________________________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 rdfile /etc/snapmirror.conf >>%4.txt
ECHO. >>%4.txt

ECHO    11.1.4 %1 Snapmirror access file output >>%4.txt 
ECHO    _______________________________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 rdfile /etc/snapmirror.allow >>%4.txt
ECHO. >>%4.txt

ECHO    11.1.5 %1 Snapmirror options >>%4.txt 
ECHO    ____________________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 options snapmirror >>%4.txt
ECHO. >>%4.txt

ECHO. >>%4.txt
ECHO. >>%4.txt
ECHO   11.2 Snapvault info >>%4.txt
ECHO   _________________________ >>%4.txt
ECHO. >>%4.txt
ECHO. >>%4.txt

ECHO    11.2.1 %1 Snapvault status output >>%4.txt 
ECHO    _________________________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 snapvault status >>%4.txt
ECHO. >>%4.txt

ECHO    11.2.2 %1 Snapvault full status >>%4.txt 
ECHO    ___________________________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 snapvault status -l >>%4.txt
ECHO. >>%4.txt

ECHO    11.2.3 %1 Snapvault options >>%4.txt 
ECHO    ___________________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 options snapvault >>%4.txt
ECHO. >>%4.txt

ECHO 12. Filer %1 Options overview and Messages log files >>%4.txt
ECHO ____________________________________________________ >>%4.txt
ECHO. >>%4.txt
ECHO. >>%4.txt

ECHO   12.1 Options >>%4.txt 
ECHO   ____________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 options >>%4.txt
ECHO. >>%4.txt

ECHO   12.2 %1 Messages file output >>%4.txt 
ECHO   ____________________________>>%4.txt
ECHO. >>%4.txt
rsh %1 -l %2:%3 rdfile /etc/messages >>%4.txt
ECHO. >>%4.txt

rsh %1 -l %2:%3 options autosupport.doit Databasement_Healthcheck

set choice=
set /p choice=Convert this file to PDF and delete it? Y/N (txt2pdf program must be installed)
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='y' goto pdf
if '%choice%'=='n' goto not

:pdf
"c:\Program Files\Text2PDF v1.5\txt2pdf.exe" %4.txt %4.pdf -pfs8 -oao
rem del %1.txt


:not
ECHO Done!





