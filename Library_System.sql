-- Library System Schema
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(200),
    author VARCHAR(100),
    isbn VARCHAR(20) UNIQUE,
    status VARCHAR(20) DEFAULT 'Available' -- Available or Borrowed
);

CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    join_date DATE
);

CREATE TABLE Loans (
    loan_id INT PRIMARY KEY,
    book_id INT,
    member_id INT,
    borrow_date DATE,
    return_deadline DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- Query: List overdue books
SELECT b.title, m.full_name, l.return_deadline
FROM Loans l
JOIN Books b ON l.book_id = b.book_id
JOIN Members m ON l.member_id = m.member_id
WHERE l.return_deadline < CURRENT_DATE;

