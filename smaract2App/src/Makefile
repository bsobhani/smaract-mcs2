TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = smaract2
# smaract2.dbd will be created and installed
DBD += smaract2.dbd

# smaract2.dbd will be made up from these files:
smaract2_DBD += base.dbd

smaract2_DBD += asyn.dbd
smaract2_DBD += motorSupport.dbd
smaract2_DBD += drvAsynIPPort.dbd
smaract2_DBD += drvAsynSerialPort.dbd
smaract2_DBD += devSmarActMCS2Motor.dbd
smaract2_DBD += system.dbd
smaract2_DBD += asSupport.dbd

# Include dbd files from all support applications:
#smaract2_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#smaract2_LIBS += xxx
smaract2_LIBS+=autosave

# smaract2_registerRecordDeviceDriver.cpp derives from smaract2.dbd
smaract2_SRCS += smaract2_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
smaract2_SRCS_DEFAULT += smaract2Main.cpp
smaract2_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#smaract2_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
smaract2_LIBS += smarActMCS2Motor motor asyn
smaract2_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

