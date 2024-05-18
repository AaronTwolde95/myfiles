CREATE SCHEMA GroupData;

CREATE TABLE IF NOT EXISTS `GroupData`. `vehicle` (
    vehicleID INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_make VARCHAR(45),
    vehicle_model VARCHAR(45),
    vehicle_year YEAR,
    vehicle_color VARCHAR(45)
);

CREATE TABLE IF NOT EXISTS `GroupData`.`location` (
    DOL_vehicle_ID INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_make VARCHAR(45),
    vehicle_model VARCHAR(45),
    PostalCode VARCHAR(45),
    City VARCHAR(45)
);

CREATE TABLE IF NOT EXISTS `GroupData`.`production_facts` (
    weight INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_make VARCHAR(45),
    units_produced INT,
    city_of_assembly VARCHAR(45),
    country_of_assembly VARCHAR(45)
);


CREATE TABLE IF NOT EXISTS `GroupData`.`vehicle_type` (
    unique_identifier INT AUTO_INCREMENT PRIMARY KEY,
    electric_vehicle_type VARCHAR(45),
    vehicle_make VARCHAR(45),
    vehicle_model VARCHAR(45),
    color VARCHAR(45)
);

CREATE TABLE IF NOT EXISTS `GroupData`.`legislative_district` (
    district INT AUTO_INCREMENT PRIMARY KEY,
    postal_code VARCHAR(45),
    vehicle_make VARCHAR(45),
    vehicle_model INT,
    DOL_vehicle_ID VARCHAR(45)
);

CREATE TABLE IF NOT EXISTS `GroupData`.`electric_range` (
    VIN INT AUTO_INCREMENT PRIMARY KEY,
    electric_range INT,
    vehicle_make VARCHAR(45),
    electric_utility VARCHAR(45),
    top_speed VARCHAR(45)
);

CREATE TABLE IF NOT EXISTS `GroupData`.`vehicle_properties` (
    vehicle_make VARCHAR(45),
    vehicle_model INT,
    driveterrain VARCHAR(45),
    wheel_size INT,
    zero_to_sixty FLOAT,
    PRIMARY KEY (vehicle_make, vehicle_model)
);

CREATE TABLE IF NOT EXISTS `GroupData`.`vehiclelegislative` (
    unique_identifier INT,
    district INT,
    PRIMARY KEY (unique_identifier, district)
    
);

CREATE TABLE IF NOT EXISTS `GroupData`.`location_has_vehicle` (
    district INT AUTO_INCREMENT PRIMARY KEY,
    postal_code VARCHAR(45),
    vehicle_make VARCHAR(45),
    vehicle_model INT,
    DOL_vehicle_ID VARCHAR(45)
);



ALTER TABLE vehicle
ADD COLUMN DOL_vehcicle_ID INT,
ADD FOREIGN KEY (DOL_vehicle_ID) REFERENCES Location(DOL_vehicle_ID);

ALTER TABLE vehicle_type
ADD COLUMN Vehicle_number INT,
ADD FOREIGN KEY (Vehicle_number) REFERENCES Vehicle(vehicle_number);

ALTER TABLE LegislativeDistrict
ADD COLUMN unique_identifier INT,
ADD FOREIGN KEY (unique_identifier) REFERENCES vehicleLegislative(unique_identifer);

ALTER TABLE electirc_range
ADD COLUMN uniqueIDentifier INT,
ADD FOREIGN KEY (unique_identifer) REFERENCES vehicle_type(unique_identifer);

ALTER TABLE Vehicle_Properties
ADD COLUMN Vehiclenumber INT,
ADD FOREIGN KEY (vehicle_number) REFERENCES Vehicle(Vehicle_number);

ALTER TABLE Production_Facts
ADD COLUMN VehicleNumber INT,
ADD FOREIGN KEY (Vehicle_number) REFERENCES Vehicle(Vehicle_number);

INSERT INTO Vehicle (vehicle_ID, vehicle_make, vehicle_model, vehicle_year, color) 
VALUES 
('1', 'AUDI' , 'A3', 2017, 'Red'), 
('2', 'AUDI', 'A3', 2018, 'Blue'), 
('3','TESLA', 'MODEL S', 2017, 'Gray'),
('4',	'JEEP',	'WRANGLER',	2021,	'Green'),
('5',	'TESLA',	'MODEL 3',	2020,	'Silver'),
('6',	'JEEP','WRANGLER',	2023,	'Black'),
('7'	,'CHEVROLET',	'VOLT',	2017,	'Red'),
('8'	,'TESLA',	'MODEL 3',	2020,	'Blue'),
('9'	,'AUDI',	'Q5',	2022,	'Black'),
('10',	'CHEVROLET',	'VOLT',	2017,	'White'),
('11',	'CHEVROLET',	'BOLT EV',	2018,	'White'),
('12'	,'TESLA',	'MODEL S',	2015	,'Blue'),
('13'	,'KIA',	'EV6',	2022	,'Black'),
('14','NISSAN'	,'LEAF'	,2013,'White');

