-- Creating a joing table between absentee table and compensation table and Reasons table 

select * from Absenteeism_at_work a
left join compensation b
on a.ID = b.ID
left join Reasons c
on a.Reason_for_absence = c.Number 


-- Find out dtaff who do not smoke, do not drink, BMI below 25 and sbsent time lower then average 

Select * from Absenteeism_at_work
where Social_drinker = 0 and Social_smoker = 0 and Body_mass_index < 25 and
Absenteeism_time_in_hours <¡@(select AVG(Absenteeism_time_in_hours) from Absenteeism_at_work)


-- As company will compensate non-smoker workers therefore we will calculate the followings 


--Compensation rate increase for non-smoker 

select count(*) as nonsmokers from Absenteeism_at_work
where Social_smoker = 0 -- We have in total 686 non-somker workers 


-- Creating table for data table visualization 

select 
a.ID, c.Reason,Month_of_absence,Body_mass_index,

CASE 
WHEN Body_mass_index < 18.5 Then  'Underweight'
WHEN Body_mass_index between 18.5 and 25 Then  'Healthy Weight'
WHEN Body_mass_index between 25 and 30 Then  'Overwieght'
WHEN Body_mass_index > 30 Then  'Obese'
ELSE 'Unknown' END AS BMI_Category,

CASE 
WHEN Month_of_absence In (12,1,2) Then  'Winter'
WHEN Month_of_absence In (3,4,5) Then  'Spring'
WHEN Month_of_absence In (6,7,8) Then  'Summer'
WHEN Month_of_absence In (9,10,11) Then  'Fall'
ELSE 'Unknown' END AS Season_name,
Seasons,Month_of_absence,Day_of_the_week,Transportation_expense,Education,Son,Social_drinker,Social_smoker,
Pet,Disciplinary_failure,Age,Work_load_Average_day,Absenteeism_time_in_hours
from Absenteeism_at_work a
left join compensation b
on a.ID = b.ID
left join Reasons c
on a.Reason_for_absence = c.Number 



