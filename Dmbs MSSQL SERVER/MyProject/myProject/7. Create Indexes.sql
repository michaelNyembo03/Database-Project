USE online_playing_game
GO

-- Creating a Nonclustered index of the player tables
CREATE NONCLUSTERED INDEX IX_player
     ON player
     ( playerEmail ) ;
GO
-- Creating a Nonclustered index of the account table
CREATE NONCLUSTERED INDEX IX_account
     ON account
     ( accountName ) ;
GO

-- Creating a Nonclustered index of the characters table
CREATE NONCLUSTERED INDEX IX_characters
     ON characters
     ( characterNum ) ;
GO

CREATE NONCLUSTERED INDEX IX_item
     ON item
     ( itemID ) ;
GO

-- Creating a Nonclustered index of the Characters_inventory table
CREATE NONCLUSTERED INDEX IX_Characters_inventory
     ON characters_inventory
     ( characterNum ) ;
GO
-- Creating a Nonclustered index of the errors table
CREATE NONCLUSTERED INDEX IX_errors
     ON errors
     ( errorID ) ;
GO
