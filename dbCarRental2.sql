
DROP database dbCarRental2

CREATE DATABASE dbCarRental2
go
use dbCarRental2
go


go

create table Customer
(
	CusID int identity(1,1),
	NameCus nvarchar(50) not null,
	Account varchar(50) unique,
	pass varchar(50) not null,
	Email varchar(50) unique,
	AddCustomer nvarchar(200),
	phoneNum nvarchar(50),
	dob Datetime,
	constraint pk_customer primary key (CusID),
)

go

create table Car_Category
(
	CateID int identity(1,1),
	Catename nvarchar(50) not null,
	constraint pk_Car_Category primary key (CateID)
)
go

go
create table BRANCH
(
	BranchID int identity(1,1),
	BranchName nvarchar(50) not null,
	Addres nvarchar(200),
	phonenum varchar(12),
	constraint pk_Branch primary key (BranchID)
)

create table CAR
(
	CarID int identity(1,1),
	CarName nvarchar(99) not null,
	CostPerDay decimal(18,0) check (CostPerDay >=0),
	Mileage nvarchar(99),
	StatusCar nvarchar(99) not null,
	Detail nvarchar(Max),
	Picture varchar(500),
	Updatedate datetime,
	CateID int,
	BranchID int,
	constraint Pk_CAR primary key (CarID),
	constraint Fk_CAR_Category Foreign key (CateID) references Car_Category(CateID),
	constraint Fk_branch Foreign key (BranchID) references branch(BranchID)
	)

