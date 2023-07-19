CREATE DATABASE APU_EBook_store;
USE APU_EBook_store;

CREATE TABLE Publisher
(PublisherID nvarchar(50) PRIMARY KEY,
Name nvarchar(50) NOT NULL, 
Address nvarchar(50) NOT NULL,
ContactNumber int);

CREATE TABLE Manager
(ManagerID nvarchar(50) PRIMARY KEY,
Name nvarchar(50) NOT NULL, 
Address nvarchar(50) NOT NULL,
PublisherID nvarchar(50) FOREIGN KEY REFERENCES Publisher(PublisherID));

CREATE TABLE Book
(BookID nvarchar(50) PRIMARY KEY,
Name nvarchar (50), 
Author nvarchar(50), 
Genre nvarchar (50),
Price decimal(10,2), 
Quantity int,
PublishedDate Date,
SerialNo nvarchar(50),
PublisherID nvarchar(50) FOREIGN KEY REFERENCES Publisher(PublisherID));

CREATE TABLE ManagerOrder
(ManagerOrderID nvarchar (50) PRIMARY KEY,
OrderQuantity int, 
OrderDate date, 
TotalPrice decimal(10,2),
ManagerID nvarchar(50) FOREIGN KEY REFERENCES Manager(ManagerID),
BookID nvarchar (50) FOREIGN KEY REFERENCES Book(BookID));

CREATE TABLE Member
(MemberID nvarchar(50) PRIMARY KEY,
Name nvarchar(50) NOT NULL, 
Gender nvarchar(50), 
Email nvarchar (50),
Address nvarchar(50) NOT NULL, ContactNumber int);

CREATE TABLE ShoppingCart
(ShoppingCartID nvarchar(50) PRIMARY KEY,
OrderDate Date, 
OrderTime Time,
MemberID nvarchar (50) FOREIGN KEY REFERENCES Member(MemberID),
BookID nvarchar (50) FOREIGN KEY REFERENCES Book(BookID));

CREATE TABLE MemberOrderDetails
(MemberOrderDetailsID nvarchar(50) PRIMARY KEY,
Quantity int, 
TotalPrice decimal (10,2),
PaymentStatus nvarchar(50),
ShoppingCartID nvarchar (50) FOREIGN KEY REFERENCES ShoppingCart(ShoppingCartID),
MemberID nvarchar (50) FOREIGN KEY REFERENCES Member(MemberID));

CREATE TABLE Feedback
(FeedbackID nvarchar(50) PRIMARY KEY,
Comments nvarchar(100) NOT NULL,
Rating int,
MemberID nvarchar (50) FOREIGN KEY REFERENCES Member(MemberID),
BookID nvarchar (50) FOREIGN KEY REFERENCES Book(BookID));

CREATE TABLE DeliveryDetails
(DeliveryDetailsID nvarchar(50) PRIMARY KEY,
Address nvarchar(50) NOT NULL,
ContactNumber int,
ShoppingCartID nvarchar (50) FOREIGN KEY REFERENCES ShoppingCart(ShoppingCartID),
MemberOrderDetailsID nvarchar (50) FOREIGN KEY REFERENCES MemberOrderDetails(MemberOrderDetailsID));

CREATE TABLE Invoice
(InvoiceID nvarchar(50) PRIMARY KEY,
InvoiceDate Date, 
TotalAmount decimal (10,2),
MemberOrderDetailsID nvarchar(50) FOREIGN KEY REFERENCES MemberOrderDetails(MemberOrderDetailsID));

CREATE TABLE DeliveryStatus
(DeliveryStatusID nvarchar(50) PRIMARY KEY,
 Transportation nvarchar(50), 
 DeliveryDate Date,
 StatusOfDelivery nvarchar(50),
 DeliveryDetailsID nvarchar(50) FOREIGN KEY REFERENCES DeliveryDetails(DeliveryDetailsID));

 INSERT INTO Publisher VALUES
