use project1;
create database delhi;
create database bangalore;
use bangalore;
use delhi;
CREATE TABLE Donors (
    DonorID INT AUTO_INCREMENT PRIMARY KEY,
    DonorName VARCHAR(100) NOT NULL,
    Contact VARCHAR(15) NOT NULL,
    Address VARCHAR(255),
    City VARCHAR(50) NOT NULL
);

CREATE TABLE Food_Donations (
    DonationID INT AUTO_INCREMENT PRIMARY KEY,
    DonorID INT NOT NULL,
    FoodType VARCHAR(100) NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    DonationDate DATE NOT NULL,
    ExpiryDate DATE NOT NULL,
    Status ENUM('Pending','Collected','Delivered','Expired') DEFAULT 'Pending',
    FOREIGN KEY (DonorID) REFERENCES Donors(DonorID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Receivers (
    ReceiverID INT AUTO_INCREMENT PRIMARY KEY,
    ReceiverName VARCHAR(100) NOT NULL,
    ReceiverType ENUM('Orphanage','NGO','Homeless Shelter','Individual') NOT NULL,
    Contact VARCHAR(15),
    City VARCHAR(50) NOT NULL
);

CREATE TABLE Volunteers (
    VolunteerID INT AUTO_INCREMENT PRIMARY KEY,
    VolunteerName VARCHAR(100) NOT NULL,
    Contact VARCHAR(15),
    City VARCHAR(50) NOT NULL
);

CREATE TABLE Deliveries (
    DeliveryID INT AUTO_INCREMENT PRIMARY KEY,
    DonationID INT NOT NULL,
    ReceiverID INT NOT NULL,
    VolunteerID INT NOT NULL,
    DeliveryDate DATE,
    Status ENUM('Pending','In Transit','Delivered','Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (DonationID) REFERENCES Food_Donations(DonationID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (ReceiverID) REFERENCES Receivers(ReceiverID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (VolunteerID) REFERENCES Volunteers(VolunteerID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE NGO (
    NGOID INT AUTO_INCREMENT PRIMARY KEY,
    NGOName VARCHAR(100) NOT NULL,
    Contact VARCHAR(15),
    City VARCHAR(50) NOT NULL
);

USE delhi;

-- Donors (10)
INSERT INTO Donors (DonorName, Contact, Address, City) VALUES
('Hotel Sunshine', '9876543210', 'Connaught Place', 'Delhi'),
('Taj Palace', '9811122233', 'Chanakyapuri', 'Delhi'),
('The Leela', '9899001122', 'Saket', 'Delhi'),
('Haldirams', '9765432109', 'Lajpat Nagar', 'Delhi'),
('Bikanervala', '9123456780', 'Karol Bagh', 'Delhi'),
('The Imperial', '9988776655', 'Janpath', 'Delhi'),
('Radisson Blu', '9876512345', 'Dwarka', 'Delhi'),
('Barbeque Nation', '9090909090', 'Rohini', 'Delhi'),
('Dominos', '9191919191', 'Vasant Kunj', 'Delhi'),
('McDonalds', '9898989898', 'Rajouri Garden', 'Delhi');
USE DELHI;
SELECT * FROM DONORS;
SELECT * FROM RECEIVERS;
SELECT * FROM VOLUNTEERS;
SELECT * FROM FOOD_DONATIONS;
SELECT * FROM DELIVERIES;
select * from ngo;


-- Receivers (5)
INSERT INTO Receivers (ReceiverName, ReceiverType, Contact, City) VALUES
('Helping Hands NGO', 'NGO', '9998887776', 'Delhi'),
('Hope Foundation', 'Orphanage', '8887776665', 'Delhi'),
('Food For All', 'NGO', '7776665554', 'Delhi'),
('Smile Shelter', 'Homeless Shelter', '6665554443', 'Delhi'),
('Joy Home', 'Orphanage', '5554443332', 'Delhi');
TRUNCATE TABLE RECEIVERS;

-- Volunteers (5)
INSERT INTO Volunteers (VolunteerName, Contact, City) VALUES
('Rahul Sharma', '7778889990', 'Delhi'),
('Priya Mehta', '8889990001', 'Delhi'),
('Rohit Verma', '9990001112', 'Delhi'),
('Ananya Gupta', '7008009001', 'Delhi'),
('Manoj Singh', '8899776655', 'Delhi');

-- Food_Donations (10)
INSERT INTO Food_Donations (DonorID, FoodType, Quantity, DonationDate, ExpiryDate, Status) VALUES
(1, 'Cooked Meals', 100, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 1 DAY), 'Pending'),
(2, 'Bread Packets', 200, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 2 DAY), 'Pending'),
(3, 'Rice and Curry', 150, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 1 DAY), 'Pending'),
(4, 'Snacks', 80, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 1 DAY), 'Pending'),
(5, 'Biscuits', 300, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 5 DAY), 'Collected'),
(6, 'Pasta', 120, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 1 DAY), 'Delivered'),
(7, 'Pizza Boxes', 90, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 2 DAY), 'Pending'),
(8, 'Vegetable Meals', 200, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 3 DAY), 'Collected'),
(9, 'Juice Bottles', 250, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 4 DAY), 'Pending'),
(10, 'Dal & Rice', 180, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 1 DAY), 'Pending');

