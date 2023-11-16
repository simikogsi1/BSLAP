use mydb;

show tables;

select * from person;

-- -------------------------------------------------------------------

Insert into person (Per_id, Per_nname, Per_vname, Per_gb, Per_adresse, Per_Hausnr)
values (1, 'Huber', 'Fritz', '2023-10-10' , 'Hausstrasse', 30);

select * from person;

-- -------------------------------------------------------------------

Insert into person (Per_id, Per_nname, Per_vname, Per_gb, Per_adresse, Per_Hausnr)
values (2, 'Huber', 'Fritz', '2023-10-10' , 'Hausstrasse', 30);

update person
set Per_id = 3, Per_nname = 'Maier', Per_vname = 'Sebastian', Per_gb = '2004-01-03', Per_adresse = 'Ale', Per_Hausnr = 40
where Per_id = 2;

select * from person;

-- -------------------------------------------------------------------

Insert into person (Per_id, Per_nname, Per_vname, Per_gb, Per_adresse, Per_Hausnr)
values (4 ,'Baum', 'Clemens', '1996-06-20' , 'Pyhrnstraße', 22);

delete from person where Per_id = 3;

select * from person;

-- -------------------------------------------------------------------
