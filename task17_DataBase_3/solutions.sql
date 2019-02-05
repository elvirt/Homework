use storedpr_db;

-- 2
INSERT INTO post VALUES ('Manager'),
						('Pharmacist'),
                        ('Assistant');

INSERT INTO street VALUES 	('n.a. T. Shevchenka'),
							('n.a. L. Ukrainky'),
                            ('n.a. Ivan Franko');

INSERT INTO zone VALUES (1,'throat'),
						(2,'nose'),
                        (3,'heart'),
                        (4,'stomach');
                        

INSERT INTO medicine(name, ministry_code, recipe, narcotic, psychotropic) VALUES	('Strepsils','aa-111-11',1,0,0),
																					('Vibrotsyl','bb-111-11',0,1,0),
                                                                                    ('Aflubin','cc-111-11',0,1,1),
                                                                                    ('Feminost','dd-111-11',1,0,0),
                                                                                    ('Cardiomagnil','ee-111-11',0,0,1);
INSERT INTO medicine_zone (medicine_id, zone_id) VALUES 
	('57', '1'),
	('58', '2'),
	('59', '1'),
	('60', '4'),
	('61', '3');


INSERT INTO pharmacy (name, building_number, www, work_time, saturday, sunday, street) 
					VALUES	("Pharmacy №1",45,'www.pharmacy1.com', '00:08:00',1,0,'n.a. Ivan Franko' ),
							("Pharmacy №2",33,'www.pharmacy2.com', '00:06:00',1,1,'n.a. L. Ukrainky' ),
                            ("Pharmacy №3",57,'www.pharmacy3.com', '00:07:00',0,1,'n.a. T. Shevchenka' );


INSERT INTO pharmacy (name, building_number, www, work_time, saturday, sunday, street) 
					VALUES	("Phastreetrmacy №1",45,'www.pharmacy1.com', '00:08:00',1,0,'n.a. gg' );




INSERT INTO employee (surname,name,midle_name,identity_number,passport,experience,birthday,post,pharmacy_id)
					VALUES	('Homenick','Overpass ','Marvinburgh','5250330499','0499383401',5.5,'2000-04-25','Manager',1),
							('Johnny ','Gaylord '  ,'Marvinburgh','6178715698','6178715698',5.5,'2000-04-25','Assistant',1),
                            ('Nikolas ','Bailey'   ,' '          ,'1111222233','1111222233',5.5,'2000-04-25','Pharmacist',1),
                            ('Triston ','Kilback'  ,'           ','1111222233','1111222233',5.5,'2000-04-25','Manager',2),
                            ('Donny','Muller'      ,'           ','1111222233','1111222233',5.5,'2000-04-25','Assistant',2),
                            ('Tyreek','Price'      ,'           ','1111222233','1111222233',5.5,'2000-04-25','Manager',3),
                            ('Derick ','Kerluke '  ,'           ','1111222233','1111222233',5.5,'2000-04-25','Pharmacist',3);