-- Deliveries (10)
INSERT INTO Deliveries (DonationID, ReceiverID, VolunteerID, DeliveryDate, Status) VALUES
(1, 1, 1, CURDATE(), 'Delivered'),
(2, 2, 2, CURDATE(), 'In Transit'),
(3, 3, 3, CURDATE(), 'Delivered'),
(4, 4, 4, CURDATE(), 'Pending'),
(5, 5, 5, CURDATE(), 'Delivered'),
(6, 1, 2, CURDATE(), 'Delivered'),
(7, 3, 3, CURDATE(), 'In Transit'),
(8, 4, 1, CURDATE(), 'Delivered'),
(9, 2, 4, CURDATE(), 'Pending'),
(10, 5, 5, CURDATE(), 'Pending');

-- NGOs
INSERT INTO NGO (NGOName, Contact, City) VALUES
('Helping Hands NGO', '9998887776', 'Delhi'),
('Food Bank India', '8887776665', 'Delhi'),
('Mission Smile', '7776665554', 'Delhi'),
('Share A Meal', '6665554443', 'Delhi'),
('Hunger Relief Trust', '5554443332', 'Delhi');

USE bangalore;

INSERT INTO Donors (DonorName, Contact, Address, City) VALUES
('Hotel Paradise', '9001112223', 'MG Road', 'Bangalore'),
('ITC Gardenia', '9345678901', 'Residency Road', 'Bangalore'),
('The Chancery', '9876504321', 'Lavelle Road', 'Bangalore'),
('Truffles', '9823456789', 'Koramangala', 'Bangalore'),
('Empire Restaurant', '9000090000', 'Indiranagar', 'Bangalore'),
('Brew & Bite', '9101112131', 'Koramangala', 'Bangalore'),
('Cafe Coffee Day', '9201112131', 'Whitefield', 'Bangalore'),
('KFC', '9302223334', 'Jayanagar', 'Bangalore'),
('Dominos BLR', '9403334445', 'MG Road', 'Bangalore'),
('McDonalds BLR', '9504445556', 'Bannerghatta', 'Bangalore');

INSERT INTO Receivers (ReceiverName, ReceiverType, Contact, City) VALUES
('Aastha Foundation', 'NGO', '9556677889', 'Bangalore'),
('Shishu Bhavan', 'Orphanage', '9445566778', 'Bangalore'),
('Umeed Shelter', 'Homeless Shelter', '9334455667', 'Bangalore'),
('Care & Share', 'NGO', '9223344556', 'Bangalore'),
('Hope Home', 'Orphanage', '9112233445', 'Bangalore');

