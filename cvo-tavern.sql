/* tavern */
DROP TABLE IF EXISTS Tavern;
CREATE TABLE Tavern (tavern_id INT NOT NULL, name VARCHAR(30) NOT NULL, floor INT, location_cd, user_id, PRIMARY KEY (tavern_id), FOREIGN KEY (location_cd) REFERENCES Location (location_cd), FOREIGN KEY (user_id) REFERENCES User (user_id));
INSERT INTO Tavern (tavern_id, name, floor, location_cd, user_id) VALUES (01, "Diligent Cat", 2, "PA", 01);
INSERT INTO Tavern (tavern_id, name, floor, location_cd, user_id) VALUES (02, "Sleepy Dog", 1, "CA", 03);
INSERT INTO Tavern (tavern_id, name, floor, location_cd, user_id) VALUES (03, "Swimming Bird", 1, "VA", 01);
SELECT * FROM Tavern;

/* role */
DROP TABLE IF EXISTS Role;
CREATE TABLE Role (role_cd CHAR(3) NOT NULL, name VARCHAR(30) NOT NULL, PRIMARY KEY (role_cd));
INSERT INTO Role (role_cd, name) VALUES ("OWN", "Owner");
INSERT INTO Role (role_cd, name) VALUES ("MNG", "Manager");
INSERT INTO Role (role_cd, name) VALUES ("SPV", "Superviser");
INSERT INTO Role (role_cd, name) VALUES ("EMP", "Employee");
SELECT * FROM Role;

/* user */
DROP TABLE IF EXISTS User;
CREATE TABLE User (user_id INT NOT NULL, name VARCHAR(30) NOT NULL, role INT, PRIMARY KEY (user_id), FOREIGN KEY (role) REFERENCES Role (role_cd));
INSERT INTO User (user_id, name, role) VALUES (01, "David", "OWN");
INSERT INTO User (user_id, name, role) VALUES (02, "Diane", "OWN");
INSERT INTO User (user_id, name, role) VALUES (03, "Steven", "MNG");
INSERT INTO User (user_id, name, role) VALUES (04, "Stephanie", "MNG");
INSERT INTO User (user_id, name, role) VALUES (05, "Damien", "SPV");
INSERT INTO User (user_id, name, role) VALUES (06, "Cindy", "SPV");
INSERT INTO User (user_id, name, role) VALUES (07, "Thomas", "EMP");
INSERT INTO User (user_id, name, role) VALUES (08, "Laura", "EMP");
INSERT INTO User (user_id, name, role) VALUES (09, "Frances", "EMP");
INSERT INTO User (user_id, name, role) VALUES (10, "Bradley", "EMP");
INSERT INTO User (user_id, name, role) VALUES (11, "Clarissa", "EMP");
INSERT INTO User (user_id, name, role) VALUES (12, "Ellen", "EMP");
SELECT * FROM User;

/* location */
DROP TABLE IF EXISTS Location;
CREATE TABLE Location (location_cd CHAR(2) NOT NULL, name VARCHAR(30) NOT NULL, PRIMARY KEY (location_cd));
INSERT INTO Location (location_cd, name) VALUES ("PA", "Pennsylvania");
INSERT INTO Location (location_cd, name) VALUES ("CA", "California");
INSERT INTO Location (location_cd, name) VALUES ("VA", "Virginia");
INSERT INTO Location (location_cd, name) VALUES ("GA", "Georgia");
INSERT INTO Location (location_cd, name) VALUES ("LA", "Louisiana");
INSERT INTO Location (location_cd, name) VALUES ("MA", "Massachusetts");
INSERT INTO Location (location_cd, name) VALUES ("WA", "Washington");
SELECT * FROM Location;

/* rat */
DROP TABLE IF EXISTS Rat;
CREATE TABLE Rat (rat_id INT NOT NULL, name VARCHAR(30), PRIMARY KEY (rat_id));
INSERT INTO Rat (rat_id, name) VALUES (01, "Mickey");
INSERT INTO Rat (rat_id, name) VALUES (02, "Flash");
INSERT INTO Rat (rat_id, name) VALUES (03, "Blinkin");
INSERT INTO Rat (rat_id, name) VALUES (04, "Le Pew");
INSERT INTO Rat (rat_id, name) VALUES (05, "Kimba");
INSERT INTO Rat (rat_id, name) VALUES (06, "Plop");
INSERT INTO Rat (rat_id, name) VALUES (07, "Haga");
INSERT INTO Rat (rat_id, name) VALUES (08, "Brownie");
INSERT INTO Rat (rat_id, name) VALUES (09, "Periwinkle");
SELECT * FROM Rat;

