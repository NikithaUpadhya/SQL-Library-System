# SQL Library Management System
This repository contains SQL code for creating and managing a library's e-book store database. The system includes key entities such as publishers, managers, books, orders, and members, allowing for efficient tracking of books and related transactions. The database schema is designed to store essential information about books, their publishers, library managers, and members.

# Database Overview
The SQL script creates the following tables to manage the system:

1. Publisher
This table holds information about the publishers of the books:

- PublisherID (Primary Key): A unique identifier for each publisher.
- Name: The name of the publisher.
- Address: The address of the publisher.
- ContactNumber: The contact number of the publisher.

2. Manager
This table contains details about the managers responsible for handling book orders from publishers:

- ManagerID (Primary Key): A unique identifier for each manager.
- Name: The name of the manager.
- Address: The address of the manager.
- PublisherID (Foreign Key): Links to the Publisher table.

3. Book
This table stores information about the books available in the library:

- BookID (Primary Key): A unique identifier for each book.
- Name: The name of the book.
- Author: The author of the book.
- Genre: The genre or category of the book.
- Price: The price of the book.
- Quantity: The number of copies available.
- PublishedDate: The date the book was published.
- SerialNo: The serial number for the book.
- PublisherID (Foreign Key): Links to the Publisher table.

4. ManagerOrder
This table tracks the orders made by managers to publishers:

- ManagerOrderID (Primary Key): A unique identifier for each order.
- OrderQuantity: The number of books ordered.
- OrderDate: The date the order was placed.
- TotalPrice: The total price of the order.
- ManagerID (Foreign Key): Links to the Manager table.
- BookID (Foreign Key): Links to the Book table.
  
5. Member
This table stores information about members who borrow books:

- MemberID (Primary Key): A unique identifier for each member.
- Name: The name of the member.
- Address: The address of the member.
- PhoneNumber: The contact number of the member.
- Email: The email address of the member.

# Conclusion
This SQL script provides a comprehensive structure for managing an e-book library system. The tables are designed to efficiently handle books, orders, members, and related entities. 
The foreign key constraints help maintain data integrity across relationships such as managers placing orders for books from publishers.

