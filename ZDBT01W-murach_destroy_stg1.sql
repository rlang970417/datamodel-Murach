CONNECT ap/ap;

-- Use an anonymous PL/SQL script to
-- drop all tables and sequences in the current schema and
-- suppress any error messages that may displayed 
-- if these objects don't exist
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE vendor_id_seq';
  EXECUTE IMMEDIATE 'DROP SEQUENCE invoice_id_seq';

  EXECUTE IMMEDIATE 'DROP TABLE invoice_archive';
  EXECUTE IMMEDIATE 'DROP TABLE invoice_line_items';
  EXECUTE IMMEDIATE 'DROP TABLE invoices';
  EXECUTE IMMEDIATE 'DROP TABLE vendor_contacts';
  EXECUTE IMMEDIATE 'DROP TABLE vendors';
  EXECUTE IMMEDIATE 'DROP TABLE terms';
  EXECUTE IMMEDIATE 'DROP TABLE general_ledger_accounts';
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('');
END;
/

commit;

CONNECT om/om;

SET DEFINE OFF;

-- Begin an anonymous PL/SQL script that 
-- drops all tables in the EX schema and
-- suppresses the error messages that are displayed if the tables don't exist
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE order_details';
  EXECUTE IMMEDIATE 'DROP TABLE orders';
  EXECUTE IMMEDIATE 'DROP TABLE items';
  EXECUTE IMMEDIATE 'DROP TABLE customers';
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('');
END;
/

commit;


CONNECT ex/ex;

SET DEFINE OFF;

-- Begin an anonymous PL/SQL script that 
-- drops all tables in the EX schema and
-- suppresses the error messages that are displayed if the tables don't exist
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE active_invoices';
  EXECUTE IMMEDIATE 'DROP TABLE color_sample';
  EXECUTE IMMEDIATE 'DROP TABLE customers';
  EXECUTE IMMEDIATE 'DROP TABLE date_sample';
  EXECUTE IMMEDIATE 'DROP TABLE departments';
  EXECUTE IMMEDIATE 'DROP TABLE employees';
  EXECUTE IMMEDIATE 'DROP TABLE float_sample';
  EXECUTE IMMEDIATE 'DROP TABLE null_sample';
  EXECUTE IMMEDIATE 'DROP TABLE paid_invoices';
  EXECUTE IMMEDIATE 'DROP TABLE projects';
  EXECUTE IMMEDIATE 'DROP TABLE string_sample';
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('');
END;
/

commit;
quit;