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


CREATE TABLE `2020 County Incomes` 
(`County` VARCHAR(255),
	`Total`	INT,
    `Less_than_$10,000` INT,
	`$10,000_to_$14,999` INT,
	`$15,000_to_$19,999` INT,
	`$20,000_to_$24,999` INT,
	`$25,000_to_$29,999` INT,
	`$30,000_to_$34,999` INT,
	`$35,000_to_$39,999` INT,
 	`$40,000_to_$44,999` INT,	
    `$45,000_to_$49,999` INT,	
    `$50,000_to_$59,999` INT,	
    `$60,000_to_$74,999` INT,	
    `$75,000_to_$99,999` INT,	
    `$100,000_to_$124,999` INT,	
    `$125,000_to_$149,999` INT,	
    `$150,000_to_$199,999` INT,	
    `$200,000_or_more` INT
    );

LOAD DATA LOCAL INFILE '/Users/markzerrudo/Documents/GitHub/FinancialAidAndEnrollment/Demographic Information/Income Data By County 2020.csv'
INTO TABLE `2020 County Incomes`
	FIELDS TERMINATED BY ',' 
	ENCLOSED BY '"' 
	ESCAPED BY '\\'
    IGNORE 2 LINES;

SELECT * FROM `2020 County Incomes`;


CREATE TABLE `CGR 2020-2021` 
(`AcademicYear` varchar(255),
`CountyName` varchar(255),
`CharterSchool` varchar(255),
`AlternativeSchoolAccountabilityStatus` varchar(255),
`ReportingCategory` varchar(255),
`CompleterType` varchar(255),	
`High School Completers` INT,
`Enrolled In College - Total (12 Months)` INT,
`College Going Rate - Total (12 Months)` INT,
`Enrolled In-State (12 Months)` INT,
`Enrolled Out-of-State (12 Months)` INT,
`Not Enrolled In College (12 Months)` INT,
`Enrolled UC (12 Months)` INT,
`Enrolled CSU (12 Months)` INT,
`Enrolled CCC (12 Months)` INT,
`Enrolled In-State Private` INT, 
`(2 and 4 Year) (12 Months)` INT,
`Enrolled Out-of-State 4-Year College` INT,
`(Public/Private) (12 Months)` INT,
`Enrolled Out-of-State 2-Year College` INT
);

LOAD DATA LOCAL INFILE '/Users/markzerrudo/Documents/GitHub/FinancialAidAndEnrollment/College Going Rate/CGR 2020-2021.csv'
INTO TABLE `CGR 2020-2021`
	FIELDS TERMINATED BY ',' 
	ENCLOSED BY '"' 
	ESCAPED BY '\\';

SELECT * FROM `CGR 2020-2021`;

UPDATE `CGR 2020-2021`
SET `AcademicYear` =
	CASE
		WHEN `AcademicYear` = '2020-21' THEN '2020-08-01'
        ELSE AcademicYear
        END;
        
UPDATE `CGR 2020-2021`
SET `AcademicYear` = STR_TO_DATE(`AcademicYear`, '%Y-%m-%d');

DESCRIBE `CGR 2020-2021`;