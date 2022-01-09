USE online_playing_game
GO

-- INSERTING DATA

INSERT INTO player --inserting data into player's table
VALUES
            ('marcnyembo13@gmail.com', 'marc'),
            ('michelnyembo03@gmail.com', 'michel'),
			('jeannyembo@yahoo.com', 'jean'),
			('tabithakabulo@hotmail.com', 'tabitha'),
			('patientmbayo11@gmail.com', 'patient'),
			('laurekidi@gmail.com', 'laure'),
			('davidyembo1@yahoo.com', 'david'),
			('sylviemwange@gmail.com', 'sylvie'),
			('djomushesha@gmail.com', 'djo'),
			('leonmwilambwe@hotmail.com', 'leon'),
			('dimaelkidi@gmail.com', 'dimael'),
			('michaelnyembo@gmail.com', 'michael'),
			('eldjonaymuperzili@yahoo.com', 'eldjonay'),
			('lysetteluvungu@hotmail.com', 'lysette'),
			('robertmuyumba@gmail.com', 'robert'),
			('linardnkulu12@yahoo.com', 'linard'),
			('jeanmarc@yahoo.com', 'jeanmarc'),
			('jeanmichel@gmail.com', 'jeanmichel'),
			('jeanclaude@hotmail.com', 'jeanclaude'),
			('julienlwamba@hotmail.com', 'julien'),
			('enochlwamba@hotmail.com', 'enoch'),
			('marechal12@gmail.com', 'marechal12'),
			('Benjamin14@hotmail.com', 'Benjamin14')
GO

INSERT INTO account (player_Email, accountName, accountTime)
--inserting data into account's table
VALUES
            ('marcnyembo13@gmail.com', 'marc11', 0),
            ('michelnyembo03@gmail.com', 'michel32', 3),
			('jeannyembo@yahoo.com', 'jean43', 4),
			('tabithakabulo@hotmail.com', 'tabitha54', 5),
			('patientmbayo11@gmail.com', 'patient5', 3),
			('laurekidi@gmail.com', 'laure65', 0),
			('davidyembo1@yahoo.com', 'david87', 0),
			('sylviemwange@gmail.com', 'sylvie676', 0),
			('djomushesha@gmail.com', 'djo78', 2),
			('leonmwilambwe@hotmail.com', 'leon87', 5),
			('dimaelkidi@gmail.com', 'dimael98', 4),
			('michaelnyembo@gmail.com', 'michael867', 6),
			('eldjonaymuperzili@yahoo.com', 'eldjonay907', 5),
			('lysetteluvungu@hotmail.com', 'lysette6', 4),
			('robertmuyumba@gmail.com', 'robert98', 3),
			('linardnkulu12@yahoo.com', 'linard09', 5),
			('jeanmarc@yahoo.com', 'jeanmarc55', 4),
			('jeanmichel@gmail.com', 'jeanmichel23', 5),
			('jeanclaude@hotmail.com', 'jeanclaude54', 7),
			('julienlwamba@hotmail.com', 'julien12', 6),
			('enochlwamba@hotmail.com', 'enoch14', 6),
			('Benjamin14@hotmail.com', 'Benjamin14', 6)
GO

INSERT INTO errors --inserting data into error's table
VALUES
            (001, 'invalid information', 'Try'),
			(002, 'Bad email address. Your recipients
			 emails may contain typos.', 'Unavailable service'),
			(003, 'Invalid mailbox address.', ' syntax'),
			(004, 'invalid address.', 'Information reply')
GO

INSERT INTO characters(characterNum, characterTeam, characterName, 
characterSkillLevel, account_Name) --inserting data into characters' table
VALUES
            (11, 'Soldier', 'Headhunter', 'Berseker', 'marc11'),
            (16, 'Soldier', 'Renegade', 'Berseker','michel32'),
			(15, 'Soldier', 'Wukong', 'Berseker','jean43'),
		    (12, 'Soldier', 'Jonesy', 'Commando','tabitha54'),
		    (14, 'Soldier', 'Ramirez', 'Commando','patient5'),
		    (13, 'Soldier', 'Spitfire', 'Commando','laure65'),
			(19, 'Ninja', 'Ken', 'Assassin', 'david87'),
			(18, 'Ninja', 'Sarah', 'Assassin','sylvie676'),
			(17, 'Ninja', 'Luna', 'Piercing Lotus', 'djo78'),
			(20, 'Ninja', 'Edge', 'Piercing Lotus', 'leon87'),
			(24, 'Ninja', 'Mari', 'Energy Thief', 'dimael98'),
			(22, 'Constructor', 'Bull', 'Guardian', 'michael867'),
			(25, 'Constructor', 'Knox', 'Guardian', 'eldjonay907'),
			(21, 'Constructor', 'Penny', 'Guardian', 'lysette6'),
			(23, 'Constructor', 'Thora', 'Machinist', 'robert98'),
			(29, 'Constructor', 'Harper', 'Machinist', 'linard09'),
			(27, 'Outlander', 'Grizzly', 'Enforcer Grizzly','jeanmarc55'),
			(31, 'Outlander', 'A.C', 'Striker', 'jeanmichel23'),
			(26, 'Outlander', 'Specter', 'TrailBlazer','jeanclaude54'),
			(30, 'Outlander', 'Jess', 'TrailBlazer', 'julien12'),
			(28, 'Outlander', 'Quinn', 'TrailBlazer', 'enoch14')
GO

INSERT INTO item (itemID, itemType, itemDesc) --inserting data into characters' table
VALUES
            (101, 'Cluster Bomb','Frag Grenade releases 6 
			cluster explosions around the impact site that will
			 each do 25% of the original damage.'),
			(111, 'Hearty Blade ', 'Every 4th hit with a melee 
			weapon restores 24 base health'),
			(202, 'Hammer Critical Chance', 'Increases blunt melee critical rating by 18.'),
			(222, 'Capacitor', 'Increases duration of Shock Tower by 1 second.')
GO

INSERT INTO characters_inventory(characterNum, item_ID,itemQuantity) 
--inserting data into characters_item's table
VALUES
            (11, 101, 3),
			(16, 101, 5),
			(15, 101, 6),
			(12, 101, 4),
			(14, 101, 8),
			(13, 101, 5),
			(19, 111, 7),
			(18, 111, 3),
			(17, 111, 8),
			(20, 111, 4),
			(24, 111, 6),
			(22, 202, 2),
			(25, 202, 5),
			(21, 202, 8),
			(23, 202, 3),
			(29, 202, 7),
			(27, 222, 9),
			(31, 222, 6),
			(26, 222, 5),
			(30, 222, 6)
GO