-- Create User table
CREATE TABLE User (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  email VARCHAR(100) UNIQUE,
  password_hash VARCHAR(255),
  location VARCHAR(100)
);

-- Create Book table
CREATE TABLE Book (
  book_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(200),
  author VARCHAR(100),
  isbn VARCHAR(20)
);

-- Create Listing table
CREATE TABLE Listing (
  listing_id INT PRIMARY KEY AUTO_INCREMENT,
  seller_id INT,
  book_id INT,
  price DECIMAL(10,2),
  status VARCHAR(20),
  created_at DATETIME,
  FOREIGN KEY (seller_id) REFERENCES User(user_id),
  FOREIGN KEY (book_id) REFERENCES Book(book_id)
);

-- Create Transaction table
CREATE TABLE Transaction (
  transaction_id INT PRIMARY KEY AUTO_INCREMENT,
  buyer_id INT,
  listing_id INT,
  purchase_date DATETIME,
  FOREIGN KEY (buyer_id) REFERENCES User(user_id),
  FOREIGN KEY (listing_id) REFERENCES Listing(listing_id)
);

-- Insert sample User
INSERT INTO User (name, email, password_hash, location)
VALUES ('Alice Smith', 'alice@example.com', 'hashed_password_abc123', 'Adelaide');

-- Insert sample Book
INSERT INTO Book (title, author, isbn)
VALUES ('Database Systems', 'Thomas Connolly', '9780132943260');

-- Insert sample Listing
INSERT INTO Listing (seller_id, book_id, price, status, created_at)
VALUES (1, 1, 49.99, 'available', NOW());

-- Insert sample Transaction
INSERT INTO Transaction (buyer_id, listing_id, purchase_date)
VALUES (1, 1, NOW());
