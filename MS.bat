@echo off
title
color 0A

REM Admin and Guest
net user guest /active:no
REM Firewall
netsh advfirewall set allprofiles state on
netsh advfirewall set currentprofile logging filename %systemroot%\system32\LogFiles\Firewall\pfirewall.log
netsh advfirewall set currentprofile maxfilesize 4096
netsh advfirewall set currentporfile logging droppedconnections enable
REM Telnet
DISM /online /disable-featyre /featurename:TelnetClient
DISM /online /disable-featyre /featurename:TelnetServer
sc stop "TlntSvr" 
sc config "TlntSvr" start= disabled 
sc stop "TermService"
sc config "TermService" start= disabled 
sc stop "SessionEnv" 
sc config "SessionEnv" start= disabledsc 
stop "RemoteRegistry"
sc config "RemoteRegistry" start= disabled
sc stop "UmRdpService" 
sc config "UmRdpService" start= disabled
net accounts /minpwlen: 8 
net accounts /minpwage: 30
net accounts /lockoutduration: 30
net accounts /lockoutthreshold:3
Auditpol /set /subcategory:"Security Group Management" /success:enable /failure:enable
Auditpol /set /subcategory:"Process Creation" /success:enable /failure:enable
Auditpol /set /subcategory:"Logoff" /success:enable /failure:disable
Auditpol /set /subcategory:"Logon" /success:enable /failure:enable 
Auditpol /set /subcategory:"Filtering Platform Connection" /success:enable /failure:disable
Auditpol /set /subcategory:"Removable Storage" /success:enable /failure:enable
Auditpol /set /subcategory:"SAM" /success:disable /failure:disable
Auditpol /set /subcategory:"Filtering Platform Policy Change" /success:disable /failure:disable
Auditpol /set /subcategory:"IPsec Driver" /success:enable /failure:enable
Auditpol /set /subcategory:"Security State Change" /success:enable /failure:enable
Auditpol /set /subcategory:"Security System Extension" /success:enable /failure:enable
Auditpol /set /subcategory:"System Integrity" /success:enable /failure:enable


