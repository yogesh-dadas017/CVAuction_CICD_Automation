USE cvauction;
GO

INSERT INTO Admin (aname, apwd, aemail)
VALUES
('Alice Admin', 'admin123', 'alice@cvauction.com'),
('Bob Admin', 'admin456', 'bob@cvauction.com'),
('Charlie Admin', 'admin789', 'charlie@cvauction.com'),
('Diana Admin', 'admin999', 'diana@cvauction.com');
GO

INSERT INTO Users (ufirstName, ulastName, uname, role, upwd, uemail, mob_no, pan_card, address)
VALUES
('John', 'Doe', 'johndoe', 'Customer', 'pass123', 'john@example.com', '9999999999', 'ABCDE1234F', '123 Main St'),
('Jane', 'Smith', 'janesmith', 'Seller', 'pass456', 'jane@example.com', '8888888888', 'FGHIJ5678K', '456 Oak St'),
('Sam', 'Wilson', 'samwilson', 'Customer', 'pass789', 'sam@example.com', '7777777777', 'KLMNO9012P', '789 Pine St'),
('Anna', 'Taylor', 'annataylor', 'Seller', 'pass999', 'anna@example.com', '6666666666', 'QRSTU3456V', '321 Birch St');
GO

INSERT INTO All_Vehicles_Details (reg_no, reg_year, manufac_name, model_name, fuel_type, insurance, km_driven, RTO_passing, year_of_manufacturing, parking_location)
VALUES
('MH12AB1234', 2020, 'Toyota', 'Innova', 'Diesel', 'Comprehensive', 45000, 'Pune', 2020, 'Pune Yard'),
('DL8CAF5678', 2019, 'Honda', 'City', 'Petrol', 'Third Party', 60000, 'Delhi', 2019, 'Delhi Lot'),
('KA03ZZ1111', 2021, 'Hyundai', 'Creta', 'CNG', 'Comprehensive', 15000, 'Bangalore', 2021, 'BLR Garage'),
('TN09XY2222', 2018, 'Ford', 'EcoSport', 'Petrol', 'None', 70000, 'Chennai', 2018, 'Chennai Hub');
GO

INSERT INTO Host_Auction (vehicleid, base_price, auction_start, auction_end, removeSchedule, startAuction)
VALUES
(1, 500000, GETDATE(), DATEADD(DAY, 1, GETDATE()), 0, 1),
(2, 400000, GETDATE(), DATEADD(DAY, 1, GETDATE()), 0, 1),
(3, 600000, GETDATE(), DATEADD(DAY, 1, GETDATE()), 0, 1),
(4, 350000, GETDATE(), DATEADD(DAY, 1, GETDATE()), 0, 1);
GO

INSERT INTO Current_Auction (vehicleid, auctionid, base_price, highest_bid, auction_start, auction_end)
VALUES
(1, 1, 500000, 520000, GETDATE(), DATEADD(DAY, 1, GETDATE())),
(2, 2, 400000, 410000, GETDATE(), DATEADD(DAY, 1, GETDATE())),
(3, 3, 600000, 615000, GETDATE(), DATEADD(DAY, 1, GETDATE())),
(4, 4, 350000, 355000, GETDATE(), DATEADD(DAY, 1, GETDATE()));
GO

INSERT INTO Deposit_Payment (uid, transactionTime, amt, paymentId, orderId, planType)
VALUES
(1, GETDATE(), 1000, 'pay_1', 'ord_1', 'BASIC'),
(2, GETDATE(), 2000, 'pay_2', 'ord_2', 'PREMIUM'),
(3, GETDATE(), 1500, 'pay_3', 'ord_3', 'BASIC'),
(4, GETDATE(), 2500, 'pay_4', 'ord_4', 'PREMIUM');
GO

INSERT INTO Allowed_User (uid, payment_no, auction_access_left)
VALUES
(1, 1, 3),
(2, 2, 5),
(3, 3, 4),
(4, 4, 6);
GO

INSERT INTO Auction_Status_Track (allowed_user_uid, vehicleid, auctionid, user_bid_left, price_offered)
VALUES
(1, 1, 1, 5, 510000),
(2, 2, 2, 4, 405000),
(3, 3, 3, 6, 610000),
(4, 4, 4, 5, 360000);
GO

INSERT INTO WinnerTable (allowed_user_uid, vehicleId, auctionId, amountPending, auctionEndDate)
VALUES
(1, 1, 1, 20000, DATEADD(DAY, 1, GETDATE())),
(2, 2, 2, 15000, DATEADD(DAY, 1, GETDATE())),
(3, 3, 3, 18000, DATEADD(DAY, 1, GETDATE())),
(4, 4, 4, 10000, DATEADD(DAY, 1, GETDATE()));
GO

INSERT INTO Payment_Transaction (uid, transaction_date, amt, utr_no)
VALUES
(1, GETDATE(), 510000, 'utr0001'),
(2, GETDATE(), 405000, 'utr0002'),
(3, GETDATE(), 610000, 'utr0003'),
(4, GETDATE(), 360000, 'utr0004');
GO

INSERT INTO Approvals (allowed_user_uid, vehicleid, auctionid, vehicleName, bidAmt, winnerId)
VALUES
(1, 1, 1, 'Toyota Innova', 510000, 1),
(2, 2, 2, 'Honda City', 405000, 2),
(3, 3, 3, 'Hyundai Creta', 610000, 3),
(4, 4, 4, 'Ford EcoSport', 360000, 4);
GO
