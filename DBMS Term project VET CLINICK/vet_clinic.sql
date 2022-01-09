

create database Vet_clinic;

use Vet_clinic;
create table Customer(
    CustId int AUTO_INCREMENT not null primary key,
    cust_name varchar(30) not null,
    phone varchar(13) not null,
    address varchar(100) not null
    );
    
create table Staff(
	staff_id int not null AUTO_INCREMENT primary key,
	staff_name varchar(30) not null,
	phone varchar(13) not null,
	address varchar(100) not null,
	work_hour time null
);
create table Vet(
    vet_diplomaID int AUTO_INCREMENT not null primary key,
    staff_id int not null,
    foreign key(staff_id) references Staff(staff_id)
    );
    
create table Assistant(
	assist_diplomaID int AUTO_INCREMENT not null primary key,
	staff_id int not null,
    foreign key(staff_id) references Staff(staff_id)
    );

create table Receptionist(
	recept_diplomaID int AUTO_INCREMENT not null primary key,
	staff_id int not null,
    foreign key(staff_id) references Staff(staff_id)
    );
    
create table Pet(
   pet_id int auto_increment not null primary key,
   pet_name varchar(30) not null,
   genre enum('male','female') not null,
   b_o_d date not null,
   color varchar(30) not null,
   pet_type varchar(30) not null,
   custID int not null,
   foreign key(custID) references Customer(CustId)
  
   );

create table Exotic_Pet( 
    id int AUTO_INCREMENT not null primary key,
	habitat varchar(500) not null, 
    care varchar(500) not null, 
	food varchar(500) not null, 
    pet_id int not null, 
	foreign key(pet_id) references Pet(pet_id)
    );
    
create table Domestic_Pet(
    license_num int AUTO_INCREMENT not null primary key,
    pet_id int not null,
    foreign key(pet_id) references Pet(pet_id)
    );
    
create table Supplies(
	sup_id int AUTO_INCREMENT not null primary key,
	sup_name  varchar(30) not null,
	expire_date date not null,
	description varchar(100),
	price decimal not null
    );
       
create table purchase(
	p_num int not null,
	p_date date not null,
	quantity int not null,
	sup_id int not null,
	tot_price decimal not null,
	custID int not null,
	foreign key(sup_id) references Supplies(sup_id),
	foreign key(custID) references Customer(CustId)
    );
    
create table Sale_Record(
    rec_num varchar(10) not null,
	saleR_date date not null,
	quantity int not null,
	sup_id int not null,
	custId int not null,
	foreign key(sup_id) references Supplies(sup_id),
	foreign key(custID) references Customer(custId)
    );
    
create table Appointment(
	ap_time time not null,
	ap_date date not null,
	vet_diplomaID int not null,
	custId int not null,
	pet_id int not null,
	foreign key(vet_diplomaID) references Vet(vet_diplomaID),
	foreign key(custID) references Customer(CustId),
	foreign key(pet_id) references Pet(pet_id)
    );
    
create table Operation(
	op_date date not null,
	vet_diplomaID int null,
	assist_diplomaID int null,
	pet_id int not null,
	foreign key(vet_diplomaID) references Vet(vet_diplomaID),
	foreign key(pet_id) references Pet(pet_id),
	foreign key(assist_diplomaID) references Assistant(assist_diplomaID)
    );


use vet_clinic;

INSERT INTO customer (CustId, cust_name, phone, address) VALUES
(null, 'Alin', '05338428756', 'CIU APT B2 DOOR 233'),
(null, 'Arcel', '05338429075', 'CITY CENTER APT ONER 1'),
(null, 'Myriam', '05338422345', 'HAMITKOY APT AMAR'),
(null, 'Louise', '05338426589', 'GONYELI APT ONER'),
(null, 'John', '05338428710', 'GOSHMENKOY APT OZUN'),
(null, 'Jonathan', '05338428701', 'ORTAKOY APT BOMINTI'),
(null, 'Willard', '05338428765', 'METROPOL APT KAYA'),
(null, 'Wivine', '05338428779', 'HASPOLAT APT MOZA');


use vet_clinic;

