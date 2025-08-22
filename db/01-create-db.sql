-- DB
CREATE DATABASE cvauction;
GO
USE cvauction;
GO

-- Create Admin table
CREATE TABLE Admin (
    aid INT IDENTITY(1,1) PRIMARY KEY,
    aname VARCHAR(100) NOT NULL,
    apwd VARCHAR(255) NOT NULL,
    aemail VARCHAR(150) NOT NULL UNIQUE,
    role VARCHAR(150) DEFAULT 'admin'
);
GO

-- Create Users table
CREATE TABLE Users (
    uid INT IDENTITY PRIMARY KEY,
    ufirstName VARCHAR(100) NOT NULL,
    ulastName VARCHAR(50) NOT NULL,
    uname VARCHAR(100) NOT NULL,
    role VARCHAR(20) NOT NULL CHECK (role IN ('Admin', 'Customer', 'Seller')),
    upwd VARCHAR(255) NOT NULL,
    uemail VARCHAR(150) NOT NULL UNIQUE,
    mob_no VARCHAR(15) NOT NULL,
    pan_card CHAR(10) NOT NULL,
    address VARCHAR(255),
    bank_acc_no VARCHAR(20),
    bankname VARCHAR(100),
    bank_branch VARCHAR(100),
    account_holder_name VARCHAR(100),
    ifsc_code VARCHAR(20),
    access_status VARCHAR(10) DEFAULT 'Active' CHECK (access_status IN ('Active', 'Inactive'))
);
GO

-- Create All_Vehicles_Details table
CREATE TABLE All_Vehicles_Details (
    vehicleid INT IDENTITY(1,1) PRIMARY KEY,
    reg_no VARCHAR(20) NOT NULL UNIQUE,
    reg_year INT NOT NULL,
    manufac_name VARCHAR(50) NOT NULL,
    model_name VARCHAR(50) NOT NULL,
    fuel_type VARCHAR(10) CHECK (fuel_type IN ('Petrol', 'Diesel', 'CNG')),
    insurance VARCHAR(50),
    km_driven INT,
    RTO_passing VARCHAR(50),
    year_of_manufacturing INT NOT NULL,
    parking_location VARCHAR(50),
    imgUrls VARCHAR(1500),
    pdfReportUrl VARCHAR(400)
);
GO

-- Create Host_Auction table
CREATE TABLE Host_Auction (
    auctionid INT IDENTITY(1,1) PRIMARY KEY,
    vehicleid INT,
    base_price DECIMAL(10,2) NOT NULL,
    auction_start DATETIME NOT NULL,
    auction_end DATETIME NOT NULL,
    removeSchedule BIT,
    startAuction BIT,
    FOREIGN KEY (vehicleid) REFERENCES All_Vehicles_Details(vehicleid)
);
GO

-- Create Current_Auction table
CREATE TABLE Current_Auction (
    vehicleid INT,
    auctionid INT,
    base_price DECIMAL(10,2) NOT NULL,
    highest_bid DECIMAL(10,2),
    auction_start DATETIME NOT NULL,
    auction_end DATETIME NOT NULL,
    PRIMARY KEY (vehicleid, auctionid),
    FOREIGN KEY (vehicleid) REFERENCES All_Vehicles_Details(vehicleid),
    FOREIGN KEY (auctionid) REFERENCES Host_Auction(auctionid)
);
GO

-- Create Deposit_Payment table
CREATE TABLE Deposit_Payment (
    payment_no INT IDENTITY(1,1) PRIMARY KEY,
    uid INT,
    transactionTime DATETIME,
    amt DECIMAL(10, 2) NOT NULL,
    paymentId VARCHAR(50),
    orderId VARCHAR(50),
    planType VARCHAR(40) CHECK (planType IN ('BASIC', 'PREMIUM')),
    FOREIGN KEY (uid) REFERENCES Users(uid)
);
GO

-- Create Allowed_User table
CREATE TABLE Allowed_User (
    uid INT PRIMARY KEY,
    payment_no INT,
    auction_access_left INT NOT NULL,
    FOREIGN KEY (payment_no) REFERENCES Deposit_Payment(payment_no),
    FOREIGN KEY (uid) REFERENCES Users(uid)
);
GO

-- Create Auction_Status_Track table
CREATE TABLE Auction_Status_Track (
    allowed_user_uid INT NOT NULL,
    vehicleid INT NOT NULL,
    auctionid INT NOT NULL,
    user_bid_left INT NOT NULL,
    price_offered DECIMAL(10,2) NOT NULL,
    highest_bidder INT DEFAULT 0,
    auction_end BIT DEFAULT 0,
    PRIMARY KEY (allowed_user_uid, vehicleid, auctionid),
    FOREIGN KEY (allowed_user_uid) REFERENCES Allowed_User(uid),
    FOREIGN KEY (vehicleid, auctionid) REFERENCES Current_Auction(vehicleid, auctionid)
);
GO

-- Create WinnerTable
CREATE TABLE WinnerTable (
    allowed_user_uid INT,
    vehicleId INT,
    auctionId INT,
    amountPending INT,
    auctionEndDate DATETIME,
    PRIMARY KEY (allowed_user_uid, vehicleId, auctionId),
    FOREIGN KEY (allowed_user_uid, vehicleId, auctionId)
        REFERENCES Auction_Status_Track(allowed_user_uid, vehicleid, auctionid)
);
GO

-- Create Payment_Transaction table
CREATE TABLE Payment_Transaction (
    transaction_id INT IDENTITY(1,1) PRIMARY KEY,
    uid INT,
    transaction_date DATE NOT NULL,
    amt DECIMAL(10, 2) NOT NULL,
    utr_no VARCHAR(50) NOT NULL UNIQUE,
    FOREIGN KEY (uid) REFERENCES Users(uid)
);
GO

-- Create Approvals table
CREATE TABLE Approvals (
    allowed_user_uid INT,
    vehicleid INT,
    auctionid INT,
    vehicleName VARCHAR(100) NOT NULL,
    bidAmt DECIMAL(10,2) NOT NULL,
    winnerId INT,
    approval_status VARCHAR(20) DEFAULT 'Pending' CHECK (approval_status IN ('Pending', 'Approved')),
    approval_date DATETIME DEFAULT GETDATE(),
    PRIMARY KEY (allowed_user_uid, vehicleid, auctionid),
    FOREIGN KEY (allowed_user_uid, vehicleid, auctionid)
        REFERENCES WinnerTable(allowed_user_uid, vehicleId, auctionId)
);
GO
