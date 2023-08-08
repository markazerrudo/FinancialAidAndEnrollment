#FY22, 23, and 24 are all split by academic year in which the student was a scholarship recipient.

#FY22 data exploration
SELECT `Field of Study`, COUNT(`Field of Study`)
	FROM `FY22`
GROUP BY `Field of Study`;



SELECT `Field of Study`, COUNT(`Field of Study`)
FROM `FY22` 
GROUP BY `Field of Study`;
SELECT `Field of Study`, `Specific Major`, COUNT(`Specific Major`) as `Student Count`
FROM `FY22` 
WHERE `Field of Study` = 'Science, technology, engineering, and mathematics'
GROUP BY `Specific Major`
ORDER BY `Specific Major`;


#Data Clean Up for aggregate function
UPDATE `FY22`
	SET `Specific Major` = CASE
		WHEN `Specific Major` = 'Engineering' THEN 'engineer'
		WHEN `Specific Major` = 'Civil Engineering' THEN 'Civil Enginner'
		WHEN `Specific Major` = 'Math major' THEN 'Mathematics'
		WHEN `Specific Major` = 'Music/Engineering' THEN 'Engineering'
		WHEN `Specific Major` = 'Mechanical Engineering' THEN 'Engineering'
		WHEN `Specific Major` = 'Architecture; interior architecture/marine biology' THEN 'Architecture'
		WHEN `Specific Major` = 'Biology sciences' THEN 'Biology'
		WHEN `Specific Major` = '' THEN 'Undecided'
		ELSE `Specific Major`
			END
	WHERE `Field of Study` = 'Science, technology, engineering, and mathematics';
    
ALTER TABLE `FY22`
ADD `Total Students` INT;

UPDATE `FY22`
SET `Total Students` = count(`Field of Study`);

ALTER TABLE `FY23`
ADD `Total Students` INT;

ALTER TABLE `FY24`
ADD `Total Students` INT;


#FY22 Percentages
WITH CTE_FY22_Major AS(
SELECT 
	`Fiscal Year`,
    `Field of Study`,
	COUNT(`Field of Study`) OVER () AS `TOTAL Field of Study`
FROM `FY22`
ORDER BY `Field of Study`)
	SELECT 
		`Fiscal Year`,
        `Field of Study`,
        (COUNT(`Field of Study`) / `TOTAL Field of Study`) * 100 AS `Percentage`
	FROM `CTE_FY22_Major`
    GROUP BY `Field of Study`, `Fiscal Year`
    ORDER BY `Percentage` DESC;


WITH CTE_FY23_Major AS(
SELECT 
	`Fiscal Year`,
    `Field of Study`,
	COUNT(`Field of Study`) OVER () AS `TOTAL Field of Study`
FROM `FY23`
ORDER BY `Field of Study`)
	SELECT 
		`Fiscal Year`,
        `Field of Study`,
        (COUNT(`Field of Study`) / `TOTAL Field of Study`) * 100 AS `Percentage`
	FROM `CTE_FY23_Major`
    GROUP BY `Field of Study`, `Fiscal Year`
    ORDER BY `Percentage` DESC;
    
WITH CTE_FY24_Major AS(
SELECT 
	`Fiscal Year`,
    `Field of Study`,
	COUNT(`Field of Study`) OVER () AS `TOTAL Field of Study`
FROM `FY24`
ORDER BY `Field of Study`)
	SELECT 
		`Fiscal Year`,
        `Field of Study`,
        (COUNT(`Field of Study`) / `TOTAL Field of Study`) * 100 AS `Percentage`
	FROM `CTE_FY24_Major`
    GROUP BY `Field of Study`, `Fiscal Year`
    ORDER BY `Percentage` DESC;
