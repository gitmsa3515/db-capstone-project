SELECT 
    c.CustomerID,
    CONCAT(c.CustomerFirstName,
            ' ',
            c.CustomerLastName) AS FullName,
    o.OrderID,
    o.TotalCost,
    m.MenuName,
    m.CourseName
FROM
    customerdetails AS c
        INNER JOIN
    bookings AS b ON c.CustomerID = b.CustomerID
        INNER JOIN
    orders AS o ON o.BookingID = b.BookingID
        INNER JOIN
    menus AS m ON m.MenuID = o.MenuID
WHERE
    o.TotalCost > 150
ORDER BY o.TotalCost ASC;