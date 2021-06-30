
CREATE TABLE Account (
  Username varchar(15) NOT NULL,
  Password varchar(20) NOT NULL,
  Email_Id varchar(35) NOT NULL,
  Address varchar(50) DEFAULT NULL,
  PRIMARY KEY (Username)
);

INSERT ALL
    INTO Account VALUES ('mark','plier123','markplier@gmail.com','Jahangirpuri,India')
    INTO Account VALUES ('david','salmon123','david@gmail.com','Adarsh Nagar,India')
    INTO Account VALUES ('amy','santiago123','amy@gnail.com','Azad Pur,India')
    INTO Account VALUES ('terry','crews1234','terry@gmail.com','Model Town, India')
    INTO Account VALUES ('raymond','holt1234','raymond@gmail.com','GTB Nagar,India')
    INTO Account VALUES ('jack','peralta123','jack@gmail.com','Civil Lines, India')
    INTO Account VALUES ('srikant','familyman123','srikant@gmail.com','Delhi Main, India')
SELECT * FROM dual;

CREATE TABLE Contact (
  Username varchar(15) NOT NULL,
  Phone_No varchar(10) NOT NULL,
  PRIMARY KEY (Username,Phone_No),
  FOREIGN KEY (Username) REFERENCES Account (Username)
);

INSERT ALL
 INTO Contact VALUES ('mark','8899887766')
 INTO Contact VALUES('david','9876543210')
 INTO Contact VALUES('amy','7071475390')
 INTO Contact VALUES('terry','8009224040')
 INTO Contact VALUES('raymond','7411452250')
 INTO Contact VALUES('jack','9650367698')
 INTO Contact VALUES('srikant','9968254144')
SELECT * FROM dual;

CREATE TABLE Passenger (
  Passenger_Id int NOT NULL,
  First_Name varchar(20) NOT NULL,
  Last_Name varchar(20) NOT NULL,
  Gender char(1) NOT NULL,
  Phone_No char(10) DEFAULT NULL,
  Ticket_No int NOT NULL,
  Age int NOT NULL,
  Class varchar(20) NOT NULL,
  PRIMARY KEY (Passenger_Id,Ticket_No)
);

INSERT ALL
    INTO Passenger VALUES(101,'Harry','Howard','M','9898989310',10001,25,'economy')
    INTO Passenger VALUES(102,'Louis','Torres','M','7898989310',10002,34,'executive')
    INTO Passenger VALUES(103,'Peter','Thompson','M','3398989310',10003,42,'general')
    INTO Passenger VALUES(104,'Sean','Ramirez','F','4898989310',10004,26,'executive')
    INTO Passenger VALUES(105,'Ernest','Lee','M','5898989310',10005,18,'economy')
    INTO Passenger VALUES(106,'Todd','Jones','M','7898989510',10006,46,'business')
    INTO Passenger VALUES(107,'Harold','Bryant','M','5898989310',10007,34,'economy')
    INTO Passenger VALUES(108,'Fred','Riveria','M','2898989310',10008,19,'economy')
    INTO Passenger VALUES(109,'Kathy','Edwards','F','6898989310',10009,20,'executive')
    INTO Passenger VALUES(110,'Allen','Walker','M','7898989310',10010,29,'general')
    INTO Passenger VALUES(111,'Ashley','Lee','F','1898939313',10011,54,'business')
SELECT * FROM dual;



CREATE TABLE Station (
  Station_Code char(5) NOT NULL,
  Station_Name varchar(25) NOT NULL,
  PRIMARY KEY (Station_Code)
);

INSERT ALL
    INTO Station VALUES('JAH','Jahangirpuri')
    INTO Station VALUES('ADN','Adarsh Nagar')
    INTO Station VALUES('AZP','Azad Pur')
    INTO Station VALUES('MOT','Model Town')
    INTO Station VALUES('GTB','GTB Nagar')
    INTO Station VALUES('CIL','Civil Lines')
    INTO Station VALUES('DEM','Delhi Main')
SELECT * FROM dual;

CREATE TABLE Metro (
  Metro_No varchar(6) NOT NULL,
  Metro_Name varchar(25) NOT NULL,
  Seat_General int NOT NULL,
  Seat_Economy int NOT NULL,
  Seat_Executive int NOT NULL,
  Seat_Business int NOT NULL,
  Wifi char(1) NOT NULL,
  Run_On_Sunday char(1) NOT NULL,
  Run_On_Monday char(1) NOT NULL,
  Run_On_Tuesday char(1) NOT NULL,
  Run_On_Wednesday char(1) NOT NULL,
  Run_On_Thursday char(1) NOT NULL,
  Run_On_Friday char(1) NOT NULL,
  Run_On_Saturday char(1) NOT NULL,
  PRIMARY KEY (Metro_No)
);

INSERT ALL 
    INTO Metro VALUES ('RI01D','Red Line',479,47,96,192,'N','Y','Y','Y','Y','Y','Y','Y')
    INTO Metro VALUES ('YO02N','Yellow Line',480,43,96,192,'N','Y','Y','Y','Y','Y','Y','Y')
    INTO Metro VALUES ('BI03D','Blue Line',432,48,80,144,'N','N','Y','Y','Y','Y','Y','Y')
    INTO Metro VALUES ('GO04D','Green Line',432,48,80,144,'N','N','Y','Y','Y','Y','Y','Y')
