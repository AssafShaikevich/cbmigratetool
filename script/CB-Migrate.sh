#! /bin/bash
#/opt/couchbase/bin/cbbackupmgr

#BackupFolder

REPONAME=backuprepo
#Source Server
#SOURCE_SERVER=printenv SOURCE_SERVER
SOURCE_CBUSERNAME=Administrator
SOURCE_CBPASSWORD=Administrator
#Target Configuration
#TARGET_SERVER=printenv TARGET_SERVER
TARGET_CBUSERNAME=Administrator
TARGET_CBPASSWORD=Administrator

#bucketConfiguration
#SOURCE_BUCKETS=printenv SOURCE_BUCKETS
ARCHIVEDIR=/archive

cbbackupmgr config -a $ARCHIVEDIR --repo $REPONAME --include-buckets $SOURCE_BUCKETS
cbbackupmgr backup -a $ARCHIVEDIR -r $REPONAME --value-compression compressed -t 4 --cluster couchbase://$SOURCE_SERVER --username $SOURCE_CBUSERNAME --password $SOURCE_CBUSERNAME

cbbackupmgr restore -a $ARCHIVEDIR -r $REPONAME --cluster couchbase://$TARGET_SERVER --enable-bucket-config --username Administrator --password Administrator --force-updates