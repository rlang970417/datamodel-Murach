<#
    Script : dbCreateSchema.ps1
	USAGE : ${SCRIPT}
	ARGS : None
	DESC : This script creates the database schema. Dependent upon SQL scripts in working DIR.
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

function create_schema() 
{ 
    # 1. Create User / Schema for our DB
    #
    &$ORACLE_BIN\sqlplus system/$SYSTEM_PASS @$ORACLE_DBSCRIPTS\ZDBT01W_schema_murach_db.sql
	
	# 2. Create AP Tables / Load data
    #
    &$ORACLE_BIN\sqlplus system/$SYSTEM_PASS @$ORACLE_DBSCRIPTS\create_ap_tables.sql
	
    # 3. Create OM Tables / Load data
    #
    &$ORACLE_BIN\sqlplus system/$SYSTEM_PASS @$ORACLE_DBSCRIPTS\create_om_tables.sql
	
    # 4. Create EX Tables / Load data
    #
    &$ORACLE_BIN\sqlplus system/$SYSTEM_PASS @$ORACLE_DBSCRIPTS\create_ex_tables.sql
	

}

# Create Directory for our data files if not already there
$appDataDir="${ORACLE_BASE}\oradata\$ORACLE_SID\MURACH"
if (!(Test-Path $appDataDir))
{
    New-Item -Path $appDataDir -ItemType Directory
}

create_schema > $ORACLE_DBSCRIPTS\create_schema.log 2>&1