SELECT * FROM `2020 County Incomes`;

WITH CTE_Income_Percentages AS
(SELECT `County`, 
`Total`,
`Less_than_$10,000` / `Total` AS `Less_than_$10,000_Perc`,
`$10,000_to_$14,999` / `Total` AS `$10,000_to_$14,999_Perc`,
`$15,000_to_$19,999` / `Total` AS `$15,000_to_$19,999_Perc`,
`$20,000_to_$24,999` / `Total` AS `$20,000_to_$24,999_Perc`,
`$25,000_to_$29,999` / `Total` AS `$25,000_to_$29,999_Perc`,
`$30,000_to_$34,999` / `Total` AS `$30,000_to_$34,999_Perc`,
`$35,000_to_$39,999` / `Total` AS `$35,000_to_$39,999_Perc`,
`$40,000_to_$44,999` / `Total` AS `$40,000_to_$44,999_Perc`,
`$45,000_to_$49,999` / `Total` AS `$45,000_to_$49,999_Perc`,
`$50,000_to_$59,999` / `Total` AS `$50,000_to_$59,999_Perc`,
`$60,000_to_$74,999` / `Total` AS `$60,000_to_$74,999_Perc`,
`$75,000_to_$99,999` / `Total` AS `$75,000_to_$99,999_Perc`,
`$100,000_to_$124,999` / `Total` AS `$100,000_to_$124,999_Perc`,
`$125,000_to_$149,999` / `Total` AS `$125,000_to_$149,999_Perc`,
`$150,000_to_$199,999` / `Total` AS `$150,000_to_$199,999_Perc`,
`$200,000_or_more` / `Total` AS `$200,000_or_more_Perc`
FROM `2020 County Incomes`
)
SELECT * FROM CTE_Income_Percentages;