INSERT INTO staff (staff_id, staff_name, phone, address, work_hour) VALUES
(null, 'Patrick', '05428428712', 'MAGUSA APT UZUN 2', '00:00:10'),
(null, 'Marc', '05428428717', 'LEKOSA APT POT', '00:00:10'),
(null, 'Michael', '05428428700', 'CITY CENTER APT WELCOME', '00:00:10'),
(null, 'Leon', '05428428701', 'GONYELI APT JESUS IS LORD', '00:00:54'),
(null, 'Ben', '05428428702', 'CITY CENTER APT MAKAYA', '00:00:54'),
(null, 'Laura', '05428428703', 'MARMARA APT DORAS', '00:00:10'),
(null, 'Marcelin', '05428428705', 'HASPOLAT APT PONTORO', '00:00:10'),
(null, 'Patricia', '05428428706', 'HASPOLAT APT PUNJAB', NULL),
(null, 'Claudia', '05428428707', 'HAMITKOY APT MORS', NULL),
(null, 'Lauren', '05428428708', 'KAYMAKLI APT HEAVEN', NULL);


use vet_clinic;

select *
from staff;



use vet_clinic;
INSERT INTO vet (vet_diplomaID, staff_id) VALUES
(1001, 8),
(1002, 9),
(1003, 10);

INSERT INTO assistant (assist_diplomaID, staff_id) VALUES
(9001, 2),
(9002, 3),
(9003, 6),
(9004, 7),
(900, 8);



INSERT INTO receptionist (recept_diplomaID, staff_id) VALUES
(1, 4),
(2, 5);

use vet_clinic;

INSERT INTO pet (pet_id, pet_name, genre, b_o_d, color, pet_type, custID) VALUES
(null, 'Max', 'male', '2021-06-16', 'black', 'dog', 1),
(null, 'Momo', 'male', '2021-01-12', 'brown', 'cat', 5),
(null, 'Riki', 'male', '2021-07-06', 'black', 'Monkey', 3),
(null, 'Kiki', 'female', '2021-02-11', 'black', 'Monkey', 2),
(null, 'Max', 'male', '2021-06-01', 'blue', 'parrot', 4),
(null, 'Luise', 'female', '2021-01-01', 'brown and black', 'Savannah Cat', 6),
(null, 'laura', 'female', '2021-12-16', 'light brown', 'Fennec Fox', 6),
(null, 'Marin', 'female', '2021-04-06', 'light brown', 'Turtles', 7),
(null, 'Doxa', 'male', '2021-07-10', 'light yellow', 'Dwarf Pigs', 8),
(null, 'Mula', 'female', '2021-09-11', 'brown', 'Kinkajou', 7);


use vet_clinic;
select *
from pet;


use vet_clinic;
INSERT INTO domestic_pet (license_num, pet_id) VALUES
(10100, 1),
(10101, 2),
(10102, 3),
(10103, 4),
(10104, 5);


use vet_clinic;
INSERT INTO exotic_pet (id, habitat, care, food, pet_id) VALUES
(1, ' areas of bush, tall grass, and dry reed beds near streams, high-altitude moorlands, and bamboo thickets.', 'The savannah cat has a coat that is easy to care for. Brush your cat weekly to keep hairballs at bay, and trim your cat\'s nails as often as needed, which may be weekly. Brush your cat\'s teeth frequently and ensure you get the appropriate veterinary cleanings.', ' high-protein food', 6),
(2, 'Fennecs require temperatures of at least 68 degrees Fahrenheit. An outdoor enclosure that\'s as large as possible is ideal to give the fennec some exercise', 'routine examinations and vaccinations to stay healthy', 'Vegetables, fruits, pinkie mice, rodents, eggs, crickets, mealworms, raw meat diets', 7),
(3, 'Aquarium', 'swimming opportunities, while also allowing plenty of space to haul out of the water and get some sun', 'Sea cucumbers, jellyfish, mollusks, prawns, bryozoans, other invertebrates, and seaweed.', 8),
(4, 'large crate or tent', 'child-proof locks on cabinets, and block off areas you do not want your mini pig to explore.\r\nMake sure there are no sharp edges or objects around the home that could injure your pet as he wanders from room to room.\r\nSupervise your pig, especially when young, when he roams the house.\r\nLeave him in a smaller secured area or pen when you leave the home.', 'pig pellets that are low in protein and fat and high in fiber snd vegetable', 9),
(5, 'they live and forage in trees', 'Kinkajous need as large of an enclosure as possible', 'fruit', 10);


use vet_clinic;

INSERT INTO supplies (sup_id, sup_name, expire_date, description, price) VALUES
(null, 'Puppy medium lamb & rice', '2022-12-12', 'mix food for dog', '45'),
(null, 'ferplast drink', '2022-12-12', ' cup', '5'),
(null, 'Flamingo Metalic feeder', '2022-12-12', 'feeder', '3'),
(null, 'Karlie Wood Bedding', '2022-12-12', 'Bed', '8'),
(null, 'chips', '2022-12-12', 'cereal', '4'),
(null, 'flakes', '2022-12-12', 'cereal', '6'),
(null, 'milk', '2022-12-12', 'mik', '6'),
(null, 'bones toy', '2022-12-12', 'toy', '12'),
(null, 'vegetables', '2022-12-12', 'herb for pet', '10'),
(null, 'coat', '2022-12-12', 'coat for pet', '20'),
(null, 'rat toy', '2022-12-12', 'toy', '25'),
(null, 'tooth brush', '2022-12-12', 'brush', '54'),
(null, 'tooth pate', '2022-12-12', 'pate', '15');

