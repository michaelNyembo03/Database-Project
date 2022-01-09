USE online_playing_game
GO

-- CREATE STORED PROCEDURES
-- Creating procedure spRegister
CREATE PROCEDURE spRegister
@accountName VARCHAR (30),
@accountTime INT,
@player_Email VARCHAR (30)
AS
IF NOT EXISTS ( SELECT playerEmail FROM player WHERE playerEmail = @player_Email)
      BEGIN
	       PRINT'Invalid player email, choose an existing one or register a new player before continuing!'
      END
INSERT INTO account ( account.accountName, account.accountTime, account.player_Email)
VALUES (@accountName, @accountTime, @player_Email)
GO

--Executing spRegister
EXEC spRegister 'marechal12', 4, 'marechal12@gmail.com'
GO 

-- Creating Procedures spAddTime
CREATE PROCEDURE spAddTime
@accountName VARCHAR (30),
@accountTime INT
AS
IF NOT EXISTS ( SELECT accountName FROM account WHERE accountName = @accountName)
      BEGIN 
	       PRINT'The account does not exist, try another one'
	  END
UPDATE account
SET accountTime = accountTime + @accountTime
WHERE accountName = @accountName
GO

-- Executing spAddTime
EXEC spAddTime 'robert98', 1
GO

--Creating procedure spAddItem
CREATE PROCEDURE spAddItem 
@characterNum INT,
@itemQuantity INT,
@item_ID INT
AS
IF NOT EXISTS( SELECT characterNum FROM characters_inventory WHERE characterNum = @characterNum)
       BEGIN 
	        PRINT'the item does not exist'
	   END
INSERT INTO characters_inventory(characterNum, itemQuantity, item_ID)
VALUES (@characterNum, @itemQuantity, @item_ID)
GO

-- Executing spAddItem
EXEC spAddItem 28, 6, 222
GO

-- creating spAddChar
CREATE PROCEDURE spAddChar
@characterNum INT,
@characterTeam VARCHAR (30),
@characterName VARCHAR (30),
@characterSkillLevel VARCHAR (30),
@account_Name VARCHAR (30)
AS
IF EXISTS (SELECT characterNum FROM characters WHERE characterNum = @characterNum )
   BEGIN
        PRINT'Exists'
   END
IF EXISTS (SELECT account_Name FROM characters WHERE account_Name = @account_Name)
   BEGIN
        PRINT'Exists'
   END
-- Updating characters
UPDATE characters
SET characterNum = @characterNum,
    account_Name = @account_Name
WHERE characterNum = @characterNum
GO

-- Executing spAddChar
EXEC spAddChar 31, 'Outlander', 'Wiu', 'TrailBlazer', 'Benjamin14'
GO

-- creating procedure spSenderLetter
CREATE PROCEDURE spSenderLetter
AS
SELECT *
-- the accName column could have been selected by itself
INTO #tempAccount
FROM account

--Add a column called Printed
ALTER TABLE #tempAccount
ADD
PRINTED SMALLINT
--Set all the values in that column equal to 0
UPDATE #tempAccount
SET Printed = 0
-- SQL does not print column directly, requires varialbles.

DECLARE @accountName VARCHAR (30)
DECLARE @accountTime INT
DECLARE @player_Email VARCHAR (30)
--Creates a while loop to iterate through the rows
WHILE EXISTS (SELECT *
      FROM #tempAccount
	  WHERE Printed = 0)

BEGIN
      SELECT @accountName = MIN(accountName)
	     FROM #tempAccount
		 WHERE Printed = 0
      SELECT @accountName = #tempAccount.accountName,
	         @player_Email = player.playerEmail,
			 @accountTime = #tempAccount.accountTime
	  FROM #tempAccount
	  JOIN player
	  ON #tempAccount.player_email = player.playerEmail
	  WHERE @accountName = #tempAccount.accountName

	  --Prints out the report fro each account
	  PRINT 'Hi '+@accountName
	  PRINT ' '
	  PRINT 'We have emailed this letter to ' + (@player_Email) + 'informing you that you have ' + CAST(@accountTime AS VARCHAR) + 'left'
	  PRINT 'Let us know if this change'
	  PRINT 'Regards, Head Office'
	  
	  -- Update tempAccount
	  UPDATE #tempAccount
	     SET Printed = 1
		 WHERE @accountName = accountName
END
GO

-- Executing spSenderLetter
EXEC spSenderLetter
GO