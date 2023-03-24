<#
    Script : dbDestroySchema.ps1
	USAGE : ${SCRIPT}
	ARGS : None
	DESC : This script removes the database schema. Dependent upon SQL scripts in working DIR.
#>
# The following conditions are assumed to be met. Caller needs to insure that:
# 1. database is opened
# 2. database system user has default password

# Oracle OFA - Directory Naming Conventions
# REF : https://docs.oracle.com/cd/E26854_01/em.121/e37799/ch2_manage_oh.htm#OUICG134
# Linux = /u01/app/oracle/product/19.0.0/dbhome_1
# Windows = E:\app\oracle\product\19.0.0\dbhome_1

$ORACLE_BASE="E:\app\oracle" # should be setup by the oracle profile
$ORACLE_HOME="E:\app\oracle\db_home" # - this should already be setup by oracle profile
$ORACLE_BIN="$ORACLE_HOME\bin"
$ORACLE_DBSCRIPTS="$ORACLE_BASE\oraSetupScripts\Murach"
$ORACLE_SID="ZDBT01W"
$SYSTEM_PASS="OrA_Sup3r_Pa55"

&$ORACLE_BIN\sqlplus system/$SYSTEM_PASS @$ORACLE_DBSCRIPTS\ZDBT01W-murach_destroy_stg1.sql > $ORACLE_DBSCRIPTS\remove_schema.log 2>&1
&$ORACLE_BIN\sqlplus system/$SYSTEM_PASS @$ORACLE_DBSCRIPTS\ZDBT01W-murach_destroy_stg2.sql > $ORACLE_DBSCRIPTS\remove_schema.log 2>&1
