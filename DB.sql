CREATE DATABASE GameStoreDB;
GO

USE GameStoreDB;
GO


CREATE TABLE Users
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(50) NOT NULL UNIQUE,
    Password NVARCHAR(50) NOT NULL
);
GO


CREATE TABLE Games
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(100) NOT NULL,
    Genre NVARCHAR(50) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);
GO


CREATE TABLE Orders
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    UserId INT NOT NULL,
    TotalPrice DECIMAL(10,2) NOT NULL,
    OrderDate DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (UserId) REFERENCES Users(Id)
);
GO


CREATE TABLE OrderItems
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    OrderId INT NOT NULL,
    GameId INT NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (OrderId) REFERENCES Orders(Id),
    FOREIGN KEY (GameId) REFERENCES Games(Id)
);
GO


INSERT INTO Users (Username, Password)
VALUES 
('admin', 'admin'),
('user1', '1234'),
('user2', 'pass');
GO


INSERT INTO Games (Title, Genre, Price)
VALUES
('The Witcher 3', 'RPG', 39.99),
('Cyberpunk 2077', 'RPG', 59.99),
('Minecraft', 'Sandbox', 26.95),
('Ultrakill', 'Shooter', 49.99),
('Among Us', 'Party', 4.99);
GO