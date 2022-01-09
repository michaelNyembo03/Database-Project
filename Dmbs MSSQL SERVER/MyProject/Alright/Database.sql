USE master
GO
--CREATION OF DATABASE START--
IF EXISTS (SELECT name FROM master.dbo.sysdatabases
WHERE name = 'online_playing_game')
     BEGIN
	      DROP DATABASE online_playing_game
		  PRINT 'Existing database online_playing_game deleted.'
	 END
GO

CREATE DATABASE online_playing_game
ON PRIMARY
(
          NAME = 'online_playing_game_data',
		  FILENAME = 'C:\sqlmyProject\online_playing_game_data.mdf', -- primary data
		  SIZE = 5MB,
		  FILEGROWTH = 10%
)
LOG ON
(
          NAME = 'online_playing_game_log',
		  FILENAME = 'C:\sqlmyProject\online_playing_game_log.ldf',-- transaction log data
		  SIZE = 5MB,
		  FILEGROWTH = 10%
)
GO
-- Altering the Database
ALTER DATABASE online_playing_game
ADD FILEGROUP onlineplayinggame_filegroup
GO

ALTER DATABASE online_playing_game
ADD FILE
(         
          NAME = onlineplayinggame_info,
		  FILENAME = 'C:\sqlmyProject\online_playing_game_info.ndf', -- Secondary data
		  SIZE = 5MB
)
GO