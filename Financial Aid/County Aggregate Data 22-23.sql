SELECT * FROM `22-23 FA`;

-- 
DELETE FROM `22-23 FA`
WHERE `AcademicYear` = 'Year';

#Aggregating financial aid completion, enrolmlent, and calgrant awarded across years
CREATE TABLE `Staging` AS
SELECT 
	`County`, 
	SUM(`FAFSA_CA_Dream_Act_Submitted`) AS `Total FA Completed`, 
    SUM(`Enrollment`) AS `Total Enrollment`, 
    SUM(Cal_Grant_Awarded) `Total Calgrant`
FROM 
	`22-23 FA`
GROUP BY 
	`County`,
    `Enrollment`;
   
SELECT * FROM `Staging`;

#aggregate once more due to duplicates
CREATE TABLE `Aggregate 22-23 FA`    
SELECT 
	`County`, 
	SUM(`Total FA Completed`) AS `TOTAL_FA_Completed`,
    SUM(`Total Enrollment`) AS `Total_Enrollment`,
    SUM(`Total Calgrant`) AS `total_cal`
FROM `Staging`
GROUP BY `County`;

#Including column for percentage FA completed and percentage Calgrant awarded
ALTER TABLE `Aggregate 22-23 FA`
	ADD
    `Percentage_Completed` float;
    
ALTER TABLE `Aggregate 22-23 FA`
	ADD`CalGrant_Perc_Awarded` float;
    
SELECT * FROM `Aggregate 22-23 FA`;
    
UPDATE `Aggregate 22-23 FA`
	SET `Percentage_Completed` = `TOTAL_FA_Completed`/`Total_Enrollment`;
    
    SELECT * FROM `Aggregate 22-23 FA`; 
    
UPDATE `Aggregate 22-23 FA`
	SET `CalGrant_Perc_Awarded` = `total_cal`/`TOTAL_FA_Completed`;