-- ZDBT01W_destroy.sql
prompt>Dropping users
DROP USER ap CASCADE;
DROP USER ex CASCADE;
DROP USER om CASCADE;

prompt>Dropping tablespace
DROP TABLESPACE MURACH INCLUDING CONTENTS AND DATAFILES;

commit;
quit;
