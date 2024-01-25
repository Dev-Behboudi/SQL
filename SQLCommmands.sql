USE AmirStudents
--For Students:
-----Read (all)----------------------------------------------------------------------
CREATE PROC getAllStudents
as
SELECT * FROM StudentsInfo
GO
-----run-----
EXEC getAllStudents


-----Read (By ID)--------------------------------------------------------------------
CREATE PROC getStudentByID @ID smallint
as
SELECT * FROM StudentsInfo WHERE student_id = @ID
GO
-----run-----
EXEC getStudentByID 2


-----Create---------------------------------------------------------------------------
CREATE PROC addStudent @fname nvarchar(50), @lname nvarchar(50)
as
INSERT INTO StudentsInfo (fname, lname)
VALUES (@fname, @lname)
GO
-----run-----
EXEC addStudent 'Nima' , 'Masiha'


-----Delete (By ID)-------------------------------------------------------------------
CREATE PROC deleteStudentByID @ID smallint
as
DELETE FROM StudentsInfo WHERE student_id = @ID
GO
-----run-----
EXEC deleteStudentByID 7


-----Update--------------------------------------------------------------------------
CREATE PROC updateStudentInfoByID @ID smallint, @FNAME NVARCHAR(50), @LNAME NVARCHAR(50)
as
UPDATE StudentsInfo
SET fname = @FNAME , lname = @LNAME
WHERE student_id = @ID
GO
-----run-----
EXEC updateStudentInfoByID 6 , 'Jamshid', 'Hashempoor'

--For units:
-----Read (all)----------------------------------------------------------------------
CREATE PROC getAllUnits
as
SELECT * FROM UnitsInfo
GO
-----run-----
EXEC getAllUnits


-----Read (By ID)--------------------------------------------------------------------
CREATE PROC getUnitByID @ID smallint
as
SELECT * FROM UnitsInfo WHERE unit_id = @ID
GO
-----run-----
EXEC getUnitByID 2


-----Create---------------------------------------------------------------------------
CREATE PROC addUnit @name nvarchar(50)
as
INSERT INTO UnitsInfo (unit_name)
VALUES (@name)
GO
-----run-----
EXEC addUnit'English'


-----Delete (By ID)-------------------------------------------------------------------
CREATE PROC deleteUnitByID @ID smallint
as
DELETE FROM UnitsInfo WHERE unit_id = @ID
GO
-----run-----
EXEC deleteUnitByID 4


-----Update--------------------------------------------------------------------------
CREATE PROC updateUnitInfoByID @ID smallint, @NAME NVARCHAR(50)
as
UPDATE UnitsInfo
SET unit_name = @NAME
WHERE unit_id = @ID
GO
-----run-----
EXEC updateUnitInfoByID 3 , 'Programming'


--For students' units
CREATE PROCEDURE getAllStudentsUnits
AS
SELECT StudentsInfo.student_id AS [Student ID], StudentsInfo.fname + ' ' + StudentsInfo.lname As [Student's Name], StudentsUnits.unit_id AS [Unit ID],UnitsInfo.unit_name as [Unit Name] FROM StudentsInfo
LEFT JOIN StudentsUnits ON StudentsInfo.student_id = StudentsUnits.student_id
LEFT JOIN UnitsInfo ON StudentsUnits.unit_id = UnitsInfo.unit_id
GO
-----run-----
EXEC getAllStudentsUnits