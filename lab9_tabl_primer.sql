-- Создание таблиц
CREATE TABLE If NOT EXISTS Customers(
CustomerID SERIAL PRIMARY KEY,
FirstName VARCHAR(100) NOT NULL,
LastNAME VARCHAR(100) NOT NULL,
Email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE If NOT EXISTS Orders(
OrderID SERIAL PRIMARY KEY,
CustomerID INT NOT NULL,
OrderDate TIMESTAMP NOT NULL DEFAULT NOW(),
TotalAmount DECIMAL(10,2) NOT NULL,
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE
);

CREATE TABLE If NOT EXISTS OrderDetails (
OrderDetailID SERIAL PRIMARY KEY,
OrderID INT NOT NULL,
ProductID INT NOT NULL,
Quantity INT NOT NULL CHECK (Quantity > 0),
UnitPrice DECIMAL(10, 2) NOT NULL,
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE);

-- Заполнение таблиц
INSERT INTO Customers (FirstName, LastNAME, Email) VALUES
('Алексей' ,  'Смирнов' ,    ' aleksey.smirnov@example.ru'),
('Мария'   ,  'Иванова' ,    'maria.ivanova@example.ru'),
( 'Николай' ,  'Петров'   ,    'nikolai.petrov@example.ru'),
( 'Екатерина' ,'Васильева' ,   'ekaterina.vasilieva@example.ru')   ,
( 'Андрей' ,   'Кузнецов' ,    'andrey.kuznetsov@example.ru'),
( 'Татьяна' ,  'Соколова' ,    'tatiana.sokolova@example.ru'),
( 'Владимир',  'Федоров'  ,   ' vladimir.fedorov@example.ru'),
( 'Светлана',  'Михайлова' ,   'svetlana.mikhaylova@example.ru'),
( 'Артем' ,    'Николаев' ,    'artem.nikolaev@example.ru'),
( 'Оксана' ,   'Сергеева' ,    'oksana.sergeeva@example.ru'),
( 'Денис' ,    'Орлов'    ,    'denis.orlov@example.ru'),
( 'Ирина' ,    'Лебедева' ,    'irina.lebedeva@example.ru'),
( 'Павел' ,   'Григорьев' ,   'pavel.grigoryev@example.ru'),
( 'Юлия'  ,    'Коваленко',    'yulia.kovalenko@example.ru'),
( 'Максим' ,   'Сидоров'   ,   'maxim.sidorov@example.ru'),
( 'Анастасия', 'Романовская' , 'anastasia.romanovskaya@example.ru'),
( 'Сергей'  ,  'Яковлев' ,     'sergey.yakovlev@example.ru'),
( 'Валентина', 'Кузьмина' ,    'valentina.kuzmina@example.ru'),
( 'Роман'  ,   'Соловьев' ,    'roman.solovyev@example.ru'),
( 'Дарья'  ,   'Фролова'  ,    'darya.frolova@example.ru');

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2024-05-01 10:30:00', 25.00),
(2, '2023-10-02 12:15:00', 30.50),
(3, '2024-11-03 14:45:00', 15.00),
(4, '2023-07-04 09:00:00', 42.75),
(5, '2024-02-05 11:17:00', 22.50),
(6, '2023-01-01 10:13:00', 90.00),
(7, '2024-12-02 12:11:00', 70.50),
(8, '2023-05-03 14:42:00',55.00),
(9, '2024-06-04 09:03:00', 32.75),
(10, '2023-09-05 11:24:00', 12.50),
(11, '2024-10-01 10:35:00', 95.00),
(12, '2023-11-02 12:16:00', 60.50),
(13, '2024-12-03 14:47:00', 75.00),
(14, '2023-02-04 09:08:00', 52.75),
(15, '2024-01-05 11:29:00', 62.50),
(16, '2023-06-01 10:40:00', 45.00),
(17, '2024-08-02 12:55:00', 30.20),
(18, '2023-11-03 14:15:00', 15.90),
(19, '2024-10-04 09:20:00', 47.75),
(20, '2023-06-05 11:30:00', 29.90);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 1, 25.00),
(1, 2, 2, 12.50),
(2, 3, 1, 30.50),
(2, 4, 1, 30.50),
(3, 1, 1, 15.00),
(3, 5, 1, 15.00),
(4, 2, 1, 42.75),
(4, 3, 1, 42.75),
(5, 4, 1, 22.50),
(5, 5, 1, 22.50),
(6, 1, 3, 30.00),
(6, 2, 1, 60.00),
(7, 3, 2, 35.25),
(7, 4, 1, 35.25),
(8, 5, 1, 55.00),
(9, 1, 1, 32.75),
(10, 2, 1, 12.50),
(11, 3, 1, 95.00),
(12, 4, 1, 60.50),
(13, 5, 1, 75.00),
(14, 1, 1, 52.75);