use vet_clinic;
select *
from supplies;


use vet_clinic;
INSERT INTO purchase (p_num, p_date, quantity, sup_id, tot_price, custID) VALUES
(100, '2022-01-04', 2, 7,'12', 5),
(101, '2022-01-03', 1, 2,'8',  4),
(103, '2022-01-04', 4, 12,'216',  1),
(104, '2022-01-01', 5, 5,'15',  3),
(105, '2022-01-03', 1, 3,'6',  6);

use vet_clinic;
INSERT INTO sale_record (rec_num, saleR_date, quantity, sup_id, custId) VALUES
('5001', '2022-01-04', 2, 7, 5),
('5002', '2022-01-03', 1, 2, 4),
('5003', '2022-01-04', 4, 12, 1),
('5004', '2022-01-01', 5, 5, 3),
('5005', '2022-01-03', 1, 3, 6);

use vet_clinic;
INSERT INTO appointment (ap_time, ap_date, vet_diplomaID, custId, pet_id) VALUES
('09:00:00', '2022-01-07', 1001, 2, 4),
('14:00:00', '2022-01-07', 1001, 3, 3),
('09:00:00', '2022-01-08', 1001, 6, 6),
('09:00:00', '2022-01-08', 1002, 7, 8),
('09:00:00', '2022-01-09', 1003, 7, 10);


use vet_clinic;

select *
from assistant;

use vet_clinic;
INSERT INTO Operation (op_date, vet_diplomaID, assist_diplomaID, pet_id) VALUES
('2022-01-07', 1001, 9001, 4),
('2022-01-07', 1001, 9002, 3),
('2022-01-08', NULL, 9001, 6),
('2022-01-08', 1002, NULL, 8),
('2022-01-09', 1003, NULL, 10);


-- count the numbers of all the vet
use vet_clinic;
select count(vet_diplomaID)
from vet;

 -- display all the pet and their appointment day 
use vet_clinic;
select concat(p.pet_name,' has an appointment on ',a.ap_date)
from pet p join appointment a on (p.pet_id = a.pet_id);

-- all the vet details
use vet_clinic;
select staff_name, staff_id, phone, address
from staff
where staff_id IN (select staff_id
				   from vet
				   );

-- display all customer and their pet
select concat(c.cust_name,' owns ' ,p.pet_name) as "Owners and their pet"
from customer c join pet p
on c.custID = p.pet_id;

-- the total amount that the clinic earned from all the solde supplies

use vet_clinic;
select concat(sup_name,' is', price, ' TL') as supplies
from supplies;

-- display all the pet and their age
use vet_clinic;
select pet_name, concat(' is ',round((datediff(current_date(),b_o_d))),' days old ') as "pet and age"
from pet;

-- display the customer name and the supplies they bauoght for their pet
select concat('The total money the clinic has made from the all solde supplies is ',sum(price),' TL') as "total money"
from supplies; 

-- check which vet has an appointment with the pet whose name is riki
 use vet_clinic;
 select concat(p.pet_name,' has an appointment with vet ',s.staff_name) as "Riki's vet"
 from pet p join appointment a on (p.pet_id = a.pet_id) and (p.pet_name='Riki')
 join vet v on (a.vet_diplomaID = v.vet_diplomaID) join staff s on (v.staff_id = s.staff_id);
 

 
-- disply the daily hour work of the receptionist
use vet_clinic;
select concat('Receptionist work ',work_hour/6,' per day') as "daily work hour"
from staff 
where staff_id in(select staff_id
                   from receptionist);
                   


-- display the vet who inspect many pet than others
use vet_clinic;
select staff_name
from staff 
where staff_id in (select staff_id 
                   from vet
				   where vet_diplomaID = (select max(vet_diplomaID)
                                           from operation));
                                           
                                           
-- display the sale record with the supplies name
use vet_clinic;
select p.p_num, p.p_date,p.quantity,concat(p.tot_price*p.quantity||' TL' )as total_price, s.sup_name,c.cust_name
from purchase p join supplies s on (p.sup_id = s.sup_id) join customer c on (p.custID = c.custID);

 