/* supply */
DROP TABLE IF EXISTS Supply;
CREATE TABLE Supply (supply_id INT NOT NULL, name VARCHAR(30), unit VARCHAR(30), PRIMARY KEY (supply_id));
INSERT INTO Supply (supply_id, name, unit) VALUES (01, "Beer", "ounce");
INSERT INTO Supply (supply_id, name, unit) VALUES (02, "Ale", "gallon");
INSERT INTO Supply (supply_id, name, unit) VALUES (03, "Mead", "litter");
INSERT INTO Supply (supply_id, name, unit) VALUES (04, "Wine", "barrel");
SELECT * FROM Supply;

/* inventory */
DROP TABLE IF EXISTS Inventory;
CREATE TABLE Inventory (inventory_id INT NOT NULL, supply_id INT, tavern_id INT, update_date DATE, count INT, PRIMARY KEY (inventory_id), FOREIGN KEY (supply_id) REFERENCES Supple (supply_id), FOREIGN KEY (tavern_id) REFERENCES Tavern (tavern_id));
INSERT INTO Inventory (inventory_id , supply_id, tavern_id, update_date, count) VALUES (01, 01, 01, "09-01-2019", 10);
INSERT INTO Inventory (inventory_id , supply_id, tavern_id, update_date, count) VALUES (02, 02, 02, "10-11-2018", 10);
INSERT INTO Inventory (inventory_id , supply_id, tavern_id, update_date, count) VALUES (03, 02, 03, "05-10-2019", 10);
INSERT INTO Inventory (inventory_id , supply_id, tavern_id, update_date, count) VALUES (04, 03, 03, "08-22-2019", 10);
INSERT INTO Inventory (inventory_id , supply_id, tavern_id, update_date, count) VALUES (05, 04, 02, "07-19-2018", 10);
SELECT * FROM Inventory;

/* Tavern_has_Supply */
DROP TABLE IF EXISTS Tavern_has_Supply;
CREATE TABLE Tavern_has_Supply (supply_id INT NOT NULL, tavern_id INT, date DATE, cost INT, amount_received INT, FOREIGN KEY (supply_id) REFERENCES Supple (supply_id), FOREIGN KEY (tavern_id) REFERENCES Tavern (tavern_id));
INSERT INTO Tavern_has_Supply (supply_id, tavern_id, date, cost, amount_received) VALUES (01, 01, "09-11-2019", 15, 20);
SELECT * FROM Tavern_has_Supply;

/* service */
DROP TABLE IF EXISTS Service;
CREATE TABLE Service (service_id INT NOT NULL, name VARCHAR(30), status_cd CHAR(3), PRIMARY KEY (service_id), FOREIGN KEY (status_cd) REFERENCES Status (status_cd));
INSERT INTO Service (service_id, name, status_cd) VALUES (01, "Pool", "ACT");
INSERT INTO Service (service_id, name, status_cd) VALUES (02, "Weapon Sharpen", "INA");
INSERT INTO Service (service_id, name, status_cd) VALUES (03, "Bowling", "DIS");
INSERT INTO Service (service_id, name, status_cd) VALUES (04, "Ping Pong", "ACT");
INSERT INTO Service (service_id, name, status_cd) VALUES (05, "Skate", "OUT");
SELECT * FROM Service;

/* status */
DROP TABLE IF EXISTS Status;
CREATE TABLE Status (status_cd CHAR(3) NOT NULL, name VARCHAR(30), PRIMARY KEY (status_cd));
INSERT INTO Status (status_cd, name) VALUES ("ACT", "Active");
INSERT INTO Status (status_cd, name) VALUES ("INA", "Inactive");
INSERT INTO Status (status_cd, name) VALUES ("OUT", "Out of Stock");
INSERT INTO Status (status_cd, name) VALUES ("DIS", "Discountinued");
SELECT * FROM Status;

/* sale */
DROP TABLE IF EXISTS Sale;
CREATE TABLE Sale (sale_id INT NOT NULL, service_id INT, guest INT, price INT, date_purchase DATE, amount_purchase INT, tavern_id INT, PRIMARY KEY (sale_id), FOREIGN KEY (service_id) REFERENCES Service (service_id), FOREIGN KEY (tavern_id) REFERENCES Tavern(tavern_id));
INSERT INTO Sale (sale_id, service_id, guest, price, date_purchase, amount_purchase, tavern_id) VALUES (01, 01, 01, 41, "09-12-2019", 2, 01);
SELECT * FROM Sale;

/* guest */
DROP TABLE IF EXISTS Guest;
CREATE TABLE Guest (guest_id INT NOT NULL, name VARCHAR(30), PRIMARY KEY (guest_id));
INSERT INTO Guest (guest_id, name) VALUES (01, "Smith");
INSERT INTO Guest (guest_id, name) VALUES (02, "Lexi");
INSERT INTO Guest (guest_id, name) VALUES (03, "Harper");
INSERT INTO Guest (guest_id, name) VALUES (04, "Aubrey");
INSERT INTO Guest (guest_id, name) VALUES (05, "Potter");
SELECT * FROM Guest;
