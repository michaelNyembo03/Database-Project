USE online_playing_game
GO

-- CREATE TRIGGERS
-- Creating Triggers on 
CREATE TRIGGER tr_notify_player
ON player
AFTER INSERT
AS
     PRINT 'Player inserted successfully'
GO
--trying triggers
INSERT INTO player
VALUES ('Carlos12@gmail.com', 'Carlos12')
GO
--creating triggers on account
CREATE TRIGGER tr_edit_account
ON account
AFTER INSERT
AS
     PRINT ' You cannot edit this information in the table'
GO
--trying triggers
INSERT INTO account
VALUES ('Carlos12', 6, 'Carlos12@gmail.com')
GO
