 create database tv ;
 use tv ; 
 
 CREATE TABLE `tv`.`actors` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));


CREATE TABLE `tv`.`directors` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));


  CREATE TABLE `tv`.`series` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));


  CREATE TABLE `tv`.`episodes` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `e_num` VARCHAR(45) NOT NULL,
  `id_series` INT UNSIGNED NOT NULL,
  `id_director` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `tos_idx` (`id_series` ASC),
  INDEX `tod_idx` (`id_director` ASC),
  CONSTRAINT `tos`
    FOREIGN KEY (`id_series`)
    REFERENCES `tv`.`series` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `tod`
    FOREIGN KEY (`id_director`)
    REFERENCES `tv`.`directors` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


    CREATE TABLE `tv`.`occasions` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` DATE NULL,
  `name` VARCHAR(45) NULL,
  `id_episode` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `toe_idx` (`id_episode` ASC),
  CONSTRAINT `toe`
    FOREIGN KEY (`id_episode`)
    REFERENCES `tv`.`episodes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
  

CREATE TABLE `tv`.`series_actors` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_actor` INT UNSIGNED NOT NULL,
  `id_series` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `tos_idx` (`id_actor` ASC),
  INDEX `tos_idx1` (`id_series` ASC),
  CONSTRAINT `toac`
    FOREIGN KEY (`id_actor`)
    REFERENCES `tv`.`actors` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `tose`
    FOREIGN KEY (`id_series`)
    REFERENCES `tv`.`series` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


INSERT INTO `tv`.`actors` ( `name`) VALUES ( 'sara');
INSERT INTO `tv`.`actors` (`name`) VALUES ('ali');
INSERT INTO `tv`.`actors` (`name`) VALUES ('ahmad');
INSERT INTO `tv`.`actors` (`name`) VALUES ('lara');
INSERT INTO `tv`.`actors` (`name`) VALUES ('nada');
INSERT INTO `tv`.`actors` (`name`) VALUES ('dema');
INSERT INTO `tv`.`actors` (`name`) VALUES ('zaed');
INSERT INTO `tv`.`actors` (`name`) VALUES ('bayan');
INSERT INTO `tv`.`actors` (`name`) VALUES('hadeel');
INSERT INTO `tv`.`actors` ( `name`) VALUES ('sosan') ;
INSERT INTO `tv`.`actors` (`name`) VALUES ('zaynb') ;
INSERT INTO `tv`.`actors`  (`name`) VALUES ('dena') ;
INSERT INTO `tv`.`actors`  (`name`) VALUES('salma') ;
INSERT INTO `tv`.`actors`  (`name`)VALUES ('nour') ;
INSERT INTO `tv`.`actors` (`name`) VALUES ('bertil bom');


INSERT INTO `tv`.`directors` (`name`) VALUES ('salm');
INSERT INTO `tv`.`directors` (`name`) VALUES ('maher');
INSERT INTO `tv`.`directors` (`name`) VALUES ('amr');
INSERT INTO `tv`.`directors` (`name`) VALUES ('khaled');
INSERT INTO `tv`.`directors` (`name`) VALUES ('rami');
INSERT INTO `tv`.`directors` (`name`) VALUES ('malak');


INSERT INTO `tv`.`series` (`name`) VALUES ('big sister');
INSERT INTO `tv`.`series` (`name`) VALUES ('secren');
INSERT INTO `tv`.`series` (`name`) VALUES ('baby day out');
INSERT INTO `tv`.`series` (`name`) VALUES ('home alon');
INSERT INTO `tv`.`series` (`name`) VALUES ('wild lies');


 INSERT INTO `tv`.`episodes` (`e_num`, `id_series`, `id_director`) VALUES ('e01', '1', '1');
INSERT INTO `tv`.`episodes` (`e_num`, `id_series`, `id_director`) VALUES ('e02', '1', '2');
INSERT INTO `tv`.`episodes` (`e_num`, `id_series`, `id_director`) VALUES ('e03', '1', '3');
INSERT INTO `tv`.`episodes` (`e_num`, `id_series`, `id_director`) VALUES ('e04', '1', '4');
INSERT INTO `tv`.`episodes` (`e_num`, `id_series`, `id_director`) VALUES ('e01', '2', '5');
INSERT INTO `tv`.`episodes` (`e_num`, `id_series`, `id_director`) VALUES ('e02', '2', '6');
INSERT INTO `tv`.`episodes` (`e_num`, `id_series`, `id_director`) VALUES ('e03', '2', '1');
INSERT INTO `tv`.`episodes` (`e_num`, `id_series`, `id_director`) VALUES ('e04', '2', '2');
INSERT INTO `tv`.`episodes` (`e_num`, `id_series`, `id_director`) VALUES ('e01', '4', '3');
INSERT INTO `tv`.`episodes` (`e_num`, `id_series`, `id_director`) VALUES ('e02', '4', '4');
INSERT INTO `tv`.`episodes` (`e_num`, `id_series`, `id_director`) VALUES ('e03', '4', '5');


INSERT INTO `tv`.`series_actors` (`id_actor`, `id_series`) VALUES ('1', '1');
INSERT INTO `tv`.`series_actors` (`id_actor`, `id_series`) VALUES ('2', '1');
INSERT INTO `tv`.`series_actors` (`id_actor`, `id_series`) VALUES ('3', '1');
INSERT INTO `tv`.`series_actors` (`id_actor`, `id_series`) VALUES ('4', '2');
INSERT INTO `tv`.`series_actors` (`id_actor`, `id_series`) VALUES ('5', '2');
INSERT INTO `tv`.`series_actors` (`id_actor`, `id_series`) VALUES ('6', '2');
INSERT INTO `tv`.`series_actors` (`id_actor`, `id_series`) VALUES ('7', '3');
INSERT INTO `tv`.`series_actors` (`id_actor`, `id_series`) VALUES ('8', '3');
INSERT INTO `tv`.`series_actors` (`id_actor`, `id_series`) VALUES ('9', '3');
INSERT INTO `tv`.`series_actors` (`id_actor`, `id_series`) VALUES ('10', '4');
INSERT INTO `tv`.`series_actors` (`id_actor`, `id_series`) VALUES ('11', '4');


INSERT INTO `tv`.`occasions` (`name`, `id_episode`) VALUES ( 'day mother', '3');
INSERT INTO `tv`.`occasions` ( `name`, `id_episode`) VALUES ( 'day indep', '5');
INSERT INTO `tv`.`occasions` (`name`, `id_episode`) VALUES ( 'birthday', '7');

--Q1)
SELECT e.name ,a.name FROM (
( tv.series_actors c
 inner join tv.actors e 
 on c.id_actor = e.id)
inner join tv.series a 
on c.id_series = a.id ) 
where a.name = 'big sister';


---Q2) 
SELECT e.name ,a.name FROM (
( tv.series_actors c
 inner join tv.actors a 
 on c.id_actor = a.id)
inner join tv.series e
on c.id_series = e.id 
) where a.name = 'bertil bom';

----Q3)
SELECT  count(c.id_series) as many_time  , e.name FROM (
( tv.series_actors c
 inner join tv.actors e 
 on c.id_actor = e.id)
inner join tv.series a 
on c.id_series = a.id 
) group by (c.id_actor)
  having many_time >1 ;


  ---Q4)
SELECT count(e.id) ,  c.name , e.e_num  , s.name  , c.date FROM(
 tv.episodes e
 inner join   tv.occasions  c
 on c.id_episode = e.id )
 inner join tv.series s 
 on e.id_series = s.id 
 where s.name="wild lies" and e.e_num="e01"  ;
 ----Q5)
SELECT count(*) FROM tv.directors;
----or Q5)
SELECT count(id) FROM tv.directors;


------Q6)
SELECT count(c.id) as m ,  e.name FROM (
 tv.episodes c
 inner join tv.directors e 
 on c.id_director = e.id
) group by(c.id_director)
having  m>1 ; 