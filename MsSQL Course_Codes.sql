/* 
--Part 1:SQL operators
    1.1:SQL Arithmetic operators
						+	Add	
						-	Subtract	
						*	Multiply	
						/	Divide	
						%	Modulo
*/
 SELECT 27+2 AS Addition,
        27-3 AS Substraction,
        27*3 AS Multiplication,
        27/3 AS Division,
        27%4 AS Modulo
        
        
/*--1.2:SQL Comparison Operators 
						=	Equal to	
						>	Greater than	
						<	Less than	
						>=	Greater than or equal to	
						<=	Less than or equal to	
						<>	Not equal to
*/

		SELECT [car_make]
			,[car_model]
			,[car_price]
			FROM Cars
			WHERE car_price = 6141.67
		GO

		SELECT [car_make]
			,[car_model]
			,[car_price]
			FROM Cars
			WHERE car_price > 6141.67
		GO

		SELECT [car_make]
			,[car_model]
			,[car_price]
			FROM Cars
			WHERE car_price < 6141.67
		GO
		SELECT [car_make]
			,[car_model]
			,[car_price]
			FROM Cars
			WHERE car_price <= 6141.67
		GO

		SELECT [car_make]
			,[car_model]
			,[car_price]
			FROM Cars
			WHERE car_price >= 6141.67
		GO
		SELECT [car_make]
			,[car_model]
			,[car_price]
			FROM Cars
			WHERE [car_make] <> 'Chevrolet'

		--- OR---
		SELECT [car_make]
			,[car_model]
			,[car_price]
			FROM Cars
			WHERE [car_make] != 'Chevrolet'
		GO

		SELECT  [car_make],
				[Car_price2]
		FROM Cars
		WHERE car_make = ALL(SELECT car_make from Cars WHERE car_make = 'Toyota')
		GO

		SELECT  [car_make],
				[Car_price2]
		FROM Cars
		WHERE car_make < 'Toyota'
		GO

		SELECT  [car_make],
				[Car_price2]
		FROM Cars
		WHERE car_make <= 'Toyota'
		GO

		SELECT  [car_make],
				[Car_price2]
		FROM Cars
		WHERE car_make > 'Toyota'
		GO

		SELECT  [car_make],
				[Car_price2]
		FROM Cars
		WHERE car_make >= 'Toyota'

/*--1.3:SQL Compound Operators 
						+=	Add equals
						-=	Subtract equals
						*=	Multiply equals
						/=	Divide equals
						%=	Modulo equals
*/
		DECLARE @x1 INT = 27;  
		SET @x1+= 2 ;  
		SELECT @x1 AS Added_2;  
		GO  
		DECLARE @x2 INT = 27;  
		SET @x2-= 2;  
		SELECT @x2 AS Subtracted_2;  
		GO  
		DECLARE @x3 INT = 27;  
		SET @x3 *= 2;  
		SELECT @x3 AS Multiplied_by_2;  
		GO 
		DECLARE @x4 INT = 27;  
		SET @x4 /= 2;  
		SELECT @x4 AS Divided_by_2;  
		GO  
		DECLARE @x5 INT = 27;  
		SET @x5 %= 2 ;  
		SELECT @x5 AS Modulo_of_27_divided_by_2;  
