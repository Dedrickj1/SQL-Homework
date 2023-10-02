-- Create the Customer table
CREATE TABLE Customer (
    CustomerID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20)
);

-- Create the Movie table
CREATE TABLE Movie (
    MovieID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Genre VARCHAR(50),
    ReleaseDate DATE,
    Director VARCHAR(100),
    Duration INT
);

-- Create the Ticket table
CREATE TABLE Ticket (
    TicketID SERIAL PRIMARY KEY,
    CustomerID INT REFERENCES Customer(CustomerID),
    MovieID INT REFERENCES Movie(MovieID),
    Showtime TIMESTAMP,
    SeatNumber VARCHAR(10),
    Price DECIMAL(10, 2)
);

-- Create the Concession table
CREATE TABLE Concession (
    ConcessionID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Price DECIMAL(10, 2),
    Description TEXT
);

-- Create the junction table for the many-to-many relationship between Ticket and Concession
CREATE TABLE TicketConcession (
    TicketID INT REFERENCES Ticket(TicketID),
    ConcessionID INT REFERENCES Concession(ConcessionID),
    PRIMARY KEY (TicketID, ConcessionID)
);