INSERT INTO Volunteers (VolunteerName, Contact, City) VALUES
('Aarav Patel', '9001234567', 'Bangalore'),
('Diya Rao', '8887654321', 'Bangalore'),
('Karan Joshi', '7776543210', 'Bangalore'),
('Meera Nair', '7665544332', 'Bangalore'),
('Siddharth', '7554433221', 'Bangalore');

INSERT INTO Food_Donations (DonorID, FoodType, Quantity, DonationDate, ExpiryDate, Status) VALUES
(1, 'South Indian Meals', 120, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 2 DAY), 'Pending'),
(2, 'Biryani', 200, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 1 DAY), 'Collected'),
(3, 'Juice & Snacks', 180, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 3 DAY), 'Delivered'),
(4, 'Pastries', 50, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 1 DAY), 'Pending'),
(5, 'Chapati Meals', 300, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 2 DAY), 'Pending'),
(6, 'Wraps', 90, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 2 DAY), 'Pending'),
(7, 'Salads', 60, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 2 DAY), 'Pending'),
(8, 'Cookies', 200, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 5 DAY), 'Collected'),
(9, 'Samosa Packs', 150, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 1 DAY), 'Pending'),
(10, 'Fruit Packs', 180, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 3 DAY), 'Pending');

INSERT INTO Deliveries (DonationID, ReceiverID, VolunteerID, DeliveryDate, Status) VALUES
(1, 1, 1, CURDATE(), 'In Transit'),
(2, 2, 2, CURDATE(), 'Delivered'),
(3, 3, 3, CURDATE(), 'Delivered'),
(4, 1, 1, CURDATE(), 'Pending'),
(5, 2, 2, CURDATE(), 'Delivered'),
(6, 3, 3, CURDATE(), 'Pending'),
(7, 4, 4, CURDATE(), 'Delivered'),
(8, 5, 5, CURDATE(), 'Delivered'),
(9, 1, 2, CURDATE(), 'Pending'),
(10, 4, 1, CURDATE(), 'Pending');

INSERT INTO NGO (NGOName, Contact, City) VALUES
('Aastha Foundation', '9556677889', 'Bangalore'),
('HungerFree India', '9331122334', 'Bangalore'),
('Serve Together', '9223344556', 'Bangalore'),
('Feeding Hands', '9110001112', 'Bangalore'),
('City Relief', '9000001112', 'Bangalore');

DELIMITER //
CREATE PROCEDURE AddDonation(
  IN p_DonorID INT,
  IN p_FoodType VARCHAR(100),
  IN p_Quantity INT,
  IN p_ExpiryDate DATE
)
BEGIN
  INSERT INTO Food_Donations (DonorID, FoodType, Quantity, DonationDate, ExpiryDate, Status)
  VALUES (p_DonorID, p_FoodType, p_Quantity, CURDATE(), p_ExpiryDate, 'Pending');
END //
DELIMITER ;

CALL AddDonation(1,'New Meals',50, DATE_ADD(CURDATE(),INTERVAL 2 DAY));

DELIMITER //
CREATE TRIGGER trg_after_delivery_update
AFTER UPDATE ON Deliveries
FOR EACH ROW
BEGIN
  IF NEW.Status = 'Delivered' THEN
    UPDATE Food_Donations
    SET Status = 'Delivered'
    WHERE DonationID = NEW.DonationID;
  END IF;
END //
DELIMITER ;