SELECT * FROM dual;

CREATE TABLE Ticket (
  Ticket_No int NOT NULL,
  Coach varchar(10) NOT NULL,
  Metro_No VARCHAR(6) NOT NULL,
  Date_of_Journey date NOT NULL,
  Username varchar(15) NOT NULL,
  PRIMARY KEY (Ticket_No),
  FOREIGN KEY (Username) REFERENCES Account (Username),
  FOREIGN KEY (Metro_No) REFERENCES Metro (Metro_No)
);

INSERT ALL
    INTO Ticket VALUES('10001','EC-1','RI01D','5-JAN-2021','mark')
    INTO Ticket VALUES('10002','EX-1','RI01D','5-JAN-2021','amy')
    INTO Ticket VALUES('10003','GE-1','GO04D','5-JAN-2021','david')
    INTO Ticket VALUES('10004','EX-1','RI01D','5-JAN-2021','srikant')
    INTO Ticket VALUES('10005','EC-1','RI01D','5-JAN-2021','jack')
    INTO Ticket VALUES('10006','B-1','YO02N','6-JAN-2021','raymond')
    INTO Ticket VALUES('10007','EC-1','YO02N','6-JAN-2021','terry')
    INTO Ticket VALUES('10008','EC-1','GO04D','6-JAN-2021','david')
    INTO Ticket VALUES('10009','EX-1','GO04D','7-JAN-2021','mark')
    INTO Ticket VALUES('10010','G-1','BI03D','7-JAN-2021','mark')
    INTO Ticket VALUES('10011','B-1','BI03D','7-JAN-2021 ','mark')
SELECT * FROM dual;

CREATE TABLE Stoppage (
  Metro_No VARCHAR(6) NOT NULL,
  Station_Code char(5) NOT NULL,
  Arrival_Time timestamp(0),
  Departure_Time timestamp(0),
  PRIMARY KEY (Metro_No,Station_Code),
  FOREIGN KEY (Metro_No) REFERENCES Metro (Metro_No),
  FOREIGN KEY (Station_Code) REFERENCES Station (Station_Code)
);


INSERT ALL 
    INTO Stoppage VALUES ('RI01D','JAH','05-JAN-2021 12:05:00 AM','05-JAN-2021 12:30:00 AM')
    INTO Stoppage VALUES ('RI01D','ADN','05-JAN-2021 01:30:00 AM','05-JAN-2021 01:38:00 AM')
    INTO Stoppage VALUES ('RI01D','AZP','05-JAN-2021 09:20:00 AM','05-JAN-2021 09:30:00 AM')
    INTO Stoppage VALUES ('RI01D','MOT','05-JAN-2021 08:10:00 AM',NULL)
    INTO Stoppage VALUES ('YO02N','JAH','6-JAN-2021 03:45:00 PM',' 6-JAN-2021 04:10:00 PM')
    INTO Stoppage VALUES ('YO02N','ADN','6-JAN-2021 01:00:00 AM','6-JAN-2021 01:05:00 AM')
    INTO Stoppage VALUES ('YO02N','AZP','6-JAN-2021 07:00:00 AM',NULL)
    INTO Stoppage VALUES ('YO02N','MOT','6-JAN-2021 08:35:00 AM','6-JAN-2021 08:55:00 AM')
    INTO Stoppage VALUES ('BI03D','JAH','7-JAN-2021 01:20:00 AM','7-JAN-2021 01:45:00 AM')
    INTO Stoppage VALUES ('BI03D','ADN','7-JAN-2021 04:15:00 AM','7-JAN-2021 04:20:00 AM')
    INTO Stoppage VALUES ('BI03D','GTB','7-JAN-2021 03:31:00 AM','7-JAN-2021 03:33:00 AM')
    INTO Stoppage VALUES ('BI03D','CIL','7-JAN-2021 11:30:00 AM','7-JAN-2021 11:32:00 AM')
    INTO Stoppage VALUES ('BI03D','AZP','05-JAN-2021 02:20:00 AM','05-JAN-2021 02:30:00 AM')
    INTO Stoppage VALUES ('BI03D','MOT','05-JAN-2021 02:20:00 AM',NULL)
    INTO Stoppage VALUES ('GO04D','DEM','6-JAN-2021 07:45:00 AM','6-JAN-2021 08:15:00 AM')
    INTO Stoppage VALUES ('GO04D','ADN','6-JAN-2021 04:55:00 AM','6-JAN-2021 05:00:00 AM')
    INTO Stoppage VALUES ('GO04D','GTB','6-JAN-2021 09:21:00 AM','6-JAN-2021 09:23:00')
    INTO Stoppage VALUES ('GO04D','CIL','6-JAN-2021 03:03:00 AM','6-JAN-2021 03:05:00')
    INTO Stoppage VALUES ('GO04D','AZP','6-JAN-2021 11:20:00 AM',NULL)
    INTO Stoppage VALUES ('GO04D','MOT','6-JAN-2021 02:15:00 AM','6-JAN-2021 02:25:00 AM')
SELECT * FROM dual;