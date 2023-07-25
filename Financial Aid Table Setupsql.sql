USE `Financial Aid`;

CREATE TABLE `22-23 FA`
(AcademicYear varchar(255),
FAFSA_CA_Dream_Act_Submitted INT,
FAFSA_CA_Dream_Act_Completed INT,
Cal_Grant_Submitted INT,
Cal_Grant_Completed INT,
Cal_Grant_Awarded INT,
Enrollment INT,
County varchar(255),
School_District varchar(255),
High_School varchar(255),
City varchar(255)
);

LOAD DATA LOCAL INFILE '/Users/markzerrudo/Documents/GitHub/FinancialAidAndEnrollment/Financial Aid/FA DATA 22-23.csv' 
INTO TABLE `22-23 FA`
	FIELDS TERMINATED BY ',' 
	ENCLOSED BY '"' 
	ESCAPED BY '\\'
;

#Creation of population tables

CREATE TABLE `Population_California_Counties`
(`County` varchar(255),
`Total` int,
`White` int,
`Black or African American` int,
`American Indian and Alaska Native` int,
`Asian` int,
`Native Hawaiian and Other Pacific Islander` int, 	 
`Some other race` int,
`Two or more races` int,
`Three or more` int
);

LOAD DATA LOCAL INFILE '/Users/markzerrudo/Documents/GitHub/FinancialAidAndEnrollment/Demographic Information/2020 Population by County.csv'
INTO TABLE `Population_California_Counties`
	FIELDS TERMINATED BY ',' 
	ENCLOSED BY '"' 
	ESCAPED BY '\\'
    IGNORE 2 LINES
;

SELECT * FROM `Population_California_Counties`;