CREATE DATABASE PetPals;

USE PetPals;

CREATE TABLE Pet (
    petId INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(250),
    age INT,
    breed VARCHAR(250)
);

INSERT INTO Pet (name, age, breed) VALUES
('Fluffy', 3, 'Persian'),
('Buddy', 2, 'Labrador'),
('Whiskers', 4, 'Siamese'),
('Rocky', 1, 'German Shepherd'),
('Mittens', 5, 'Maine Coon');

CREATE TABLE Dog (
    dogId INT AUTO_INCREMENT PRIMARY KEY,
    dogBreed VARCHAR(250),
    petId INT,
    FOREIGN KEY (petId) REFERENCES Pet(petId) ON DELETE CASCADE
);

INSERT INTO Dog (dogBreed, petId) VALUES
('Labrador', 2),
('German Shepherd', 4);

CREATE TABLE Cat (
    catId INT AUTO_INCREMENT PRIMARY KEY,
    catColor VARCHAR(250),
    petId INT,
    FOREIGN KEY (petId) REFERENCES Pet(petId) ON DELETE CASCADE
);

INSERT INTO Cat (catColor, petId) VALUES
('White', 1),
('Gray', 3),
('Orange', 5);

CREATE TABLE PetShelter (
    shelterId INT,
    petId INT,
    FOREIGN KEY (petId) REFERENCES Pet(petId) ON DELETE CASCADE
);

INSERT INTO PetShelter (shelterId, petId) VALUES
(1, 1),
(1, 3),
(2, 2),
(2, 5),
(2, 4);

CREATE TABLE Donation (
    donationId INT AUTO_INCREMENT PRIMARY KEY,
    donorName VARCHAR(250),
    amount DECIMAL(10, 2)
);

INSERT INTO Donation (donorName, amount) VALUES
('Alice Johnson', 100.00),
('Bob Smith', 50.75),
('Charlie Davis', 200.50),
('David Wilson', 75.25),
('Eva Miller', 150.00);

CREATE TABLE CashDonation (
    cashdonationId INT AUTO_INCREMENT PRIMARY KEY,
    donationDate VARCHAR(20),
    donationId INT,
    FOREIGN KEY (donationId) REFERENCES Donation(donationId) ON DELETE CASCADE
);

INSERT INTO CashDonation (donationDate, donationId) VALUES
('2023-12-07', 1),
('2023-11-08', 3),
('2023-09-09', 4);

CREATE TABLE ItemDonation (
    itemDonationId INT AUTO_INCREMENT PRIMARY KEY,
    itemType VARCHAR(25),
    donationId INT,
    FOREIGN KEY (donationId) REFERENCES Donation(donationId) ON DELETE CASCADE
);

INSERT INTO ItemDonation (itemType, donationId) VALUES
('Toy', 2),
('Food', 5);

CREATE TABLE AdoptionEvent (
	participantId INT AUTO_INCREMENT PRIMARY KEY,
    adoptionEventId INT,
    participantName VARCHAR(250)
);

INSERT INTO AdoptionEvent (adoptionEventId, participantName) VALUES
(1, 'Anurag Nimje'),
(1, 'Vaibhav Sharma'),
(1, 'Anuj Sharma'),
(2, 'John Doe'),
(2, 'Joe Doe');


