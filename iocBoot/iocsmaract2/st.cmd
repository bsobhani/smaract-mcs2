#!../../bin/linux-x86_64/smaract2

## You may have to change smaract2 to something else
## everywhere it appears in this file

< envPaths

cd $(TOP)

## Register all support components
dbLoadDatabase("dbd/smaract2.dbd",0,0)
smaract2_registerRecordDeviceDriver(pdbbase) 

#smarActMCS2CreateController("mot","A",5,.5,1.0)
smarActMCS2CreateController("mot","192.168.127.44",4001,5,.5,1.0)
smarActMCS2CreateAxis("mot",0,0)
smarActMCS2CreateAxis("mot",1,1)
smarActMCS2CreateAxis("mot",2,2)
smarActMCS2CreateAxis("mot",3,3)
smarActMCS2CreateAxis("mot",4,4)
#smarActMCS2CreateAxis("mot",5,5)

smarActMCS2CreateTrigger("T0",0,0)
smarActMCS2CreateTrigger("T1",1,1)
smarActMCS2CreateTrigger("T2",2,2)

#asynSetTraceMask("mot",-1,0xFF)
asynSetTraceMask("T0",-1,0xFF)
asynSetTraceMask("T1",-1,0xFF)
asynSetTraceMask("T2",-1,0xFF)




## Load record instances
dbLoadTemplate("db/motor.substitutions")
dbLoadTemplate("db/trigger.substitutions")

set_savefile_path("${TOP}/as","/save")
set_requestfile_path("${TOP}/as","/req")

#set_pass0_restoreFile("auto_settings.sav")
set_pass0_restoreFile("info_settings.sav")

iocInit()

cd ${TOP}/as/req
makeAutosaveFiles()

create_monitor_set("info_settings.req", 5, "P=xxx:")


## Start any sequence programs
#seq sncsmaract2,"user=alex"
