USE online_playing_game
GO

--CREATE TABLES START--

CREATE TABLE player --creating player's table
(
             playerEmail VARCHAR (30) NOT NULL PRIMARY KEY, -- primary key
			 playerName VARCHAR (30)  NOT NULL,
			 CHECK(playerEmail LIKE '%_@%')
)
GO

CREATE TABLE account --creating account's table
(
            accountName VARCHAR (30) NOT NULL PRIMARY KEY, -- primary key
			accountTime INT NOT NULL CHECK (accountTime > -1), -- checking constraint
			player_Email VARCHAR (30) NOT NULL REFERENCES player (playerEmail) -- foreign key
						ON DELETE CASCADE
)
GO 
  
CREATE TABLE errors --creating errors' table
(
             errorID INT NOT NULL PRIMARY KEY, -- primary key
			 errorDescr VARCHAR (200) NOT NULL,
			 errorType VARCHAR (40) NOT NULL
)
GO

CREATE TABLE characters --creating crharacters' table
(
             characterNum INT NOT NULL PRIMARY KEY, -- primary key
			 characterTeam VARCHAR (30) NOT NULL,
			 characterName VARCHAR (30) NOT NULL,
			 characterSkillLevel VARCHAR (30) NOT NULL,
			 account_Name VARCHAR (30) NOT NULL REFERENCES account (accountName)
			 ON DELETE CASCADE  
)
GO

CREATE TABLE item --creating item's table
(
             itemID INT NOT NULL PRIMARY KEY,  -- primary key
			 itemType VARCHAR (50) NOT NULL,
			 itemDesc VARCHAR (300) NOT NULL
)
GO

CREATE TABLE characters_inventory  --creating characters_item's table
(
             characterNum INT NOT NULL PRIMARY KEY, -- primary key
             itemQuantity INT NOT NULL DEFAULT 1,
			 item_ID INT NOT NULL REFERENCES item (itemID) -- primary key
)		
GO