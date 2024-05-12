/* Criação de Tabelas */
CREATE TABLE User (
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Date_created DATETIME,
    Status INT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(60) NOT NULL,
    Password VARCHAR(30) NOT NULL,
    Phone VARCHAR(11) NOT NULL,
    Cpf VARCHAR(11) UNIQUE NOT NULL
)

CREATE TABLE Category_Restaurant (
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Date_created DATETIME,
    Status INT,
    Name VARCHAR(50) NOT NULL,
    Description VARCHAR(100)
)

CREATE TABLE Restaurant (
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Date_created DATETIME,
    Status INT,
    Name VARCHAR(100) NOT NULL,
    Description VARCHAR(200),
    Phone VARCHAR(11) NOT NULL,
    Rate INT,
    Cnpj VARCHAR(18) NOT NULL
)

CREATE TABLE Operation(
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Date_created DATETIME,
    Status INT,
    Day INT,
    Opening_Time TIME,
    Closing_Time TIME
)

CREATE TABLE Address(
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Date_created DATETIME,
    Status INT,
    Street  VARCHAR(100) NOT NULL,
    District VARCHAR(30) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Zip_Code VARCHAR(9),
    Number INT NOT NULL,
    Complement VARCHAR(100)
)

CREATE TABLE Category_Product (
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Date_created DATETIME,
    Status INT,
    Name VARCHAR(50) NOT NULL,
    Description VARCHAR(100)
)

CREATE TABLE Product (
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Date_created DATETIME,
    Status INT,
    Name VARCHAR(50) NOT NULL,
    Price INT,
    Description VARCHAR(200)
)

CREATE TABLE Additional (
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Date_created DATETIME,
    Status INT,
    Name VARCHAR(50) NOT NULL,
    Price INT,
    Description VARCHAR(200)
)

CREATE TABLE Coupon(
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Date_created DATETIME,
    Status INT,
    Code VARCHAR(30) NOT NULL,
    Value INT NOT NULL,
    Description VARCHAR(200),
    Validity INT NOT NULL
)

CREATE TABLE Status_Delivery(
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Date_created DATETIME,
    Status INT,
    Name VARCHAR(50),
    Description(100)
)

CREATE TABLE Delivery(
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Date_created DATETIME,
    Status INT,
    Delivery_Fee INT,
    Amount INT,
    Description VARCHAR(200),
    Is_Removal BOOLEAN
)

CREATE TABLE Historic_Delivery(
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Date_created DATETIME,
    Status INT
)

CREATE TABLE Rating(
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Date_created DATETIME,
    Status INT,
    Delivery_Rate INT,
    Description  VARCHAR(100)
)

CREATE TABLE  Product_Add (
)

CREATE TABLE Favorite(
)

CREATE TABLE Delivery_Product(
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
)

CREATE TABLE Add_Product_Delivery(
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Date_created DATETIME,
    Status INT,
    Amount INT
)

CREATE TABLE Payment_Method(
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Date_created DATETIME,
    Status INT,
    Name VARCHAR(50),
    Description VARCHAR(100),
)

CREATE TABLE Stats_Pay(
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Date_created DATETIME,
    Status INT,
    Name VARCHAR(30),
    Description VARCHAR(100),
)

CREATE TABLE Payment(
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Date_created DATETIME,
    Status INT,
    Price INT NOT NULL,
    Date_Hour INT
)
/* Adicionando as Chaves Estrangeiras(FK) */
