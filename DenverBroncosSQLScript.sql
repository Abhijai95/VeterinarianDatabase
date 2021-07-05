/*Name: Abhijai Singh NOTE: This SQL script was completed in the latest version of MySQL Workbench 8.0 CE.*/

/*Q1 57 in dataset*/ 
SELECT COUNT(*) From Pets Where Kind = 'Dog'; 

/*Q2 Answer Lee Mckenzie*/  
SELECT Concat(d.name,'', d.Surname) As 'OwnerName', sum(price) As 'AmountSpent' FROM Procedures a
INNER JOIN
	Procedure_Details b on a.ProcedureSubCode = b.ProcedureSubCode
INNER JOIN 
	pets c On a.PetID = c.PetID
INNER JOIN 
	Owners d On c.OwnerID = d.OwnerID    
GROUP By OwnerName
ORDER By AmountSpent desc
Limit 100;

/*Q3 Answer 33 Owners Total */ 
SELECT Concat(d.name,'', d.Surname) As 'OwnerName', sum(price) As 'AmountSpent',  COUNT(*) OVER () As OwnerTotal FROM Procedures a
INNER JOIN
	Procedure_Details b on a.ProcedureSubCode = b.ProcedureSubCode
INNER JOIN 
	pets c On a.PetID = c.PetID
INNER JOIN 
	Owners d On c.OwnerID = d.OwnerID    
GROUP By OwnerName
ORDER By AmountSpent desc
Limit 100;

/*Q4 Answer Is Southfield*/ 
SELECT COUNT(City), City From Owners, Pets
	Where Owners.OwnerID = Pets.OwnerID 
		AND Kind ='Dog' GROUP BY City 
        ORDER BY Count(City) Desc;

/*Q5 ANSWER 7.8*/
SELECT AVG(Age) From Owners, Pets
	Where Owners.OwnerID = Pets.OwnerID 
		AND City='Detroit' 
        AND Kind ='Dog'; 
        
/*Q6 ANSWER 34%*/
SELECT (Count( Distinct PetID)/(SELECT count(Distinct PetID) FROM pets))*100 As 'Percentage %' FROM 
(
SELECT PetID, Count(*) as 'procedurecount' from Procedures a
Group By PetID
Having Count(*) >=1
) t;

/*Q7 Answer Is Vaccinations For Parrots */
SELECT COUNT(ProcedureSubCode), ProcedureType From Procedures, Pets
	Where Procedures.PetID = Pets.PetID 
		AND Kind ='Parrot' GROUP BY  ProcedureType;
        
/*Q8 Answer is TWO Owners ID 8133, 3089.*/
SELECT Distinct a.OwnerID
From Pets a
INNER JOIN(
	SELECT OwnerID,count(*)
	FROM Pets
		WHERE Kind In ('Cat')
		Group By OwnerID
		Having count(*) >= 1
	) t On a.OwnerID = t.OwnerID
	WHERE Kind In ('Dog');

 /*Q9 Answer is TWO Owners, IDs 6102, 3089*/
 SELECT COUNT(a.OwnerID), a.OwnerID FROM Pets a
INNER JOIN
(
	Select OwnerID, name
	From pets
	Where Name like 'B%'
) t
 On a.ownerid = t.ownerid WHERE a.Age >= 10
 Group By a.ownerid Having count(*) >= 2;
 