/*
*--1.4:SQL Logical Operators
						ALL     --->TRUE if all of the subquery values meet the condition	
						AND     --->TRUE if all the conditions separated by AND is TRUE	
						ANY     --->TRUE if any of the subquery values meet the condition	
						BETWEEN --->TRUE if the operand is within the range of comparisons	
						EXISTS  --->TRUE if the subquery returns one or more records	
						IN      --->TRUE if the operand is equal to one of a list of expressions	
						LIKE    --->TRUE if the operand matches a pattern	
						NOT     --->Displays a record if the condition(s) is NOT TRUE	
						OR      --->TRUE if any of the conditions separated by OR is TRUE	
						SOME    --->TRUE if any of the subquery values meet the condition
--===================================================================================================
*/
		SELECT  [car_make],
				[Car_price2]
		FROM Cars
		WHERE car_make = ALL(SELECT car_make from Cars WHERE car_make = 'Toyota')
		GO

		SELECT  [car_make],
				[Car_price2]
		FROM Cars
		WHERE car_color = 'Red' AND car_make  = 'Chevrolet'
		GO
		SELECT  [car_make],
				[Car_price2]
		FROM Cars
		WHERE car_color = 'Red'  OR car_make  = 'Chevrolet'
		GO

		SELECT  [car_make],
				[Car_price2]
		FROM Cars
		WHERE car_color = 'Red'  OR car_color  = 'PURPLE'
		GO

		---OR---
		SELECT  [car_make],
				[Car_price2]
		FROM Cars
		WHERE car_color IN ('Red' , 'PURPLE')
		GO
		SELECT  [car_make],
				[Car_price2]
		FROM Cars
		WHERE car_price2 >ALL(SELECT car_price2 FROM CARS WHERE car_color IN ('Red' , 'PURPLE'))
		GO

		SELECT  [car_make],
				[Car_price2]
		FROM Cars
		WHERE car_price2 >=ALL(SELECT car_price2 FROM CARS WHERE car_color IN ('Red' , 'PURPLE'))
		GO
		---OR---
		SELECT  [car_make],
				[Car_price2]
		FROM Cars
		WHERE car_price2 >=ALL(SELECT MAX(car_price2) FROM CARS WHERE car_color IN ('Red' , 'PURPLE'))
		GO

		SELECT  [car_make],
				[Car_price2]
		FROM Cars
		WHERE car_price2 >=14959.53 --->ALL(SELECT MAX(car_price2) FROM CARS WHERE car_color IN ('Red' , 'PURPLE'))
		GO
		SELECT  [car_make],
				[Car_price2]
		FROM Cars
		WHERE car_price2 >=ANY(SELECT MIN(car_price2) FROM CARS WHERE car_color IN ('Red' , 'PURPLE'))
		GO
		----OR----
		SELECT  [car_make],
				[Car_price2]
		FROM Cars
		WHERE car_price2 >=1537.31--->SELECT MIN(car_price2) FROM CARS WHERE car_color IN ('Red' , 'PURPLE')
		GO

		SELECT  [car_make],
				[Car_price2]
		FROM Cars
		WHERE car_price2  BETWEEN 7814.64 AND 11254.70-->SELECT MIN(car_price2) FROM CARS WHERE car_color IN ('Red' , 'PURPLE')
		GO

		SELECT  [car_make],
				[Car_price2]
		FROM Cars
		WHERE car_make LIKE 'C%' 
		GO

		SELECT  [car_make],
				[Car_price2]
		FROM Cars
		WHERE car_make LIKE '[acg]%'
		ORDER BY car_make 
		GO

		SELECT  [car_make],
				[Car_price2]
		FROM Cars
		WHERE car_make LIKE '[^acg]%' --- The sumbol ^ make  negative i.e returns cars  not made by any car maker name started by a, c, g
		ORDER BY car_make 
		GO

		---OR--- The above query returns the same result as the following query
		SELECT  [car_make],
				[Car_price2]
		FROM Cars
		WHERE car_make NOT LIKE '[acg]%' 
		ORDER BY car_make 
		GO

		---OR---
		SELECT  [car_make],
				[Car_price2]
		FROM Cars
		WHERE car_make NOT LIKE '[a-c]%' 
		ORDER BY car_make 
		GO

		SELECT  [car_make],car_color,
				[Car_price2]
		FROM Cars
		WHERE EXISTS (SELECT car_make FROM CARS WHERE car_price2 < 4120.53)
		ORDER BY car_color 
		GO
