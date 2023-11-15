-- S.Kogseder, 14.04.21
-- Übung zu Benutzerverwaltung/rechte und Trigger

-- 1. neue DB anlegen
drop database if exists firma;
create database firma;
use firma;
create table person(
per_id int primary key auto_increment,
per_nname varchar(50) not null);
-- 2. Benutzer anlegen und Rechte vergeben
drop user if exists maier@localhost;

create user maier@localhost identified by 'maier';

grant select, update, insert on firma.* to maier@localhost;

show grants for maier@localhost;

-- 3 DB zum Speichern der Trigger-Ergebnisse
drop database if exists sniff_trigger;
create database sniff_trigger;
use sniff_trigger;
create table after_insert_person(aip_id int primary key auto_increment,
aip_username varchar(255) not null,
aip_per_id int not null,
aip_attime timestamp default current_timestamp);
create table after_update_person(aup_id int primary key auto_increment,
	aup_username varchar(255),
    aup_per_id int not null,
    aup_per_nname_old varchar(50),
	aup_per_nname_new varchar(50),
    aup_attime timestamp default current_timestamp);
    show tables;
-- 4. Trigger
use firma;
drop trigger if exists after_insert_person;
create trigger after_insert_person after insert on person
for each row
insert into sniff_trigger.after_insert_person (
aip_username,
aip_id
)
values (
user(),
new.per_id
);
show triggers;

-- 5. Triggers testen
use firma;
insert into person (per_nname) values("Maier");
select * from sniff_trigger.after_insert_person;
/*
Erstellen Sie eine after update Trigger.
Der Benutzer, alten und neuen Nachnamen usw. in die
Tabelle sniff_trigger.after_update_trigger speichert.
old.per_nname
auf den neuen (Änderung) Nachnamen kann mit 
new.per_nname
zugegriffen werden.
Anschließend testen.
*/

use firma;
drop trigger if exists after_update_person;
create trigger after_update_person after update on person
for each row
begin
    if
    old.per_id != new.per_id then insert into sniff_trigger.after_update_person (
    aup_username, aup_per_id_new,aup_per_nname_old, aup_per_nname_new)
values (user(),new.per_id,old.per_nname,new.per_nname
end if;
end;
    -- Trigger Testen
    update person set per_nname="Root" where per_id=1;
    select * from sniff_trigger.after_update_person;