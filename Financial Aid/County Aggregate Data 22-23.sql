SELECT * FROM `22-23 FA`;

DELETE FROM `22-23 FA`
WHERE `AcademicYear` = 'Year';

CREATE TABLE `Staging` AS
SELECT 
	`County`, 
	SUM(`FAFSA_CA_Dream_Act_Submitted`) AS `Total FA Completed`, 
    SUM(`Enrollment`) AS `Total Enrollment`
FROM 
	`22-23 FA`
GROUP BY 
	`County`,
    `Enrollment`;


ALTER TABLE `Aggregate 22-23 FA`
	ADD
    `Percentage Completed` float;

CREATE TABLE `Aggregate 22-23 FA`    
SELECT 
	`County`, 
	SUM(`Total FA Completed`) AS `TOTAL_FA_Completed`,
    SUM(`Total Enrollment`) AS `Total_Enrollment`
FROM `Staging`
GROUP BY `County`;

ALTER TABLE `Aggregate 22-23 FA`
	ADD
    `Percentage Completed` float;
    
UPDATE `Aggregate 22-23 FA`
	SET `Percentage Completed` = `TOTAL_FA_Completed`/`Total_Enrollment`;
    
    SELECT * FROM `Aggregate 22-23 FA`;
