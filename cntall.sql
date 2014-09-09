-- cntall.sql - show counts of all tables in wikifrac database

select count(*)  as 'companies' from   companies;
select count(*)  as 'counties' from   counties;
select count(*)  as 'facilities' from   facilities;
select count(*)  as 'fields' from   fields;
select count(*)  as 'fields_formations' from   fields_formations;
select count(*)  as 'formations' from   formations;
select count(*)  as 'gastypes' from   gastypes;
select count(*)  as 'wells' from   wells;