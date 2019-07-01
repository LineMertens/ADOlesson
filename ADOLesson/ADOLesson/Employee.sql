CREATE TABLE [dbo].[Employee]
(
	[Id] INT NOT NULL  IDENTITY,
	[Firstname] NVARCHAR(50) NOT NULL, 
	[LastName] VARCHAR (50) NOT NULL,
	[BirthDate] DATETIME2 NOT NULL, 
    [Email] NVARCHAR(100) NOT NULL UNIQUE, 
    [ResponsableID] INT NULL, 
    CONSTRAINT [PK_Employee] PRIMARY KEY ([Id]), 
    CONSTRAINT [AK_Employee_email] UNIQUE ([Email]), 
    CONSTRAINT [CK_Employee_Birthdate] CHECK (YEAR(BirthDate) < 2010), 
    CONSTRAINT [CK_Employee_Reponsableid] CHECK (ResponsableID <> Id), 
    CONSTRAINT [FK_Employee_Employee] FOREIGN KEY ([ResponsableID]) REFERENCES [Employee]([ID]) 
)

GO

CREATE INDEX [IX_Employee_LastName] ON [dbo].[Employee] ([LastName])

GO

CREATE TRIGGER [dbo].[Trigger_OnInsertUpdateEmployee]
    ON [dbo].[Employee]
    FOR DELETE, INSERT, UPDATE
    AS
    BEGIN
        SET NoCount ON
    END