DELIMITER //
--  --  3 TRIGGERS
-- 1
//	
	CREATE FUNCTION pharmacyExist(pharmacy_id int) RETURNS bool  DETERMINISTIC
		BEGIN
		RETURN EXISTS(SELECT * FROM pharmacy p WHERE pharmacy_id =  p.id);
	END //
    
    CREATE FUNCTION medicineExist(medicine_id int) RETURNS bool DETERMINISTIC
		BEGIN
		RETURN EXISTS(SELECT * FROM medicine m WHERE medicine_id =  m.id);
	END //
    
	CREATE FUNCTION zoneExist(zone_id int) RETURNS bool DETERMINISTIC
		BEGIN
		RETURN EXISTS(SELECT * FROM zone z WHERE zone_id =  z.id);
	END //
    
 	CREATE TRIGGER AfterInsertEpmloyee
 		AFTER INSERT 	
		ON employee FOR EACH ROW
		BEGIN
        IF(!pharmacyExist(new.pharmacy_id))
			THEN SIGNAL SQLSTATE '45000'SET MESSAGE_TEXT = 'Foreign key pharmacy not exist';
		END IF;
	END //
    CREATE TRIGGER BeforeUpdateEpmloyee
 		AFTER INSERT 	
		ON employee FOR EACH ROW
		BEGIN
		IF(!pharmacyExist(new.pharmacy_id))
			THEN SIGNAL SQLSTATE '45000'SET MESSAGE_TEXT = 'Foreign key pharmacy not exist';
		END IF;
	END //
    
    
	CREATE TRIGGER BeforeDeletePharmacy
 		BEFORE DELETE 	
		ON employee FOR EACH ROW
		BEGIN
		IF((SELECT COUNT(*) FROM employee WHERE employee.pharmacy_id = old.pharmacy_id)>0)
			THEN SIGNAL SQLSTATE '45000'SET MESSAGE_TEXT = 'Foreign key pharmacy not exist';
        END IF;
	END//
    
    CREATE TRIGGER AfterInsertPharmacyMedicine
		AFTER INSERT
        ON pharmacy_medicine FOR EACH ROW
        BEGIN
			IF(!(pharmacyExist(new.pharmacy_id) and medicineExist(new.medicine_id))) THEN
				 SIGNAL SQLSTATE '45000'SET MESSAGE_TEXT = 'Foreign key not exist';
			END IF;
	END; //
        
	CREATE TRIGGER BeforeUpdatePharmacyMedicine
		BEFORE UPDATE
        ON pharmacy_medicine FOR EACH ROW
        BEGIN
			IF(!(pharmacyExist(new.pharmacy_id) and medicineExist(new.medicine_id))) THEN
				 SIGNAL SQLSTATE '45000'SET MESSAGE_TEXT = 'Foreign key not exist';
			END IF;
	END; //
    
	CREATE TRIGGER AfterInsertMedicineZone
		AFTER INSERT
        ON medicine_zone FOR EACH ROW
        BEGIN
			IF(!(zoneExist(new.zone_id) and medicineExist(new.medicine_id))) THEN
				 SIGNAL SQLSTATE '45000'SET MESSAGE_TEXT = 'Foreign key not exist';
			END IF;
	END; //
    
	CREATE TRIGGER BeforeUpdatePharmacyMedicine
		BEFORE UPDATE
        ON medicine_zone FOR EACH ROW
        BEGIN
			IF(!(zoneExist(new.zone_id) and medicineExist(new.medicine_id))) THEN
				 SIGNAL SQLSTATE '45000'SET MESSAGE_TEXT = 'Foreign key not exist';
			END IF;
	END; //
-- 2
	CREATE TRIGGER AfterInsertIdentityNumber
	AFTER INSERT
	ON employee FOR EACH ROW
	BEGIN
    IF(new.identity_number RLIKE ('00$')) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Incorrect format';
	END IF;
    END;//
    
	CREATE TRIGGER BeforeUpdateIdentityNumber
	BEFORE INSERT
	ON employee FOR EACH ROW
	BEGIN
    IF (new.identity_number RLIKE('0{10}')) THEN
		SET new.identity_number = old.new.identity_number;
    ELSEIF (new.identity_number RLIKE ('00$')) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Incorrect format';
	END IF;
    END;//
-- 3
	CREATE TRIGGER AfterInsertMedicine
	AFTER INSERT
	ON medicine FOR EACH ROW
    BEGIN
		IF(new.ministry_code NOT RLIKE ('(?i)^[a-z&&[^mp]]{2}[[:hyphen:]]\\d{3}[[:hyphen:]]\\d{2}$')) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Incorrect format';
        END IF;
	END//
    
	CREATE TRIGGER BeforeUpdateMedicine
	BEFORE UPDATE
	ON medicine FOR EACH ROW
    BEGIN
	IF(new.ministry_code RLIKE '0{10}') THEN 
		SET new.ministry_code = old.ministry_code;
    ELSEIF(new.ministry_code NOT RLIKE ('(?i)^[a-z&&[^mp]]{2}[[:hyphen:]]\\d{3}[[:hyphen:]]\\d{2}$')) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Incorrect format';
	END IF;
	END//

-- 4
CREATE TRIGGER AfterInsertPost
	AFTER INSERT
	ON post FOR EACH ROW
    BEGIN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Post can\'t be modified';
	END//

    CREATE TRIGGER AfterUpdatePost
	AFTER UPDATE
	ON post FOR EACH ROW
    BEGIN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Post can\'t be modified';
	END//
    
    CREATE TRIGGER AfterDeletePost
	AFTER DELETE
	ON post FOR EACH ROW
    BEGIN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Post can\'t be modified';
	END//
    
-- -- 4.
-- 1
CREATE PROCEDURE InsertIntoEmployee(
	IN surname            VARCHAR(30),
    IN name          CHAR(30), 
    IN midle_name         VARCHAR(30),
    IN identity_number    CHAR(10),
    IN passport           CHAR(10),
    IN experience         DECIMAL(10, 1),
    IN birthday           DATE,
    IN post               VARCHAR(15),
    IN pharmacy_id        INT)
    BEGIN
    INSERT INTO employee VALUES (default,surname,name,midle_name,identity_number,passport,experience,birthday,post, pharmacy_id );
    END //