/*==============================================================================================================
Part 2: SQL FUNCTIONS
        2.1:SQL Server String Functions
        2.2:SQL Server Date Functions
	    2.3:SQL Server Conversion/Infromational Functions (Transact-SQL)
        2.4:SQL Server Math/Numeric Functions
        2.4:JSON functions (Transact-SQL)
	    2.5:SML XPath Syntax
--==============================================================================================================
2.1:SQL Server String Functions
--==============================================================================================================
						Function		Description
						ASCII			Returns the ASCII value for the specific character
						CHAR			Returns the character based on the ASCII code
						CHARINDEX		Returns the position of a substring in a string
						CONCAT			Adds two or more strings together
						Concat with +	Adds two or more strings together
						CONCAT_WS		Adds two or more strings together with a separator
						DATALENGTH		Returns the number of bytes used to represent an expression
						DIFFERENCE		Compares two SOUNDEX values, and returns an integer value
						FORMAT			Formats a value with the specified format
						LEFT			Extracts a number of characters from a string (starting from left)
						LEN				Returns the length of a string
						LOWER			Converts a string to lower-case
						LTRIM			Removes leading spaces from a string
						NCHAR			Returns the Unicode character based on the number code
						PATINDEX		Returns the position of a pattern in a string
						QUOTENAME		Returns a Unicode string with delimiters added to make the string a valid SQL Server delimited identifier
						REPLACE			Replaces all occurrences of a substring within a string, with a new substring
						REPLICATE		Repeats a string a specified number of times
						REVERSE			Reverses a string and returns the result
						RIGHT			Extracts a number of characters from a string (starting from right)
						RTRIM			Removes trailing spaces from a string
						SOUNDEX			Returns a four-character code to evaluate the similarity of two strings
						SPACE			Returns a string of the specified number of space characters
						STR				Returns a number as string
						STUFF			Deletes a part of a string and then inserts another part into the string, starting at a specified position
						SUBSTRING		Extracts some characters from a string
						TRANSLATE		Returns the string from the first argument after the characters specified in the second argument are translated into the characters specified in the third argument.
						TRIM			Removes leading and trailing spaces (or other specified characters) from a string
						UNICODE			Returns the Unicode value for the first character of the input expression
						UPPER			Converts a string to upper-case
*/
		---1) ASCII() Returns the ASCII value for the specific character
		SELECT 
		ASCII('A')AS A,
		ASCII('B')AS B,
		ASCII('C')AS C, 
		ASCII('D')AS D, 
		ASCII('E')AS E, 
		ASCII('a')AS a,
		ASCII('b')AS b, 
		ASCII('c')AS c, 
		ASCII('d')AS d, 
		ASCII('e')AS e
		GO
		---===============================================================================================================
		---2)CHAR()Returns the character based on the ASCII code
		SELECT 
		CHAR(65)AS A,
		CHAR(66)AS B,
		CHAR(67)AS C, 
		CHAR(68)AS D, 
		CHAR(69)AS E, 
		CHAR(97)AS a,
		CHAR(98)AS b, 
		CHAR(99)AS c, 
		CHAR(100)AS d, 
		CHAR(101)AS e
		GO

		---OR---Returns the character based on the ASCII code
		SELECT 
			CHAR(ASCII('A'))AS A,
			CHAR(ASCII('B'))AS B,
			CHAR(ASCII('C'))AS C, 
			CHAR(ASCII('D'))AS D, 
			CHAR(ASCII('E'))AS E, 
			CHAR(ASCII('a'))AS a,
			CHAR(ASCII('b'))AS b, 
			CHAR(ASCII('c'))AS c, 
			CHAR(ASCII('d'))AS d, 
			CHAR(ASCII('e'))AS e
			GO
		---===================================================================================================================
		---3)CHARINDEX		Returns the position of a substring in a string
		DECLARE @emails varchar(50) = 'data_analytics@gmail.com'
		SELECT CHARINDEX('@',@emails)
		SELECT SUBSTRING(@emails,CHARINDEX('@',@emails),15)
		---===================================================================================================================
		---4)PATINDEX		Returns the position of a pattern in a string. Once we kmow the position of a pattern, we can use it in other function that requires the start position

		SELECT PATINDEX('%03041796%','Iwasbornon03041796') position; -- this query finds the position of the pattern 
		GO
		SELECT SUBSTRING('wifewasbornin03041996',
				PATINDEX('%03041996%','wifewasbornin03041996'),8) AS Position
		GO
		SELECT CONVERT(DATE,FORMAT(CONVERT(NUMERIC,
				SUBSTRING('Iwasbornon03041796',
				PATINDEX('%03041796%','Iwasbornon03041796'),8)),'##-##-####')) AS Position

		SELECT FORMAT(CONVERT(DATE,
			FORMAT(CONVERT(NUMERIC,SUBSTRING('Iwasbornon03041796',
				PATINDEX('%03041796%','Iwasbornon03041796'),8)),'##-##-####')),'d', 'en-US') AS Position

            /* Note  that the use case of CHARINDEX() and PATINDEX() in SQL query
            a. **Function Purpose**:
            - `CHARINDEX()`: This function is used to find the position of a specific substring within a string.
            - `PATINDEX()`: It's used to search for a pattern within a string using wildcard characters.
            b. **Wildcard Characters**:
            - `CHARINDEX()` does not support wildcard characters.
            - `PATINDEX()` allows you to use wildcard characters (such as `%` or `_`) to specify patterns in your search¹.

            c. **Start Position**:
            - `CHARINDEX()` accepts a third argument that allows you to specify the starting position of the search. You can use this to find matches occurring after a certain point in the string.
            - `PATINDEX()` does not accept a third argument for specifying the start position¹.

            d. **Examples**:
            - Using `CHARINDEX()`:
                ```sql
                SELECT CHARINDEX('Bob', 'Bob likes beer. Bob also likes beef.', 16);
                -- Result: 17 (position of the second occurrence of 'Bob')
                ```
            - Using `PATINDEX()` with wildcard characters:
                ```sql
                SELECT PATINDEX('%b_er%', 'Bob likes beer.');
                -- Result: 11 (position of 'beer')
                ```
                In this example, we use `%` as a wildcard to match any characters between 'b' and 'e' in the search string¹.

                Remember that `CHARINDEX()` is useful for exact substring searches, while `PATINDEX()` is more flexible when you need to search for patterns using wildcards². 🚀
            */

		---5) CONCAT Adds two or more strings together
		SELECT CONCAT('American', ' ' +'Life');

		---6)Datalength ---->Returns the number of bytes used to represent an expression
		SELECT DATALENGTH('KemelewMuheFedilu') AS 'Datalength in bytes'
		---7)LEN ---->Returns the number of chaaracters used to represent an expression
		SELECT LEN('All mammals are Animals') AS Len 

		---8)FORMAT ---->Formats a value with the specified format, AND the result would be 12-34-56789	

			SELECT FORMAT(123456789, '##-##-#####');

		---)FORMAT Function used to fomra date and time
				---SQL Server Date FORMAT output examples
				---Below is the list of date and datetime formats with an example of the output.  The current date used for all of these examples is "2021-03-21 11:36:14.840".

		SELECT FORMAT (getdate(), 'dd/MM/yyyy ') as date	
		SELECT FORMAT (getdate(), 'dd/MM/yyyy, hh:mm:ss ') as date	
		SELECT FORMAT (getdate(), 'dddd, MMMM, yyyy') as date	
		SELECT FORMAT (getdate(), 'MMM dd yyyy') as date	
		SELECT FORMAT (getdate(), 'MM.dd.yy') as date	
		SELECT FORMAT (getdate(), 'MM-dd-yy') as date	
		SELECT FORMAT (getdate(), 'hh:mm:ss tt') as date	
		SELECT FORMAT (getdate(), 'd','us') as date	
		SELECT FORMAT (getdate(), 'yyyy-MM-dd hh:mm:ss tt') as date	
		SELECT FORMAT (getdate(), 'yyyy.MM.dd hh:mm:ss t') as date	
		SELECT FORMAT (getdate(), 'dddd, MMMM, yyyy','es-es') as date --Spanish	domingo, marzo, 2021
		SELECT FORMAT (getdate(), 'dddd dd, MMMM, yyyy','ja-jp') as date --Japanese	日曜日 21, 3月, 2021
		SELECT FORMAT (getdate(), 'MM-dd-yyyy ') as date	
		SELECT FORMAT (getdate(), 'MM dd yyyy ') as date	
		SELECT FORMAT (getdate(), 'yyyyMMdd') as date	
		SELECT FORMAT (getdate(), 'HH:mm:dd') as time	
		SELECT FORMAT (getdate(), 'HH:mm:dd.ffffff') as time
			GO
		--The following table contains different examples for different cultures/STYLE date and time
		SELECT FORMAT (getdate(), 'd', 'en-US') as date	
		SELECT FORMAT (getdate(), 'd', 'fr-FR') as date	
		SELECT FORMAT (getdate(), 'd', 'hy-AM') as date	
		SELECT FORMAT (getdate(), 'd', 'bs-Latn-BA') as date	
		SELECT FORMAT (getdate(), 'd', 'zh-CN') as date	
		SELECT FORMAT (getdate(), 'MM.dd.yy') as date	
		SELECT FORMAT (getdate(), 'd', 'prs-AF') as date	
		SELECT FORMAT (getdate(), 'd', 'dv-MV') as date	
		SELECT FORMAT (getdate(), 'd', 'fr-BE') as date	
		SELECT FORMAT (getdate(), 'd', 'fr-CA') as date	
		SELECT FORMAT (getdate(), 'd', 'hu-HU') as date	

		---9)LEFT --->Extracts a number of characters from a string (starting from left)
		SELECT LEFT ('All mammals are Animals',11)

		---10)LEN	Returns the length of a string
		SELECT LEN('All mammals are Animals') --- Returns the number of characters
		SELECT DATALENGTH('All mammals are Animals')--- Returns the length in bytes

		---11)LOWER/UPPER---->Converts a string to lower-case
		SELECT UPPER('all mammals are animals')
		SELECT LOWER('ALL MAMMALS ARE ANIMALS')

		---12)RTRIM/LTRIM			Removes trailing/leading spaces from a string
		SELECT LTRIM(                   'Kemelew Muhe Fedilu') ltrim,RTRIM('Kemelew Muhe Fedilu            ') rtrim 
						
		---13)REPLICATE ----->Repeats a string a specified number of times
		SELECT REPLICATE(9,5);			
		---14)RIGHT ---->Extracts a number of characters from a string (starting from right)
		SELECT RIGHT('All mammals are Animals',7);	------>Extracts a number of characters from a string (starting from right)
		SELECT LEFT('All mammals are Animals',11);	------>Extracts a number of characters from a string (starting from Left)
		SELECT SPACE(10);				            ------>Returns a string of the specified number of space characters
		SELECT STR(2026840347);			            ------>Returns a number as string
			
		SELECT STUFF('wifewasbornin03041996',14,8,'01151975')--->STUFF Deletes a part of a string and then inserts another part into the string, starting at a specified position
		/*Syntax
			STUFF(string, start, length, new_string)*/

		--SUBSTRING		Extracts some characters from a string
		SELECT SUBSTRING('wifewasbornin03041996',PATINDEX('%03041996%','wifewasbornin03041996'),8) AS Position
