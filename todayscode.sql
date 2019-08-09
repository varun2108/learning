
SQL*Plus: Release 11.2.0.2.0 Production on Fri Aug 2 10:13:46 2019

Copyright (c) 1982, 2014, Oracle.  All rights reserved.

SQL> connect hr/hr
ERROR:
ORA-01033: ORACLE initialization or shutdown in progress
Process ID: 0
Session ID: 0 Serial number: 0


SQL> connect hr/hr;
ERROR:
ORA-01033: ORACLE initialization or shutdown in progress
Process ID: 0
Session ID: 0 Serial number: 0


SQL> connect hr/hr;
ERROR:
ORA-01033: ORACLE initialization or shutdown in progress
Process ID: 0
Session ID: 0 Serial number: 0


SQL> connect hr/hr;
Connected.
SQL> create table customers(customer_id number,person person_type);

Table created.

SQL> desc customers;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CUSTOMER_ID                                        NUMBER
 PERSON                                             PERSON_TYPE

SQL> insert into customer value(101,person_type('tkb sport shop',address_type('490 boli rd.','redwood city','ca',94061)));
insert into customer value(101,person_type('tkb sport shop',address_type('490 boli rd.','redwood city','ca',94061)))
                           *
ERROR at line 1:
ORA-00928: missing SELECT keyword


SQL> insert into customer values(101,person_type('tkb sport shop',address_type('490 boli rd.','redwood city','ca',94061)));
insert into customer values(101,person_type('tkb sport shop',address_type('490 boli rd.','redwood city','ca',94061)))
            *
ERROR at line 1:
ORA-00942: table or view does not exist


SQL> insert into customers values(101,person_type('tkb sport shop',address_type('490 boli rd.','redwood city','ca',94061)));

1 row created.

SQL> select * from customers;

CUSTOMER_ID
-----------
PERSON(NAME, ADDRESS(STREET, CITY, STATE, ZIP))
--------------------------------------------------------------------------------
        101
PERSON_TYPE('tkb sport shop', ADDRESS_TYPE('490 boli rd.', 'redwood city', 'ca',
 94061))


SQL> select name from customers;
select name from customers
       *
ERROR at line 1:
ORA-00904: "NAME": invalid identifier


SQL> select person_type.address_type.street from customers;_
  2  /
select person_type.address_type.street from customers;_
                                                     *
ERROR at line 1:
ORA-00911: invalid character


SQL> select person_type.address_type.street from customers;_
  2  ;
select person_type.address_type.street from customers;_
                                                     *
ERROR at line 1:
ORA-00911: invalid character


SQL> select person_type.address_type.street from customers;
select person_type.address_type.street from customers
       *
ERROR at line 1:
ORA-00904: "PERSON_TYPE"."ADDRESS_TYPE"."STREET": invalid identifier


SQL> select person.name from customers;
select person.name from customers
       *
ERROR at line 1:
ORA-00904: "PERSON"."NAME": invalid identifier


SQL> select a.person.name from customers a;

PERSON.NAME
-------------------------
tkb sport shop

SQL> update customer a set a.person.address.city='chicago' where a.person.address.city like 'r%';
update customer a set a.person.address.city='chicago' where a.person.address.city like 'r%'
       *
ERROR at line 1:
ORA-00942: table or view does not exist


SQL> update customers a set a.person.address.city='chicago' where a.person.address.city like 'r%';

1 row updated.

SQL> delete from customers a where a.person.name='tkd sport shop';

0 rows deleted.

SQL> delete from customers a where a.person.name='tkb sport shop';

1 row deleted.

SQL> drop type person_type;
drop type person_type
*
ERROR at line 1:
ORA-02303: cannot drop or replace a type with type or table dependents


SQL> create or replace type desg_ty as object (desg_name varchar2(10)
  2  );
  3  /

Type created.

SQL> create or replace type desg_va as varray(5) of desg_ty;
  2  /

Type created.

SQL> create table dep
  2  ;

*
ERROR at line 2:
ORA-00906: missing left parenthesis


SQL> create table dep_des
  2  (dname varchar2(25) primary key,
  3  desg desg_va
  4  );

Table created.

SQL> desc dep_des;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 DNAME                                     NOT NULL VARCHAR2(25)
 DESG                                               DESG_VA

SQL> desc user_types;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 TYPE_NAME                                 NOT NULL VARCHAR2(30)
 TYPE_OID                                  NOT NULL RAW(16)
 TYPECODE                                           VARCHAR2(30)
 ATTRIBUTES                                         NUMBER
 METHODS                                            NUMBER
 PREDEFINED                                         VARCHAR2(3)
 INCOMPLETE                                         VARCHAR2(3)
 FINAL                                              VARCHAR2(3)
 INSTANTIABLE                                       VARCHAR2(3)
 SUPERTYPE_OWNER                                    VARCHAR2(30)
 SUPERTYPE_NAME                                     VARCHAR2(30)
 LOCAL_ATTRIBUTES                                   NUMBER
 LOCAL_METHODS                                      NUMBER
 TYPEID                                             RAW(16)

