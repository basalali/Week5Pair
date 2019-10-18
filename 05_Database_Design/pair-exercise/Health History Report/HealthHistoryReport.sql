CREATE DATABASE HealthHistoryReport1
GO
USE HealthHistoryReport1
GO

BEGIN TRANSACTION

CREATE TABLE VetProcedure
(
proc_code int,
proc_name nvarchar (65)NOT NULL,
proc_cost int,
pet_id int
CONSTRAINT pk_proc_code PRIMARY KEY (proc_code)
--CONSTRAINT proc_name_check check ((proc_name = 'Rabies Vaccination') OR (proc_name = 'Examine and Treat Wound') OR (proc_name = 'Heart Worm Test') OR (proc_name = 'Tetanus Vaccination ') OR (proc_name = 'Annual Check Up') OR (proc_name = 'Eye Wash'))
)

CREATE TABLE Pets
(
pet_id int IDENTITY,
pet_name nvarchar(30)NOT NULL,
pet_type nvarchar (20)NOT NULL,
pet_age int,
visit_date smallint,
proc_code int
CONSTRAINT pk_pet_id PRIMARY KEY (pet_id),
CONSTRAINT fk_proc_code FOREIGN KEY (proc_code) REFERENCES VetProcedure(proc_code)
)

CREATE TABLE Owner
(
owner_id int IDENTITY,
first_name nvarchar(60) NOT NULL,
last_name nvarchar(60)NOT NULL,
address nvarchar (70)NOT NULL,
district nvarchar(40)NOT NULL,
city nvarchar(60)NOT NULL,
zip_code nvarchar(12)NOT NULL,
pet_id int
CONSTRAINT pk_owner_id PRIMARY KEY (owner_id)
CONSTRAINT fk_pet_id FOREIGN KEY (pet_id) REFERENCES Pets(pet_id)
)


INSERT INTO Owner (first_name, last_name, address, district, city, zip_code)
VALUES ('Sam', 'Cook', '123 placeholder', 'Ontario', 'Toronto', 'M4B E35' )

INSERT INTO Owner (first_name, last_name, address, district, city, zip_code)
VALUES ('Terry', 'Kim', '124 placeholder', 'Ontario', 'Toronto', 'M4B E35')

INSERT INTO Owner (first_name, last_name, address, district, city, zip_code)
VALUES ('Terry', 'Kim', '124 placeholder', 'Ontario', 'Toronto', 'M4B E35')

INSERT INTO Owner (first_name, last_name, address, district, city, zip_code)
VALUES ('Terry', 'Kim', '124 placeholder', 'Ontario', 'Toronto', 'M4B E35')

INSERT INTO Pets (pet_name, pet_type, pet_age, visit_date)
VALUES('Rover', 'Dog', 12, 1/13/2002)

INSERT INTO Pets (pet_name, pet_type, pet_age, visit_date)
VALUES('Rover', 'Dog', 12, 3/27/2002)

INSERT INTO Pets (pet_name, pet_type, pet_age, visit_date)
VALUES('Rover', 'Dog', 12, 04/02/2002)

INSERT INTO Pets (pet_name, pet_type, pet_age, visit_date)
VALUES('Spot', 'Dog', 2, 01/21/2002)

INSERT INTO Pets (pet_name, pet_type, pet_age, visit_date)
VALUES('Spot', 'Dog', 2, 03/10/2002)

INSERT INTO Pets (pet_name, pet_type, pet_age, visit_date)
VALUES('Morris', 'Cat', 4, 01/23/2001)

INSERT INTO Pets (pet_name, pet_type, pet_age, visit_date)
VALUES('Morris', 'Cat', 4, 01/13/2002)

INSERT INTO Pets (pet_name, pet_type, pet_age, visit_date)
VALUES('Tweedy', 'Bird', 2, 04/30/2002)

INSERT INTO Pets (pet_name, pet_type, pet_age, visit_date)
VALUES('Tweedy', 'Bird', 2, 04/30/2002)

INSERT INTO VetProcedure (proc_code, proc_name, proc_cost)
VALUES (01, 'Rabies Vaccination', 20)

INSERT INTO VetProcedure (proc_code, proc_name, proc_cost)
VALUES (10, 'Examine and Treat Wound', 40)

INSERT INTO VetProcedure (proc_code, proc_name, proc_cost)
VALUES (05, 'Heart Worm Test', 10)

INSERT INTO VetProcedure (proc_code, proc_name, proc_cost)
VALUES (08, 'Tetanus Vaccination ', 15)

INSERT INTO VetProcedure (proc_code, proc_name, proc_cost)
VALUES (20, 'Annual Check Up', 25)

INSERT INTO VetProcedure (proc_code, proc_name, proc_cost)
VALUES (12, 'Eye Wash', 12)

Commit;