--=============================================================================================================
--2.2.SQL Server Date Functions
--=============================================================================================================
		SELECT CURRENT_TIMESTAMP						------->Returns the current date and time
		SELECT DATEADD(M,3, '01/15/1975')				------->Adds a time/date interval to a date and then returns the date
		SELECT DATEDIFF(YEAR,'01/15/1975',GETDATE())			------->Returns the difference between two dates
		SELECT DATEFROMPARTS(2024,01,07)				------->Returns a date from the specified parts (year, month, and day values)
		SELECT DATENAME(M, GETDATE())					------->Returns a specified part of a date (as string)
		SELECT DATEPART(M, GETDATE())					------->Returns a specified part of a date (as integer)
		SELECT DAY(GETDATE())									------->Returns the day of the month for a specified date
		SELECT GETDATE()										------->Returns the current database system date and time
		SELECT GETUTCDATE()										------->Returns the current database system UTC date and time
		SELECT ISDATE('01/15/1975')							------->Checks an expression and returns 1 if it is a valid date, otherwise 0
		SELECT MONTH(GETDATE())							------->Returns the month part for a specified date (a number from 1 to 12)
		SELECT SYSDATETIME()							------->Returns the date and time of the SQL Server
		SELECT YEAR(GETDATE())							------->Returns the year part for a specified date