SQL> DECLARE
  2     type namesarray IS VARRAY(5) OF VARCHAR2(10);
  3     type grades IS VARRAY(5) OF INTEGER;
  4     names namesarray;
  5     marks grades;
  6     total integer;
  7  BEGIN
  8     names := namesarray('Kavita', 'Pritam', 'Ayan', 'Rishav', 'Aziz');
  9     marks:= grades(98, 97, 78, 87, 92);
 10     total := names.count;
 11     dbms_output.put_line('Total '|| total || ' Students');
 12     FOR i in 1 .. total LOOP
 13        dbms_output.put_line('Student: ' || names(i) || '
 14        Marks: ' || marks(i));
 15     END LOOP;
 16  END;
 17  /

PL/SQL procedure successfully completed.

SQL> set serveroutput on;
SQL> DECLARE
  2     type namesarray IS VARRAY(5) OF VARCHAR2(10);
  3     type grades IS VARRAY(5) OF INTEGER;
  4     names namesarray;
  5     marks grades;
  6     total integer;
  7  BEGIN
  8     names := namesarray('Kavita', 'Pritam', 'Ayan', 'Rishav', 'Aziz');
  9     marks:= grades(98, 97, 78, 87, 92);
 10     total := names.count;
 11     dbms_output.put_line('Total '|| total || ' Students');
 12     FOR i in 1 .. total LOOP
 13        dbms_output.put_line('Student: ' || names(i) || '
 14        Marks: ' || marks(i));
 15     END LOOP;
 16  END;
 17  /
Total 5 Students
Student: Kavita
      Marks: 98
Student: Pritam
      Marks: 97
Student: Ayan
      Marks: 78
Student: Rishav
      Marks: 87
Student: Aziz
      Marks: 92

PL/SQL procedure successfully completed.

SQL> insert into dep_des ('production', desg_va(desg_ty('manager'),
  2  desg_ty('asst.mgr'),desg_ty('sr.engr.'),desg_ty('jr.engr.'),desg_ty(null)));
insert into dep_des ('production', desg_va(desg_ty('manager'),
                     *
ERROR at line 1:
ORA-00928: missing SELECT keyword


SQL> insert into dep_des values('production', desg_va(desg_ty('manager'),
  2  desg_ty('asst.mgr'),desg_ty('sr.engr.'),desg_ty('jr.engr.'),desg_ty(null)));

1 row created.

SQL> select * from dep_des;

DNAME
-------------------------
DESG(DESG_NAME)
--------------------------------------------------------------------------------
production
DESG_VA(DESG_TY('manager'), DESG_TY('asst.mgr'), DESG_TY('sr.engr.'), DESG_TY('j
r.engr.'), DESG_TY(NULL))


SQL> declare
  2  cursor c1 is
  3  select * from dep_des;
  4  begin
  5  for x in c1
  6  loop
  7  dbmd_output.put_line('department: '||x.dname);
  8  for i in 1..x.desg.count
  9  loop
 10  dbms_output.put_line(x.desg(i).desg_name);
 11  end loop;
 12  end loop;
 13  end;
 14  /
dbmd_output.put_line('department: '||x.dname);
*
ERROR at line 7:
ORA-06550: line 7, column 1:
PLS-00201: identifier 'DBMD_OUTPUT.PUT_LINE' must be declared
ORA-06550: line 7, column 1:
PL/SQL: Statement ignored


SQL> declare
  2  cursor c1 is
  3  select * from dep_des;
  4  begin
  5  for x in c1
  6  loop
  7  dbms_output.put_line('department: '||x.dname);
  8  for i in 1..x.desg.count
  9  loop
 10  dbms_output.put_line(x.desg(i).desg_name);
 11  end loop;
 12  end loop;
 13  end;
 14  /
department: production
manager
asst.mgr
sr.engr.
jr.engr.

PL/SQL procedure successfully completed.
declare 
desigs desg_va := desg_va(desg_ty('manager'),
					desg_ty('ast.mgr'),
					desg_ty('sr.engr'),
					desg_ty('jr.engr'),
					desg_ty('trinee'));
begin
	update dep_des
	set desg=desigs
	where dname='production';
end;

--creating nested table
create type emp01_ty as object
(empno number(4),
ename varchar2(30));

create type emp_nt as table of emp01_ty;

create table deps
(depno number(2), dname varchar2(15), emps emp_nt)
nested table emps store as emps_nt_tab;

insert into depts values (10,'resarch',emps_nt(emp01_ty(1000,'arjun'),emp01_ty(1001,'krishns'),emp01_ty(1002,'mohini')));

SQL> select * from deps;

     DEPNO DNAME
---------- ---------------
EMPS(EMPNO, ENAME)
--------------------------------------------------------------------------------
        10 resarch
EMP_NT(EMP01_TY(1000, 'arjun'), EMP01_TY(1001, 'krishns'), EMP01_TY(1002, 'mohin
i'))



SQL> select emps from deps;

EMPS(EMPNO, ENAME)
--------------------------------------------------------------------------------
EMP_NT(EMP01_TY(1000, 'arjun'), EMP01_TY(1001, 'krishns'), EMP01_TY(1002, 'mohin
i'))


SQL> the(select emps from deps);
SP2-0734: unknown command beginning "the(select..." - rest of line ignored.
SQL> select nt.empno , nt.ename from the(select emps from deps)nt;

     EMPNO ENAME
---------- ------------------------------
      1000 arjun
      1001 krishns
      1002 mohini

SQL>