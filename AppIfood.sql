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

ALTER TABLE Restaurant
ADD COLUMN (Categ_Rest_Id) INT,
ADD CONSTRAINT fk_category_restaurant
FOREIGN KEY (Categ_Rest_Id)
REFERENCES Category_Restaurant(Id);

ALTER TABLE Operation
ADD COLUMN (Restaurant_id) INT,
ADD CONSTRAINT fk_restaurant
FOREIGN KEY (Restaurant_id)
REFERENCES Restaurant(Id);

ALTER TABLE Address
ADD COLUMN (Restaurant_id) INT,
ADD CONSTRAINT fk_restaurant
FOREIGN KEY (Restaurant_id)
REFERENCES Restaurant(Id);

ALTER TABLE Address
ADD COLUMN (User_id) INT,
ADD CONSTRAINT fk_user
FOREIGN KEY (User_id)
REFERENCES User(Id);

ALTER TABLE Product
ADD COLUMN (Restaurant_id) INT,
ADD CONSTRAINT fk_restaurant
FOREIGN KEY (Restaurant_id)
REFERENCES Restaurant(Id);

ALTER TABLE Product
ADD COLUMN (Categ_Prod_id) INT,
ADD CONSTRAINT fk_category_product
FOREIGN KEY (Categ_Prod_id)
REFERENCES Category_Product(Id);

ALTER TABLE Delivery
ADD COLUMN (Address_Id) INT,
ADD CONSTRAINT fk_address
FOREIGN KEY (Address_Id)
REFERENCES Address(Id);

ALTER TABLE Delivery
ADD COLUMN (User_Id) INT,
ADD CONSTRAINT fk_user
FOREIGN KEY (User_Id)
REFERENCES User(Id);

ALTER TABLE Delivery
ADD COLUMN (Restaurant_id) INT,
ADD CONSTRAINT fk_restaurant
FOREIGN KEY (Restaurant_id)
REFERENCES Restaurant(Id);

ALTER TABLE Delivery
ADD COLUMN (Coupon_Id) INT,
ADD CONSTRAINT fk_coupon
FOREIGN KEY (Coupon_Id)
REFERENCES Coupon(Id);

ALTER TABLE Delivery
ADD COLUMN (Status_Delivery_Id) INT,
ADD CONSTRAINT fk_status
FOREIGN KEY (Status_Delivery_Id)
REFERENCES Status_Delivery(Id);

ALTER TABLE Historic_Delivery
ADD COLUMN (Status_Delivery_Id) INT,
ADD CONSTRAINT fk_status
FOREIGN KEY (Status_Delivery_Id)
REFERENCES Status_Delivery(Id);

ALTER TABLE Historic_Delivery
ADD COLUMN (Delivery_Id) INT,
ADD CONSTRAINT fk_Delivery
FOREIGN KEY (Delivery_Id)
REFERENCES Delivery(Id);

ALTER TABLE Rating
ADD COLUMN (Delivery_Id) INT,
ADD CONSTRAINT fk_Delivery
FOREIGN KEY (Delivery_Id)
REFERENCES Delivery(Id);

ALTER TABLE Product_Add
ADD COLUMN (Additional_Id) INT,
ADD CONSTRAINT fk_additional
FOREIGN KEY (Additional_Id)
REFERENCES Additional(Id);

ALTER TABLE Product_Add
ADD COLUMN (Product_Id) INT,
ADD CONSTRAINT fk_product
FOREIGN KEY (Product_Id)
REFERENCES Product(Id);

ALTER TABLE Favorite
ADD COLUMN (User_Id) INT,
ADD CONSTRAINT fk_user
FOREIGN KEY (User_Id)
REFERENCES User(Id);

ALTER TABLE Favorite
ADD COLUMN (Restaurant_Id) INT,
ADD CONSTRAINT fk_restaurant
FOREIGN KEY (Restaurant_Id)
REFERENCES Restaurant(Id);

ALTER TABLE Delivery_Product
ADD COLUMN (Product_Id) INT,
ADD CONSTRAINT fk_product
FOREIGN KEY (Product_Id)
REFERENCES Product(Id);

ALTER TABLE Delivery_Product
ADD COLUMN (Delivery_Id) INT,
ADD CONSTRAINT fk_Delivery
FOREIGN KEY (Delivery_Id)
REFERENCES Delivery(Id);

ALTER TABLE Add_Product_Delivery
ADD COLUMN (Additional_Id) INT,
ADD CONSTRAINT fk_additional
FOREIGN KEY (Additional_Id)
REFERENCES Additional(Id);

ALTER TABLE Add_Product_Delivery
ADD COLUMN (Delivery_Product_Id) INT,
ADD CONSTRAINT fk_delivery_product
FOREIGN KEY (Delivery_Product_Id)
REFERENCES Delivery_Product(Id);

ALTER TABLE Payment
ADD COLUMN (Delivery_Id) INT,
ADD CONSTRAINT fk_Delivery
FOREIGN KEY (Delivery_Id)
REFERENCES Delivery(Id);

ALTER TABLE Payment
ADD COLUMN (Payment_Method_Id) INT,
ADD CONSTRAINT fk_payment_method
FOREIGN KEY (Payment_Method_Id)
REFERENCES Payment_Method(Id);

ALTER TABLE Payment
ADD COLUMN (Stats_Pay_Id) INT,
ADD CONSTRAINT fk_stats_pay
FOREIGN KEY (Stats_Pay_Id)
REFERENCES Stats_Pay(Id);
