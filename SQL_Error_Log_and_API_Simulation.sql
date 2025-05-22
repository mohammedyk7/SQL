
-- SQL ERROR LOG FILE --

-- 1. Try deleting a member who has existing loans
-- Action: DELETE FROM Member WHERE MemberID = 1;
-- Error: The DELETE statement conflicted with the REFERENCE constraint on Loan.
-- Cause: Member 1 has existing loans.
-- Resolution: Add ON DELETE CASCADE or delete loans first.

-- 2. Try deleting a member who wrote reviews
-- Action: DELETE FROM Member WHERE MemberID = 2;
-- Error: The DELETE statement conflicted with the REFERENCE constraint on Review.
-- Cause: Member 2 has reviews in the Review table.
-- Resolution: Add ON DELETE CASCADE to Review FK or delete reviews first.

-- 3. Try deleting a book on loan
-- Action: DELETE FROM Book WHERE BookID = 2;
-- Error: FK constraint failed on Loan table.
-- Cause: Book 2 is currently on loan.
-- Resolution: Return the book and delete loans first.

-- 4. Try deleting a book with reviews
-- Action: DELETE FROM Book WHERE BookID = 1;
-- Error: Cannot delete due to related reviews.
-- Cause: Reviews exist for Book 1.
-- Resolution: Delete reviews first or use ON DELETE CASCADE.

-- 5. Try inserting a loan for non-existent member
-- Action: INSERT INTO Loan (MemberID, BookID, LoanDate, DueDate, Status) VALUES (99, 1, '2023-06-01', '2023-06-15', 'Issued');
-- Error: Foreign key constraint fails.
-- Cause: MemberID 99 does not exist.
-- Resolution: Use a valid existing MemberID.

-- 6. Try inserting a loan for a non-existent book
-- Action: INSERT INTO Loan (MemberID, BookID, LoanDate, DueDate, Status) VALUES (1, 999, '2023-06-01', '2023-06-15', 'Issued');
-- Error: FK violation.
-- Cause: BookID 999 does not exist.
-- Resolution: Use an existing BookID.

-- 7. Try updating a book's genre to 'Sci-Fi'
-- Action: INSERT INTO BookGenre (BookID, Genre) VALUES (1, 'Sci-Fi');
-- Error: CHECK constraint failed.
-- Cause: 'Sci-Fi' is not in the allowed genre list.
-- Resolution: Only use genres from the allowed set.

-- 8. Try inserting a payment with zero/negative amount
-- Action: INSERT INTO Payment (LoanID, PaymentDate, Amount, Method) VALUES (1, '2023-06-01', -5, 'Cash');
-- Error: CHECK constraint fails (Amount > 0).
-- Resolution: Ensure Amount > 0.

-- 9. Try inserting payment with missing method
-- Action: INSERT INTO Payment (LoanID, PaymentDate, Amount) VALUES (1, '2023-06-01', 5.00);
-- Error: Column 'Method' cannot be null.
-- Resolution: Provide a valid method value.

-- 10. Try inserting a review for non-existent book
-- Action: INSERT INTO Review (MemberID, BookID, Rating, Comment, ReviewDate) VALUES (1, 999, 4, 'Great!', '2023-06-01');
-- Error: FK fails on BookID.
-- Resolution: Book must exist.

-- 11. Try inserting a review for unregistered member
-- Action: INSERT INTO Review (MemberID, BookID, Rating, Comment, ReviewDate) VALUES (99, 1, 4, 'Nice!', '2023-06-01');
-- Error: FK fails on MemberID.
-- Resolution: Member must be registered.

-- 12. Try updating a foreign key (Loan.MemberID) to non-existent value
-- Action: UPDATE Loan SET MemberID = 999 WHERE LoanID = 1;
-- Error: FK violation.
-- Resolution: MemberID must exist in Member table.

-- API-LIKE SELECT QUERIES --

-- GET /loans/overdue
SELECT Loan.LoanID, Member.FullName, Book.Title, Loan.DueDate
FROM Loan
JOIN Member ON Loan.MemberID = Member.MemberID
JOIN Book ON Loan.BookID = Book.BookID
WHERE Loan.Status = 'Overdue';

-- GET /books/unavailable
SELECT BookID, Title FROM Book WHERE IsAvailable = 0;

-- GET /members/top-borrowers
SELECT MemberID, FullName, COUNT(*) AS TotalLoans
FROM Loan
JOIN Member ON Loan.MemberID = Member.MemberID
GROUP BY MemberID, FullName
HAVING COUNT(*) > 2;

-- GET /books/:id/ratings
SELECT BookID, AVG(Rating) AS AverageRating
FROM Review
GROUP BY BookID;

-- GET /libraries/:id/genres
SELECT b.LibraryID, bg.Genre, COUNT(*) AS TotalBooks
FROM Book b
JOIN BookGenre bg ON b.BookID = bg.BookID
GROUP BY b.LibraryID, bg.Genre;

-- GET /members/inactive
SELECT 
    M.FullName, 
    M.Email
FROM 
    Member M
LEFT JOIN Loan L ON M.MemberID = L.MemberID
WHERE 
    L.LoanID IS NULL;

-- GET /payments/summary
SELECT Member.MemberID, Member.FullName, SUM(Payment.Amount) AS TotalPaid
FROM Payment
JOIN Loan ON Payment.LoanID = Loan.LoanID
JOIN Member ON Loan.MemberID = Member.MemberID
GROUP BY Member.MemberID, Member.FullName;

-- GET /reviews
SELECT ReviewID, Member.FullName, Book.Title, Rating, Comment, ReviewDate
FROM Review
JOIN Member ON Review.MemberID = Member.MemberID
JOIN Book ON Review.BookID = Book.BookID;
