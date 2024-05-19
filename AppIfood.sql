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

/* Inserindo Dados */

INSERT INTO User (Date_created, Status, Name, Email, Password, Phone, Cpf)
VALUES 
    (NOW(), 1, 'João Silva', 'joao@example.com', 'senha123', '12345678901', '12345678901'),
    (NOW(), 1, 'Maria Oliveira', 'maria@example.com', 'senha456', '98765432109', '98765432109'),
    (NOW(), 1, 'Carlos Souza', 'carlos@example.com', 'senha789', '45612378905', '45612378905');

/* Inserindo 3 registros na tabela 'Category_Restaurant' */
INSERT INTO Category_Restaurant (Date_created, Status, Name, Description)
VALUES 
    (NOW(), 1, 'Italiana', 'Cozinha italiana autêntica'),
    (NOW(), 1, 'Chinesa', 'Cozinha chinesa tradicional'),
    (NOW(), 1, 'Mexicana', 'Culinária mexicana');

/* Inserindo 3 registros na tabela 'Restaurant' */
INSERT INTO Restaurant (Date_created, Status, Name, Description, Phone, Rate, Cnpj)
VALUES 
    (NOW(), 1, 'Paraíso da Pizza', 'Pizzaria com pizzas tradicionais italianas', '1234567890', 4, '12345678901234'),
    (NOW(), 1, 'Dragão Oriental', 'Restaurante chinês com pratos autênticos', '9876543210', 4, '98765432109876'),
    (NOW(), 1, 'Taco Legal', 'Os melhores tacos da cidade', '4561237890', 4, '45612378901234');

/* Inserindo 3 registros na tabela 'Operation' */
INSERT INTO Operation (Date_created, Status, Day, Opening_Time, Closing_Time)
VALUES 
    (NOW(), 1, 1, '08:00:00', '22:00:00'),
    (NOW(), 1, 2, '10:00:00', '20:00:00'),
    (NOW(), 1, 3, '09:00:00', '21:00:00');

/* Inserindo 3 registros na tabela 'Address' */
INSERT INTO Address (Date_created, Status, Street, District, City, Zip_Code, Number, Complement)
VALUES 
    (NOW(), 1, 'Rua Principal', 'Centro', 'Cidade A', '12345-678', 10, 'Apto 101'),
    (NOW(), 1, 'Rua das Flores', 'Bairro X', 'Cidade B', '98765-432', 20, NULL),
    (NOW(), 1, 'Avenida Central', 'Bairro Y', 'Cidade C', '54321-876', 30, NULL);

/* Inserindo 3 registros na tabela 'Category_Product' */
INSERT INTO Category_Product (Date_created, Status, Name, Description)
VALUES 
    (NOW(), 1, 'Entradas', 'Pequenos pratos servidos antes do prato principal'),
    (NOW(), 1, 'Prato Principal', 'O prato principal de uma refeição'),
    (NOW(), 1, 'Sobremesas', 'Doces para finalizar uma refeição');

/* Inserindo 3 registros na tabela 'Product' */
INSERT INTO Product (Date_created, Status, Name, Price, Description)
VALUES 
    (NOW(), 1, 'Bruschetta', 8, 'Pão italiano torrado em azeite de oliva'),
    (NOW(), 1, 'Espaguete à Carbonara', 15, 'Espaguete com ovo, queijo, pancetta e pimenta preta'),
    (NOW(), 1, 'Tiramisu', 10, 'Sobremesa italiana com sabor de café');

/* Inserindo 3 registros na tabela 'Additional' */
INSERT INTO Additional (Date_created, Status, Name, Price, Description)
VALUES 
    (NOW(), 1, 'Queijo Extra', 2, 'Cobertura extra de queijo'),
    (NOW(), 1, 'Guacamole', 3, 'Molho ou pasta de abacate'),
    (NOW(), 1, 'Creme de Leite', 1, 'Produto lácteo frequentemente usado como cobertura');

