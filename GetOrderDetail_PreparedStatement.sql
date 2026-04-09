-- Prepare the statement
PREPARE GetOrderDetail FROM 
'SELECT OrderID, Quantity, TotalCost 
 FROM orders 
 WHERE BookingID IN (SELECT BookingID FROM bookings WHERE CustomerID = ?)';
 
 -- Create the variable 'id' and assign it a value of 1
SET @id = 1;

-- Execute the prepared statement using the variable
EXECUTE GetOrderDetail USING @id;