--============================================================================================================
-- 2.3:SQL Server Conversion/Infromational Functions 
--============================================================================================================
		---Function												Description
		SELECT AVG(Car_price) car_price1, 
				CAST(AVG(Car_price) AS int) FROM cars            ---->Converts a value (of any type) into a specified datatype
		SELECT COALESCE(null,null,100)				             ---->COALESCE Returns the first non-null value in a list
		SELECT CONVERT(VARCHAR(20),AVG(Car_price)) FROM cars     ---->Converts a value (of any type) into a specified datatype
		SELECT CURRENT_USER										 ---->CURRENT_USER Returns the name of the current user in the SQL Server database
		--IIF					                                 ---->Returns a value if a condition is TRUE, or another value if a condition is FALSE
		SELECT car_color, COUNT(car_model) FavoriteColor,
				IIF(COUNT(car_model) > 4, 'More frequent','Less frequen') FavoriteColor FROM cars 
		WHERE car_make ='Chevrolet' 
		GROUP BY car_color
		ORDER BY COUNT(car_model) DESC
		SELECT ISNULL(NULL,27) AS 'Null'    					---->Return a specified value if the expression is NULL, otherwise return the expression
		SELECT ISNULL(AVG(car_price),25) FROM Cars              ----> using query from database
		SELECT ISNULL(8,27) AS Notnull
		SELECT ISNUMERIC('Pyton')  AS Notnumeric                ---->Tests whether an expression is numeric. if the expression is not numeric, retruns 0 otherwise returns 1
		SELECT ISNUMERIC(157) AS Number
		SELECT NULLIF(6,6)		                                ---->Returns NULL if two expressions are equal
		SELECT NULLIF(4,7)
		SELECT SESSION_USER                                     ---->Returns the name of the current user in the SQL Server database
		SELECT SYSTEM_USER                                      ---->Returns the login name for the current user
		SELECT USER_NAME()                                      ---->Returns the database user name based on the specified id
