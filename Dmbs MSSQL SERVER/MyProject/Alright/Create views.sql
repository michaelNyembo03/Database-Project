USE online_playing_game
GO

 -- CREATE VIEWS

CREATE VIEW vwBlockedAccounts -- creating all currently blocked accounts
AS
       SELECT account.accountName, accountTime, player_Email
	   FROM account
	   WHERE accountTime = 0
GO

SELECT * FROM vwBlockedAccounts
GO

CREATE VIEW vwTopSkill
AS
           SELECT TOP 20 characters.characterSkillLevel, account.accountName, account.accountTime
		   FROM characters
		   JOIN account 
		   ON characters.account_Name = account.accountName
		   ORDER BY characters.characterSkillLevel 
GO

SELECT * FROM vwTopSkill
GO

CREATE VIEW vwTopStackedItems 
AS
           SELECT TOP 20 characters_inventory.item_ID, characters_inventory.itemQuantity, item.itemtype, characters.characterName,
		   item.itemDesc
		   FROM characters_inventory
		   JOIN characters
		   ON characters.characterNum = characters_inventory.characterNum
		   JOIN item
		   ON characters_inventory.item_ID = item.itemID
		   ORDER BY itemQuantity 
GO

SELECT * FROM vwTopStackedItems
GO

CREATE VIEW vwPopItems
AS
           SELECT TOP 5 characters_inventory.itemQuantity, characters_inventory.item_ID,characterNum, item.itemType
		   FROM characters_inventory
		   INNER JOIN item
		   ON characters_inventory.item_ID = item.itemID
		   ORDER BY itemQuantity
GO

SELECT * FROM vwPopItems
