#!/bin/ksh 

     ########################################################################
     #                                                                      #
     # This script uses MQ server libraries to connect to the Queue Manager #
     # open TEST_OUT_1 queue for input and get messages on the queue.       #
     #                                                                      #
     ########################################################################
#
echo "go..."

export ThreadNumber=50
# No of connections

export RuntimeLength=43200
# test run-time = 12 hours(12*60*60)

export TransactionRate=50
# No of transaction per sec


export basePath=/opt/mqm/mqv8/tools/perf_testing
#export MsgFile=$basePath/InputMessages/input_10k


QMGR=TESTQM01

export OQName_1=TEST.INQ

export HOST=localhost

export CHL=SECURE.APP.CHANNEL

export PORT=1414

export CLASSPATH=$basePath/perfharness.jar:/opt/mqm/java/lib64:/opt/mqm/java/lib/com.ibm.mqjms.jar:/opt/mqm/java/lib/com.ibm.mq.jar:/opt/mqm/java/lib/jms.jar:/opt/java6/jre/lib/jndi.jar:/opt/mqm/java/lib/fscontext.jar:/opt/IBM/MQ/v8.0/java/lib64/

export PATH=/opt/mqm/java/jre64/jre/bin/:/opt/mqm/java/jre64/jre/lib/:/opt/mqm/java/lib64/:$PATH

java -Djava.library.path=/opt/mqm/java/lib64 -Xms512m -Xmx1024m JMSPerfHarness -pc WebSphereMQ -jb $QMGR -d $OQName_1 -tc jms.r11.Receiver -jt mqc -jp $PORT -jh $HOST -nt $ThreadNumber -rl $RuntimeLength -rt $TransactionRate -mf $MsgFile -pp