('P01','Penguin', 'Penang', '1178972653'),
('P02','HarperOne', 'Melaka', '0437778880'),
('P03','KUBE', 'Johor', '0672221116'),
('P04','Noura Books', 'Petaling Jaya', '0381681677'),
('P05','lonely planet', 'Sepang', '1187997766'),
('P06', 'MegaBooks', 'Kuala Lumpur', '01176849902'),
('P07', 'MPH', 'Putrajaya', '1154664382');

INSERT INTO Manager VALUES
('M01','Arya', 'Bukit Jalil', 'P01'),
('M02','Layla', 'Shah Alam','P05' ),
('M03','Lee Zi Jia', 'Puchong','P04'),
('M04','Anessa', 'Petaling Jaya','P03'),
('M05','Adam', 'Kota Damansara','P02'),
('M06','Kevin', 'Petaling Jaya','P06');

INSERT INTO Book VALUES
('B01', 'The Man Burned by Winter', 'Pete Zacharias', 'Thriller, Police procedural', '48.00', 170, 'June 1, 2022', 'U011', 'P06'), 
('B02', 'Reminders of Him', 'Colleen Hoover', 'Romance novel', '35.00', 60, 'January 18, 2022', 'U022', 'P02'), 
('B03', 'The Count of Monte Cristo', 'Alexandre Dumas','Adventure fiction', '79.00', 70, 'June 1, 2022', 'U033', 'P04'), 
('B04', 'Things We Never Got Over', 'Lucy Score', 'Contemporary romance', '25.00', 85, 'January 13, 2022', 'U044', 'P03'), 
('B05', 'The Secret Witness', 'Victor Methos', 'Legal thriller', '50.00', 200, 'July 1, 2022', 'U055', 'P07'), 
('B06', 'The Seven Husbands of Evelyn Hugo', 'Taylor Jenkins Reid', 'Psychological Fiction', '69.00',90, 'June 13, 2017', 'U066', 'P05'), 
('B07', 'An Unreliable Truth ', 'Victor Methos', 'Suspense', '85.00', 150, 'August 17, 2021', 'U077', 'P01'); 

INSERT INTO ManagerOrder VALUES
('X01',170, '11 Jan 2022',8160.00,'M01','B01' ),
('X02',60,'29 Jan 2022' ,2100.00,'M02', 'B02' ),
('X03',90,'17 Mar 2022' ,6210.00,'M02','B06'),
('X04',150,'14 Apr 2022' ,12750.00,'M03','B07'),
('X05',85,'20 Feb 2022', 2125.00,'M04','B04' ),
('X06',70,'07 Feb 2022',5530.00, 'M05','B03'),
('X07',200,'07 Mar 2022' ,10000.00,'M06','B05' );

INSERT INTO Member VALUES
('C01', 'Luna', 'Female', 'Luna@gmail.com', 'Bukit Jalil', 0123174408),
('C02', 'Milo', 'Male', 'Milo@gmail.com', 'Subang', 01590843356),
('C03', 'Ava', 'Female', 'Ava@gmail.com', 'Puchong', 01345683305),
('C04', 'Liam', 'Male', 'Liam@gmail.com', 'Kuala Lumpur', 01458645502),
('C05', 'Harry', 'Male', 'Harry@gmail.com', 'Cyberjaya', 01584939401),
('C06', 'Lily', 'Female', 'Lily@gmail.com', 'Putrajaya', 01456892205),
('C07', 'Rose', 'Female', 'Rose@gmail.com', 'Ipoh', 01264394508),
('C08', 'Max', 'Male', 'Max@gmail.com', 'Kuala Lumpur', 01263716496);

INSERT INTO ShoppingCart VALUES
('RO01', '25 May, 2022', '12:24', 'C03','B02'), 
('RO02', '03 June, 2022', '01:06', 'C07','B03'),
('RO03', '04 June, 2022', '13:49', 'C01','B05'), 
('RO04', '29 May, 2022', '22:35', 'C06','B04'),
('RO05', '28 May, 2022', '17:25', 'C02','B06'), 
('RO06', '04 June, 2022', '21:27', 'C05','B01'), 
('RO07', '04 June, 2022', '21:27', 'C05','B07'), 
('RO08', '04 June, 2022', '21:27', 'C05','B04'), 
('RO09', '28 May, 2022', '15:28', 'C04','B01'),
('RO10', '28 May, 2022', '15:28', 'C04','B07');

