#require stream,2.8.10
require smb100a,0.1.0
 
#Specify the TCP endpoint and give your 'bus' an arbitrary name eg. "asynstream1".
drvAsynIPPortConfigure("PORT1","192.168.1.181:5025",0,0,0)
drvAsynIPPortConfigure("PORT2","192.168.1.182:5025",0,0,0)

#drvAsynSerialPortConfigure ("asynport2","/dev/ttyS0")
#asynSetOption ("asynport2", 0, "baud", "9600")
#asynSetOption ("asynport2", 0, "bits", "8")
#asynSetOption ("asynport2", 0, "parity", "none")
#asynSetOption ("asynport2", 0, "stop", "2")
#asynSetOption ("asynport2", 0, "clocal", "N")
#asynSetOption ("asynport2", 0, "crtscts", "N")

#Indicate the folder where the MB100A protocol file is installed
epicsEnvSet("STREAM_PROTOCOL_PATH","$(smb100a_DB)")

#Load your database defining the EPICS records
dbLoadRecords("smb100a.db", "PORT=PORT1,P=LLRF-1,DEV=Ref")
dbLoadRecords("smb100a.db", "PORT=PORT2,P=LLRF-2,DEV=Ref")

iocInit()

