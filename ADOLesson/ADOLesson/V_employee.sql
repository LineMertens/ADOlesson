CREATE VIEW [dbo].[V_employee]
	AS SELECT 
	Id, LastName, Firstname, BirthDate, Email, ResponsableID, 
	M.LastName AS RespLastName, 
	M.Firstname AS RespFirstName, 
	M.Email AS RespEmail
	FROM [Employee] E JOIN [Employee] M ON E.ResponsableID = M.Id 