INSERT INTO MemberOrderDetails VALUES 
('T01', 1 ,'35.00','Paid','RO01','C03'),
('T02', 1,'79.00','Paid','RO02', 'C07'),
('T03', 1,'50.00','Paid','RO03', 'C01'),
('T04', 1,'25.00','Paid','RO04', 'C06'),
('T05', 1,'69.00','Paid','RO05', 'C02'),
('T06', 3,'158.00','Paid','RO06', 'C05'),
('T07', 3,'158.00','Paid','RO07', 'C05'),
('T08', 3,'158.00','Paid','RO08', 'C05'),
('T09', 2,'133.00','Paid','RO09', 'C04'),
('T10', 2,'133.00','Paid','RO10', 'C04');

INSERT INTO FeedBack VALUES
('F01', 'Satisfying', 5,'C03','B02'),
('F02', 'Wasting time and I do not reccomend it to others', 1,'C07','B03'),
('F03', 'Good Book for gift', 7, 'C01','B05'),
('F04', 'Interesting story', 8,'C06','B04'),
('F05', 'I recommend you read this book once in your life', 6,'C02','B06'),
('F06', 'Cant wait for read this interesting book', 8, 'C05','B01'),
('F07', 'the best book I have ever read and now I ordered for my friend', 10, 'C05','B07'),
('F08', 'I hope this book be also good', 5, 'C05','B04'),
('F09', 'I just finished this book and it was really great', 9,'C04','B01'),
('F10', 'The best choice in suspense genre', 9,'C04','B07');

INSERT INTO DeliveryDetails VALUES
('D01', 'Puchong', 01345683305, 'RO01','T01'),
('D02', 'Ipoh', 01264394508, 'RO02','T02'),
('D03', 'Bukit Jalil', 0123174408, 'RO03','T03'),
('D04', 'Putrajaya', 01456892205, 'RO04','T04'),
('D05', 'Subang', 01590843356, 'RO05','T05'),
('D06', 'Cyberjaya', 01584939401, 'RO06','T06'),
('D07', 'Cyberjaya', 01584939401, 'RO07','T07'),
('D08', 'Cyberjaya', 01584939401, 'RO08','T08'),
('D09', 'Kuala Lumpur', 01458645502, 'RO09','T09'),
('D10', 'Kuala Lumpur', 01458645502, 'RO10','T10');

INSERT INTO  Invoice VALUES
('I01','25 May, 2022','35.00','T01'),
('I02','28 May, 2022','133.00','T09'),
('I03','28 May, 2022','133.00','T10'),
('I04','28 May, 2022','69.00','T05'),
('I05','29 May, 2022','25.00','T04'),
('I06','03 June, 2022','79.00','T02'),
('I07','04 June, 2022','50.00','T03'),
('I08','12 June, 2022','158.00','T06'),
('I09','12 June, 2022','158.00','T07'),
('I10','12 June, 2022','158.00','T08');


INSERT INTO DeliveryStatus VALUES
('S01', 'Van', '03 Jun, 2022', 'Arrived', 'D01'),
('S02', 'Van', '06 Jun, 2022', 'Arrived', 'D02'),
('S03', 'Bike', '14 Jun, 2022', 'Arrived', 'D03'),
('S04', 'Car', '06 Jun, 2022', 'Arrived', 'D04'),
('S05', 'Car', '06 Jun, 2022', 'Arrived', 'D05'),
('S06', 'Bike', '06 Jun, 2022', 'Arrived', 'D09'),
('S07', 'Bike', '06 Jun, 2022', 'Arrived', 'D10'),
('S08', 'Car', '23 June, 2022', 'Not Delivered', 'D06'),
('S09', 'Car', '23 June, 2022', 'Not Delivered', 'D07'),
('S10', 'Car', '23 June, 2022', 'Not Delivered', 'D08');