/* Inserindo 3 registros na tabela 'Coupon' */
INSERT INTO Coupon (Date_created, Status, Code, Value, Description, Validity)
VALUES 
    (NOW(), 1, 'DESC10', 10, 'Desconto de $10 em seu próximo pedido', 30),
    (NOW(), 1, 'FRETEGRATIS', 0, 'Frete grátis em pedidos acima de $50', 30),
    (NOW(), 1, 'DESC20', 20, 'Receba 20% de desconto em itens selecionados', 30);

/* Inserindo 3 registros na tabela 'Status_Delivery' */
INSERT INTO Status_Delivery (Date_created, Status, Name, Description)
VALUES 
    (NOW(), 1, 'Pendente', 'O pedido está pendente de processamento'),
    (NOW(), 1, 'Em Andamento', 'O pedido está sendo preparado'),
    (NOW(), 1, 'Em Entrega', 'O pedido está a caminho da entrega');

/* Inserindo 3 registros na tabela 'Delivery' */
INSERT INTO Delivery (Date_created, Status, Delivery_Fee, Amount, Description, Is_Removal)
VALUES 
    (NOW(), 1, 5, 30, 'Entrega no endereço residencial', 0),
    (NOW(), 1, 3, 20, 'Entrega no endereço de trabalho', 0),
    (NOW(), 1, 4, 25, 'Entrega no endereço comercial', 0);

/* Inserindo 3 registros na tabela 'Historic_Delivery' */
INSERT INTO Historic_Delivery (Date_created, Status)
VALUES 
    (NOW(), 1),
    (NOW(), 1),
    (NOW(), 1);

/* Inserindo 3 registros na tabela 'Rating' */
INSERT INTO Rating (Date_created, Status, Delivery_Rate, Description)
VALUES 
    (NOW(), 1, 5, 'Excelente serviço!'),
    (NOW(), 1, 4, 'Bom tempo de entrega'),
    (NOW(), 1, 3, 'Experiência média');

/* Inserindo 3 registros na tabela 'Product_Add' */
INSERT INTO Product_Add
VALUES (1, 1), (1, 2), (1, 3);

/* Inserindo 3 registros na tabela 'Favorite' */
INSERT INTO Favorite
VALUES (1, 1), (1, 2), (2, 3);

/* Inserindo 3 registros na tabela 'Delivery_Product' */
INSERT INTO Delivery_Product (Id) VALUES (1), (2), (3);

/* Inserindo 3 registros na tabela 'Add_Product_Delivery' */
INSERT INTO Add_Product_Delivery (Date_created, Status, Amount)
VALUES 
    (NOW(), 1, 2),
    (NOW(), 1, 3),
    (NOW(), 1, 1);

/* Inserindo 3 registros na tabela 'Payment_Method' */
INSERT INTO Payment_Method (Date_created, Status, Name, Description)
VALUES 
    (NOW(), 1, 'Cartão de Crédito', 'Pagamento com cartão de crédito'),
    (NOW(), 1, 'Dinheiro', 'Pagamento em dinheiro na entrega'),
    (NOW(), 1, 'Pix', 'Pagamento instantâneo usando o sistema Pix');

/* Inserindo 3 registros na tabela 'Stats_Pay' */
INSERT INTO Stats_Pay (Date_created, Status, Name, Description)
VALUES 
    (NOW(), 1, 'Aprovado', 'Pagamento aprovado com sucesso'),
    (NOW(), 1, 'Pendente', 'Pagamento aguardando aprovação'),
    (NOW(), 1, 'Rejeitado', 'Pagamento rejeitado');

/* Inserindo 3 registros na tabela 'Payment' */
INSERT INTO Payment (Date_created, Status, Price, Date_Hour)
VALUES 
    (NOW(), 1, 50, UNIX_TIMESTAMP(NOW())),
    (NOW(), 1, 30, UNIX_TIMESTAMP(NOW())),
    (NOW(), 1, 25, UNIX_TIMESTAMP(NOW()));