-- 2
CREATE PROCEDURE InsertIntoMedicineZone(m_id int,z_id int)
BEGIN
	IF(!(zoneExist(z_id) and medicineExist(m_id))) THEN
		SIGNAL SQLSTATE '45000'SET MESSAGE_TEXT = 'Foreign key not exist!';
	END IF;
	INSERT INTO medicine_zone VALUES(m_id,z_id);
END //
-- 3
CREATE PROCEDURE createRandEmployeeRows()
BEGIN
	DECLARE done int DEFAULT false;
	DECLARE SurnameT varchar(30); 
    DECLARE NameT char(30);
    DECLARE i int DEFAULT 0;
	DECLARE St_Cursor10 CURSOR
	FOR SELECT surname, name FROM employee;
	DECLARE CONTINUE HANDLER
	FOR NOT FOUND SET done = true;
	OPEN St_Cursor10;
myLoop: LOOP
		FETCH St_Cursor10 INTO SurnameT, NameT;
		IF done=true THEN LEAVE myLoop;
		END IF;
        Set @Surname = SurnameT;
		SET  @temp_query1 = CONCAT('CREATE TABLE ',@Surname,' (id int primary key);');
		PREPARE myquery FROM @temp_query1;
		EXECUTE myquery;
		DEALLOCATE PREPARE myquery;
        SET @random =  (FLOOR(RAND()*10))%9+1;
        SET i = 0;
    
        WHILE (i<@random) DO
			IF(i=0) THEN
				SET  @buffer = CONCAT('INSERT INTO ', @Surname,' VALUES');
            END IF;
            SET @buffer = CONCAT(@buffer,'(',i,')');
            IF(i!=@random-1) THEN
				SET @buffer = CONCAT(@buffer,', ');
            END IF;
            SET i = i+1;
		END WHILE;
        SET i = 0;
	PREPARE myquery2 FROM @buffer;
	EXECUTE myquery2;
    SET @buffer = '';
	DEALLOCATE PREPARE myquery2; 
	END LOOP;
	CLOSE St_Cursor10;
END//


CREATE PROCEDURE createRandEmployeeColumns()
BEGIN
	DECLARE done int DEFAULT false;
	DECLARE SurnameT varchar(30); 
    DECLARE NameT char(30);
    DECLARE i int DEFAULT 0;
	DECLARE St_Cursor10 CURSOR
	FOR SELECT surname, name FROM employee;
	DECLARE CONTINUE HANDLER
	FOR NOT FOUND SET done = true;
	OPEN St_Cursor10;
myLoop: LOOP
		FETCH St_Cursor10 INTO SurnameT, NameT;
		IF done=true THEN LEAVE myLoop;
		END IF;
        Set @Surname = SurnameT;
		SET  @buffer = CONCAT('CREATE TABLE ',@Surname,'( ');
		-- PREPARE myquery FROM @temp_query1;
		-- EXECUTE myquery;
		-- DEALLOCATE PREPARE myquery;
        SET @random =  (FLOOR(RAND()*10))%9+1;
        SET i = 0;
    
        WHILE (i<@random) DO
            SET @buffer = CONCAT(@buffer,'col',i,' int');
            IF(i!=@random-1) THEN
				SET @buffer = CONCAT(@buffer,', ');
            END IF;
            SET i = i+1;
		END WHILE;
        SET i = 0;
        SET @buffer = CONCAT(@buffer,' );');
	PREPARE myquery2 FROM @buffer;
	EXECUTE myquery2;
    SET @buffer = '';
	DEALLOCATE PREPARE myquery2; 
	END LOOP;
	CLOSE St_Cursor10;
END//
CALL createRandEmployeeColumns()//

-- -- 5.
-- 1
CREATE FUNCTION minExperience() RETURNS DECIMAL(10,1) DETERMINISTIC
	BEGIN
		RETURN(SELECT MIN(experience) FROM employee);
    END//
SELECT minExperience() //

CREATE FUNCTION pharmacyInfo(f_key int) RETURNS varchar(25) DETERMINISTIC
 BEGIN
  RETURN(SELECT CONCAT(p.name,' ',p.building_number) as column_1 FROM pharmacy p WHERE f_key=p.id);
 END//


    
DELIMITER ;

SELECT *, pharmacyInfo(employee.pharmacy_id) as Pharmce FROM employee;

SELECT pharmacyInfo(5);
SELECT minExperience();
SELECT (FLOOR(RAND()*10))%9+1;

DROP function pharmacyInfo;
CALL InsertIntoEmployee('Pepe','Lolo','Pepkovuch','1284639273','KC-4353-24',5,'1990-12-12','Manager',2);
SELECT * FROM employee;