--Q1
SELECT TOP 1 Book.BookID, Book.[Name] As 'Book name', Avg(FeedBack.Rating) AS AVGRating from Book 
Inner join FeedBack On Book.BookID = FeedBack.BookID 
Group By Book.Name, Book.BookID 
Order By AVGRating DESC;

--Q2
SELECT Member.MemberID, Member.[Name] As 'Member name', Count(FeedBack.FeedBackID) 
AS NoOfFeedback From Member 
inner join FeedBack on Member.MemberID = FeedBack.MemberID 
Group BY Member.MemberID, Member.[Name];

--Q3
Select Publisher.PublisherID, Publisher.[Name] As 'Publisher name', Count(Book.BookID)
AS 'Number Of Book Published' From Publisher inner join Book on publisher.PublisherID = Book.PublisherID 
Group By Publisher.PublisherID, Publisher.[Name];

--Q4
select ManagerOrder.ManagerOrderID, Book.PublisherID,
SUM(ManagerOrder.OrderQuantity)as 'Total ordered books' from ManagerOrder 
Inner join Book ON Book.BookID = ManagerOrder.BookID 
Group by ManagerOrder.OrderQuantity, ManagerOrder.ManagerOrderID, Book.PublisherID
ORDER BY ManagerOrder.ManagerOrderID, ManagerOrder.OrderQuantity, Book.PublisherID;

--Q5
Select AVG(Quantity) As Average From Book;
--Avg = 108
Select * From Book where Quantity > (Select AVG(Quantity) From Book) order by Quantity DESC, [Name] ASC;

--Q6
SELECT TOP(1)B.[Name] AS 'Best Selling Book', B.BookID  , 
AVG(DISTINCT F.Rating) AS  'Rating' , 
SUM(DISTINCT MODT.Quantity) As 'Sold'
FROM Book AS B 
JOIN Feedback AS F 
ON F.BookID = B.BookID 
JOIN ShoppingCart AS SC 
ON SC.BookID = B.BookID 
JOIN MemberOrderDetails AS MODT
ON MODT.ShoppingCartID = SC.ShoppingCartID 
GROUP BY B.[Name] , B.BookID
ORDER BY AVG(F.Rating)  DESC, SUM(DISTINCT MODT.Quantity);

--Q7
SELECT TOP(1) M.[Name] As 'Member(s) who spent most on buying books' , I.TotalAmount
FROM Member AS M
JOIN ShoppingCart AS SC 
ON SC.MemberID = M.MemberID 
JOIN MemberOrderDetails AS MODT
ON MODT.ShoppingCartID = SC.ShoppingCartID
JOIN Invoice AS I 
ON I.MemberOrderDetailsID = MODT.MemberOrderDetailsID
GROUP BY M.[Name] , I.TotalAmount
ORDER BY SUM(I.TotalAmount) DESC;

--Q8
Select * From Member where MemberID not in (Select MemberID From ShoppingCart);

--Q9
SELECT  SC.MemberID , DD.[Address] , DD.ContactNumber , B.SerialNo , B.[Name] As 'Book Title' , 
B.Quantity , B.PublishedDate , SS.StatusOfDelivery
FROM Book AS B
JOIN ShoppingCart AS SC 
ON SC.BookID = B.BookID
JOIN DeliveryDetails AS DD
ON DD.ShoppingCartID = SC.ShoppingCartID
JOIN DeliveryStatus AS SS
ON SS.DeliveryDetailsID = DD.DeliveryDetailsID WHERE SS.StatusOfDelivery = 'Not Delivered';

--Q10
SELECT M.[Name] , COUNT(SC.MemberID) As 'Number Of Orders'
FROM Member AS M
JOIN ShoppingCart AS SC 
ON SC.MemberID = M.MemberID
GROUP BY   M.[Name] 
HAVING COUNT(SC.MemberID) > 2;