INSERT INTO location (DOL_Vehicle_ID,	Vehicle_Make,	Vehicle_Model,	Postal_Code,	City) 
VALUES
(235085336,	'AUDI','A3',	98126	,'Seattle'),
(237896795,	'AUDI',	'A3',	98502	,'Olympia'),
(154498865,	'TESLA',	'MODEL S',	98516,	'Lacey'),
(154525493,	'JEEP',	'WRANGLER',	98589,	'Tenino'),
(225996361,	'TESLA',	'MODEL 3',	98902,	'Yakima'),
(220675367,	'JEEP',	'WRANGLER',	98501,	'Olympia'),
(162720022,	'CHEVROLET',	'VOLT',	98345,	'Keyport'),
(6293899,	'TESLA',	'MODEL 3',	98043,	'Mountlake Terrace');


INSERT INTO production_facts (WEIGHT,	MAKE	,UNITS_PRODUCED ,	CITY_OF_ASSEMBLY,	COUNTRY_OF_ASSEMBLY)
VALUES
(3200	,'AUDI', 150000,	'INGOLSTADT',	'GERMANY'),
(2200	,'TESLA',	350000,	'FREMONT',	'USA'),
(3500	,'CHEVROLET',	40000,	'DETROIT',	'USA'),
(3800	,'NISSAN',	50000,	'SMYRNA',	'USA'),
(4600	,'KIA',	50000,	'HWASEONG',	'SOUTH KOREA');


INSERT INTO vehicle_properties(vehicle_make,vehicle_model, driveterain, minimum_wheel_size,	zero_to_sixty)
VALUES
('AUDI',	'A3',	'FWD',	16,	6.6),
('AUDI'	,'A3',	'FWD',	16	,6.6),
('TESLA',	'MODEL S',	'AWD',	19	,2.4),
('JEEP',	'WRANGLER'	,'4WD',	17	,6.1),
('TESLA',	'MODEL 3',	'RWD',	18	,3.1),
('JEEP',	'WRANGLER',	'4WD',	17,	6.1),
('CHEVROLET',	'VOLT',	'FWD',	17	,7.5),
('TESLA',	'MODEL 3',	'AWD',	18	,3.1),
('AUDI',	'Q5'	'AWD',	18	,5.9),
('CHEVROLET',	'VOLT',	'FWD',	17,	7.5),
('CHEVROLET',	'BOLT EV',	'FWD',	17	,6.5),
('TESLA',	'MODEL S',	'AWD',	19	,2.4),
('KIA'	,'EV6',	'RWD',	19,	5.1),
('NISSAN','LEAF',	'FWD'	,16	,7.4);


INSERT INTO electric_range(VIN,	vehicle_Make, Electric_Range,	Electric_Utility,	top_speed)
VALUES
('WAUTPBFF4H',	'AUDI',	16,	'city_of_seattle',	140),
('WAUUPBFF2J'	,'AUDI',	16,	'PUGET SOUND ENERGY INC',	140),
('5YJSA1E22H'	,'TESLA',	210,	'PUGET SOUND ENERGY INC',	155),
('1C4JJXP62M'	,'JEEP',	25,	'PUGET SOUND ENERGY INC',	99),
('5YJ3E1EC9L	','TESLA'	,308,	'PACIFICORP'	,140),
('1C4JJXP66P',	'JEEP',	21,	'PUGET SOUND ENERGY INC',	99),
('1G1RA6S53H',	'CHEVROLET',	53,	'PUGET SOUND ENERGY INC',	101),
('5YJ3E1EB5L',	'TESLA',	322,	'PUGET SOUND ENERGY INC'	,140),
('WA1F2AFY1N'	,'AUDI',	23,	'CITY OF SEATTLE - (WA)|CITY OF TACOMA - (WA)'	,130),
('1G1RB6S59H',	'CHEVROLET',	53,'	PUGET SOUND ENERGY INC',	101),
('1G1FW6S03J',	'CHEVROLET',	238	,'PUGET SOUND ENERGY INC',	90.1),
('5YJSA1S22F'	,'TESLA',	208,	'CITY OF SEATTLE - (WA)|CITY OF TACOMA - (WA)'	,155),
('KNDC3DLC7N',	'KIA',	0,	'PUGET SOUND ENERGY INC',	161),
('1N4AZ0CP9D'	,'NISSAN',	75,'PUGET SOUND ENERGY INC'	,90);