go

	create table Bill_Order
	(
		OrderID int identity(1,1),
		paid bit,
        orderDetails bit,
		DateOrder datetime,
		Time_Rent datetime,
		CusID int,
		constraint Fk_Bill foreign key(CusID) references Customer(CusID),
		constraint pk_Orderbill primary key (OrderID)
	)
	go
	create table OrderDetail
	(
		OrderID int,
		CarID int,
		Quantity int check(Quantity >=0),
		unitPrice decimal(18,0) check(unitPrice>=0),
		constraint pk_OrderDetail primary key (OrderID,CarID),
		constraint Fk_Order foreign key(OrderID) references Bill_Order(OrderID),
		constraint Fk_Car foreign key(CarID) references Car(CarID)

	)
	go

	
	
	insert into Car_Category values (N'Small family cars')
	insert into Car_Category values (N'Large family cars')
	insert into Car_Category values (N'Compact executive cars')
	insert into Car_Category values (N'Compact SUVs')
	

	Insert into branch values (N'Saigon','33 Ly Thuong Kiet Street - District 10','19006868')
	Insert into branch values (N'Da Nang',N'Dong Da Street','19006969')
	Insert into branch values (N'Ha noi',N'Hai Ba Trung Street','19001919')
	
	set dateformat dmy

	insert into CAR values(N'Honda fit 2019',199.9,'33 miles','Available','The 2019 Honda Fit is revved up and ready to go. With extended cargo space and a stylish interior, the Honda Fit is a small car ready for big adventures','2019_honda_fit.jpg','20/2/2019',1,1)
	insert into CAR values(N'2019 Honda Civic',201,'31 miles','Available',N'The 2019 Honda Civic is a great all-around vehicle that ranks in the top third of the compact car class. It offers great performance, a roomy and upscale interior, and a large trunk, but its below-average predicted reliability rating pulls down its score.','2019_honda_civic.jpg','6/7/2019',1,1)
	insert into CAR values(N'Seat Leon',152.3,'84 miles','Available','Find the best rental prices on luxury, economy, and family rental cars with FREE amendments in 3 locations, reserve online today!','Seat Leon.jpg','5/3/2019',1,1)
	insert into CAR values(N'Volvo V40',210,'655 miles','Available','It is great-looking, great to drive with a classy interior and very fuel efficient engines.','Volvo V40.jpg','2/12/2019',1,1)
	insert into CAR values(N'Toyota Corolla',221.4,'1125 miles','Available','The stylish and efficient Toyota Corolla Hybrid is an appealing family-hatchback choice, and a big improvement on the old Auris.','Toyota Corolla.jpg','15/12/2018',1,1)
	insert into CAR values(N'Mazda 6',219.5,'213 miles','Available','Mazda 6 is good car for trip. Find the best rental prices on luxury, economy, and family rental cars with FREE amendments in 3 locations, reserve online today!','Mazda 6.jpg','2/2/2019',2,2)
	insert into CAR values(N'Skoda Superb',202,'645 miles','Available','Find the best rental prices on luxury, economy, and family rental cars with FREE amendments in 3 locations, reserve online today!','Skoda Superb.jpg','12/1/2019',2,2)
	insert into CAR values(N'Vauxhall ',283.9,'654 miles','Available','The entry-level 1.5-litre Turbo engine is a good one too - it has enough get up and go for everyday driving and is reasonably economical. There is a 200PS 1.6-litre petrol, but its rather thirsty and not as quick as you d expect','Vauxhall Insignia Grand Sport.jpg','12/2/2018',2,2)
	insert into CAR values(N'Peugeot',219.0,'879 miles','Available','Find the best rental prices on luxury, economy, and family rental cars with FREE amendments in 3 locations, reserve online today!','Peugeot 508.jpg','2/1/2019',2,2)
	insert into CAR values(N'Hyundai',221.5,'132 miles','Available','Hyundai says the i40 saloon with have best in class dimensions for front head room, shoulder room and legroom plus you can be sure it will come well equipped as standard. The engine line-up will be the same as the i40 Tourer  so in total, there will be three Euro V engines ranging in power from 115bhp to 177bhp','Hyundai i40.jpg','3/12/2018',2,2)
	insert into CAR values(N'Volvo V60 ',268.9,'5481 miles','Out of Stock','The engine line-up starts with a 2.0-litre diesel offering 148bhp in the D3 and a more powerful D4 version with 188bhp. Both can get from 0-62mph in under 10 seconds and come with front-wheel drive and a six-speed manual or an eight-speed automatic gearbox','Volvo V60 estate.jpg','20/10/2018',3,3)
	insert into CAR values(N'Jaguar XE ',306.2,'5540 miles','Available','Find the best rental prices on luxury, economy, and family rental cars with FREE amendments in 3 locations, reserve online today!','Jaguar XE saloon.jpg','23/5/2019',3,3)
	insert into CAR values(N'Volkswagen',125,'2415 miles','Available','Find the best rental prices on luxury, economy, and family rental cars with FREE amendments in 3 locations, reserve online today!','Volkswagen Arteon hatchback.jpg','14/9/2018',3,3)
	insert into CAR values(N'Audi A5 Sport',102,'5451 miles','Available','Find the best rental prices on luxury, economy, and family rental cars with FREE amendments in 3 locations, reserve online today!','Audi A5 Sportback hatchback.jpg','28/2/2019',3,3)
	insert into CAR values(N'Lexus IS',159,'8912 miles','Available','Find the best rental prices on luxury, economy, and family rental cars with FREE amendments in 3 locations, reserve online today!','Lexus IS saloon.jpg','3/5/2019',3,3)
	insert into CAR values(N'Alfa Romeo',241,'6541 miles','Available','In seeking to appeal to keen drivers, the Alfa Romeo Giulia is an agile, sporty rear-wheel-drive saloon offered with three powerful engines. The 197bhp 2.0-litre petrol is a sporty choice, while the 2.2-litre diesel (offered with either 158 or 187bhp) will a tempting choice for many, thanks to its impressive fuel economy and more palatable CO2 emissions','Alfa Romeo Giulia saloon.jpg','5/6/2019',3,3)
	insert into CAR values(N'BMW X1',203,'288 miles','Available','Find the best rental prices on luxury, economy, and family rental cars with FREE amendments in 3 locations, reserve online today!','BMW X1.jpg','28/2/2018',4,2)
	insert into CAR values(N'Fiat 500X',221,'564 miles','Available','Find the best rental prices on luxury, economy, and family rental cars with FREE amendments in 3 locations, reserve online today!','Fiat 500X.jpg','25/4/2019',4,3)
	insert into CAR values(N'Mazda CX-3',223,'412 miles','Available','Mazda has continued its SkyActiv programme of lightness and efficiency with the CX-3 and, for petrol engines at least, has shied away from turbocharged downsizing, instead believing larger, naturally-aspirated motors are the way to go. With 121hp, the entry-level 2.0-litre SkyActiv-G petrol unit is fitted with a six-speed manual gearbox as standard, with a six-speed automatic optionally available, sending power to the front wheels','Mazda CX-3.jpg','2/1/2019',4,3)
	insert into CAR values(N'2019 Nissan Rogue',107,'78 miles','Available','The 2019 Nissan Rogue has an upscale cabin, a generous list of standard safety features, and an expansive cargo area. It also has lackluster acceleration and a noisy transmission, which contribute to its place in the bottom half of our compact SUV rankings.','2019_nissan_rogue_angularfront.jpg','30/7/2019',4,1)
	insert into CAR values(N'2019 RAV4 HYBRID',233,'114 miles','Available',' One unmistakable spirit, multiple distinct versions. RAV4 Hybrid brings a new level of refinement that ','base.jpg','6/8/2018',4,1)
	
	--drop table Admin
	Create table Admin
	(
	UserAdmin varchar(30) primary key,
	PassAdmin varchar (max) not null,
	Name nvarchar(50)
	)
	go
	insert into Admin values('HOANG','0123321','DUCHOANG')
	insert into Admin values('admin',HASHBYTES('SHA2_512','0123321'),'DUC HOANG TRUONG')
	SELECT * FROM Admin
	WHERE PassAdmin = HASHBYTES('SHA2_512','0123321')
	