CREATE TABLE IF NOT EXISTS Donation_Log (
  LogID INT AUTO_INCREMENT PRIMARY KEY,
  DonationID INT,
  OldStatus VARCHAR(50),
  NewStatus VARCHAR(50),
  ChangeDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER trg_log_donation_status
AFTER UPDATE ON Food_Donations
FOR EACH ROW
BEGIN
  IF OLD.Status <> NEW.Status THEN
    INSERT INTO Donation_Log (DonationID, OldStatus, NewStatus)
    VALUES (NEW.DonationID, OLD.Status, NEW.Status);
  END IF;
END //
DELIMITER ;

-- Enable scheduler (requires admin)
SET GLOBAL event_scheduler = ON;

-- Create event in Delhi DB
CREATE EVENT IF NOT EXISTS ev_expire_donations
ON SCHEDULE EVERY 1 DAY
DO
  UPDATE Food_Donations
  SET Status = 'Expired'
  WHERE ExpiryDate < CURDATE() AND Status NOT IN ('Delivered','Expired');

CREATE VIEW v_active_donations_delhi AS
SELECT d.DonationID, r.DonorName, d.FoodType, d.Quantity, d.ExpiryDate, d.Status
FROM Food_Donations d JOIN Donors r ON d.DonorID = r.DonorID
WHERE d.Status IN ('Pending','Collected');

-- from a connection that can access both DBs (or from one server instance)
CREATE VIEW global_all_donations AS
SELECT 'Delhi' AS Region, DonationID, DonorID, FoodType, Quantity, DonationDate, ExpiryDate, Status
FROM delhi.Food_Donations
UNION ALL
SELECT 'Bangalore' AS Region, DonationID, DonorID, FoodType, Quantity, DonationDate, ExpiryDate, Status
FROM bangalore.Food_Donations;

USE delhi;
SELECT DonationID, DonorID, FoodType, Quantity, DonationDate, ExpiryDate, Status
FROM Food_Donations
ORDER BY DonationDate DESC;

SELECT Status, COUNT(*) AS TotalDonations, SUM(Quantity) AS TotalQuantity
FROM Food_Donations
GROUP BY Status;

SELECT DonationID, DonorID, FoodType, Quantity, ExpiryDate, 
       DATEDIFF(ExpiryDate, CURDATE()) AS DaysLeft, Status
FROM Food_Donations
WHERE DATEDIFF(ExpiryDate, CURDATE()) <= 2
  AND Status NOT IN ('Delivered', 'Expired')
ORDER BY ExpiryDate ASC;

SELECT d.DonorName, COUNT(fd.DonationID) AS TotalDonations, 
       SUM(fd.Quantity) AS TotalQuantity
FROM Donors d
JOIN Food_Donations fd ON d.DonorID = fd.DonorID
GROUP BY d.DonorName
ORDER BY TotalQuantity DESC
LIMIT 5;

SELECT v.VolunteerName, COUNT(del.DeliveryID) AS TotalDeliveries,
       SUM(CASE WHEN del.Status = 'Delivered' THEN 1 ELSE 0 END) AS SuccessfulDeliveries
FROM Volunteers v
LEFT JOIN Deliveries del ON v.VolunteerID = del.VolunteerID
GROUP BY v.VolunteerName
ORDER BY SuccessfulDeliveries DESC;

SELECT r.ReceiverName, r.ReceiverType, COUNT(del.DeliveryID) AS TotalReceived
FROM Receivers r
JOIN Deliveries del ON r.ReceiverID = del.ReceiverID
WHERE del.Status = 'Delivered'
GROUP BY r.ReceiverName, r.ReceiverType
ORDER BY TotalReceived DESC;

SELECT f.DonationID, f.FoodType, f.Quantity, v.VolunteerName, 
       r.ReceiverName, del.DeliveryDate, del.Status
FROM Deliveries del
JOIN Food_Donations f ON del.DonationID = f.DonationID
JOIN Volunteers v ON del.VolunteerID = v.VolunteerID
JOIN Receivers r ON del.ReceiverID = r.ReceiverID
ORDER BY del.DeliveryDate DESC;

SELECT DonationID, FoodType, Quantity, ExpiryDate, Status
FROM Food_Donations
WHERE Status = 'Expired';

SELECT 'Delhi' AS City, COUNT(*) AS TotalDonations, SUM(Quantity) AS TotalQuantity
FROM food_donation_delhi.Food_Donations
UNION ALL
SELECT 'Bangalore' AS City, COUNT(*) AS TotalDonations, SUM(Quantity) AS TotalQuantity
FROM bangalore.Food_Donations;