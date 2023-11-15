/*
S. Kogseder 
Übung zu PHP & MySQL inkl. Trigger
*/

use movie;
create schema movie_trigger;
use movie_trigger;

CREATE TABLE user_insert_protagonist (
aip_id INT Primary Key auto_increment,
aip_user VARCHAR(100) not null,
aip_time datetime default now(),
aip_pro_fname VARCHAR(100) not null,
aip_pro_sname VARCHAR(100) not null
);

use movie;
CREATE TRIGGER user_insert_protagonist
AFTER Insert ON PROTAGONIST
FOR EACH ROW
  INSERT INTO movie_trigger.user_insert_protagonist (pro_id, pro_fname, pro_sname, aip_user)
  VALUES (new.pro_id, NEW.pro_fname, new.pro_sname);
  
  DROP TRIGGER IF EXISTS user_insert_protagonist;
  
  INSERT INTO PROTAGONIST (pro_fname, pro_sname)
  VALUES ("Franz", "Maier", user());

select * from PROTAGONIST;









create table after_update_country (
auc_id INT PRIMARY KEY AUTO_INCREMENT,
auc_user VARCHAR(100) not null,
auc_time datetime default now(),
auc_cou_id INT not null,
auc_cou_old_name VARCHAR(100) not null,
auc_cou_new_name VARCHAR(100) not null
);

  DROP TRIGGER IF EXISTS after_update_country;

use movie;
CREATE TRIGGER after_update_country
AFTER UPDATE ON country
FOR EACH ROW
  INSERT INTO country (cou_id, cou_name)
  VALUES (OLD.cou_id, NEW.cou_id, OLD.ort_id, new.ort_id);