--==============================================================================================================
--2.4.SQL Server Math/Numeric Functions
--==============================================================================================================
		Function	Description
		--ABS			Returns the absolute value of a number
		SELECT  100-250 , ABS(100-250)
		--AVG			Returns the average value of an expression
		SELECT AVG(car_price) AS AveragePrice FROM CARS
		--CEILING		Returns the smallest integer value that is >= a number
		SELECT CEILING(12.53) AS 'Ceiling', 12.53 AS 'Noceiling'
		--COUNT		Returns the number of records returned by a select query
		SELECT COUNT(*) AS NumberofCars FROM CARS 
		--FLOOR		Returns the largest integer value that is <= to a number
		SELECT  FLOOR(12.53) AS WithFloor, 12.53 AS Nofloor
		--MAX			Returns the maximum value in a set of values
		SELECT MAX(car_price)  AS MaxPrice FROM cars
		--MIN			Returns the minimum value in a set of values
		SELECT MIN(car_price)  AS MinPrice FROM cars
		--POWER		Returns the value of a number raised to the power of another number
		SELECT  POWER(2,3)
		--RAND		Returns a random number
		SELECT RAND() AS rand, RAND()* 10000/36 AS Fakevalue
		--ROUND		Rounds a number to a specified number of decimal places
		SELECT 12.78 AS noRound, ROUND(12.78,1) AS round
		--SQRT		Returns the square root of a number
		SELECT sqrt(49)
		--SQUARE		Returns the square of a number
		SELECT SQUARE (7)
	 --=========================================================================================================
	 --2.4:JSON functions (Transact-SQL)
	 --=========================================================================================================



	 --========================================================================================================= 
	 --2.5:XML XPath Syntax
	 --=========================================================================================================



	 --=========================================================================================================
	 --Part III: Creating database objects 
	 --======================================================================================================
		 IF EXISTS (SELECT name FROM master.sys.databases 
			WHERE name = N'CarsDatabase2')  DROP  DATABASE CarsDatabase2
			GO
	 --====================================================================================================
		 CREATE DATABASE CarsDatabase2
		 GO
	 --==================================================================================================
		---CREATING Tables
		 USE CarsDatabase2
		 GO
		 CREATE TABLE CarTable
		 (
			Car_VIN_Number [varchar](50) NOT NULL,
			[OwnerSSN] [varchar](50) NULL,
			[Car_make] [varchar](50) NULL,
			[Model] [varchar](50) NULL
		 ) 
        GO

		CREATE TABLE CarOwners
	    (
			[OwnerSSN] [varchar](50),
			[first_name] [varchar](50) NULL,
			[last_name] [varchar](50) NULL,
			[Car_VIN_Number] [varchar](50) NULL
        ) 
		--====================================================================================================
		--Adding constraints to table
		--1) Adding NOT NULL CONSTRAINTS
		  ALTER TABLE CarOwners
		  ALTER COLUMN OwnerSSN VARCHAR(50)  NOT NULL;
		   GO
		 --2) Adding Primary key CONSTRAINTS
		   ALTER TABLE CarOwners
		   ADD CONSTRAINT PK_primaryKeyName PRIMARY KEY CLUSTERED (OwnerSSN) 
		   GO
		 --3) Adding Foreign key CONSTRAINTS to CarTable
		   ALTER TABLE CarTable
		   ADD CONSTRAINT FK_ FOREIGN KEY (OwnerSSN) 
			REFERENCES CarOwners (OwnerSSN)   

		

		---Creating view
		CREATE VIEW car_view
		AS
		SELECT *
		FROM   cars
		WHERE  car_make = 'Chevrolet'
				AND car_year = 2017 

		--Querying views
		--SELECT * 
		--FROM Car_view
		GO
		--========================Creating User defined function- Table value
		CREATE FUNCTION Fn_carview(@carmaker VARCHAR(20),
								@carmodel VARCHAR(20))
		returns TABLE
		AS --BEGIN
			RETURN
			(
				SELECT *
			FROM   cars
			WHERE  car_make = @carmaker
					AND car_model = @carmodel
			)
		GO

		--SELECT  * 
		--	FROM fn_carView('Chevrolet','Express 2500')

		---Creating Stored procedur
		CREATE PROC Car_sp_car(@carmaker VARCHAR(20),
							@carmodel VARCHAR(20))
		AS
			SELECT *
			FROM   cars
			WHERE  car_make = @carmaker
				AND car_model = @carmodel

		--- Calling Stored procedure
		--EXECUTE [dbo].[Car_sp_cars]'Chevrolet','Express 2500'

		---Querying using Subquery
		SELECT  *
		FROM cars
		WHERE  [car_mileage] >= (SELECT AVG([car_mileage])
								FROM cars
								WHERE car_condition = 'new') 

		---Pivoting SQL result set --- Using CTE
		WITH cte1 --- Using CTE
		AS 
		(
			SELECT car_condition,
						[car_year],
						[car_price]
				FROM   cars
		)
		SELECT *
		FROM   cte1
			PIVOT(Sum(car_price)
					FOR car_condition IN([certified pre-owned],new,used)) PivotTable 

		---Pivoting SQL result set --- Pivot operator
		SELECT *
		FROM  (SELECT car_condition,
					[car_year],
					[car_price]
			FROM   cars)A
			PIVOT(Sum(car_price)
				FOR car_condition IN([certified pre-owned],new,used)) Pivoting 
		ORDER BY car_year 


		---Pivoting using CASE Statement
		SELECT 
			[car_year],
			SUM(CASE WHEN car_condition = 'certified pre-owned' THEN [car_price] END) AS CertifiedPre_owned,
			SUM(CASE WHEN car_condition = 'new' THEN car_price END) AS New,
			SUM(CASE WHEN car_condition = 'used' THEN car_price END ) AS Used
				FROM cars  
		GROUP BY [car_year]
		ORDER BY car_year 
		GO
		----
		CREATE PROCEDURE Cars_sp_GettingCars 
			(@carmake varchar(20),
			@CarColor varchar(20))
		--LANGUAGE plpgsql
		AS

		BEGIN
				--RETURN QUERY
					SELECT * FROM cars
					WHERE Cars.car_make  = @carmake  AND Cars.car_color = @CarColor;
		END;
		---
		EXECUTE Cars_sp_GettingCars 'Chevrolet','Blue'

	/*
		PART IV. READING
		a) using Set operators(UNION, INTERSECT EXCEPT)
		b) using Table operators(JOIN, CROSS APPLY, PIVOT, UNPIVOT)
		c) using SUBQUERY
		d) Teble expressions(CTE, Recurrsive CTE, View, user defined function, Stored procedure)
		e) Using variables temporary tables, table variable
		f)Control flow statments( If, IIF, CASE, WHILE, BEGIN... END)
		PART V:UPDATE
		PART VI:DELETE 

		*/
