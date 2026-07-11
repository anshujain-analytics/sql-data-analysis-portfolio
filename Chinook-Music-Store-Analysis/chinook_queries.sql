Q 3 - Top 5 customers by total spending
SELECT 
    c.CustomerId,
    c.FirstName || ' ' || c.LastName AS Customer_Name,
    SUM(i.Total) AS Total_Spending
FROM customers c
JOIN invoices i 
ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
ORDER BY Total_Spending DESC
LIMIT 5;

Q 4 - Most popular genre (based on number of tracks sold)
SELECT 
    g.Name AS Genre,
    COUNT(ii.Quantity) AS Total_Sold
FROM invoice_items ii
JOIN tracks t ON ii.TrackId = t.TrackId
JOIN genres g ON t.GenreId = g.GenreId
GROUP BY g.Name
ORDER BY Total_Sold DESC
LIMIT 1;

Q – 5 Artist with highest revenue generated.
SELECT 
ar.Name AS Artist,
SUM(ii.UnitPrice * ii.Quantity) AS Total_Revenue
FROM invoice_items ii
JOIN tracks t ON ii.TrackId = t.TrackId
JOIN albums al ON t.AlbumId = al.AlbumId
JOIN artists ar ON al.ArtistId = ar.ArtistId
GROUP BY ar.Name
ORDER BY Total_Revenue DESC
LIMIT 1;

Q 6 - Top Invoices of Germany customers with names and Do the sum of the invoices of Germany customers. 
select total, country, firstname from invoices inner join customers on invoices.CustomerId = customers.customerid where country = 'Germany' order by total DESC;

Q 7 - Which artist gives the maximum track ? 
SELECT a.ArtistId,b.AlbumId, c.TrackId, c.Name as Track_Name, a.Name as Artist_Name, c.Composer from artists a left OUTER JOIN albums b on b.ArtistId = a.ArtistId left OUTER JOIN tracks c on c.AlbumId = b.AlbumId;

SELECT 
    a.ArtistId,
    a.Name AS Artist_Name,
    COUNT(c.TrackId) AS Total_Tracks
FROM artists a
LEFT JOIN albums b ON b.ArtistId = a.ArtistId
LEFT JOIN tracks c ON c.AlbumId = b.AlbumId
GROUP BY a.ArtistId, a.Name
ORDER BY Total_Tracks DESC
LIMIT 1;

Q 8 - Name the customer have the track id 232.
SELECT firstname,lastname,trackid from invoice_items a left OUTER JOIN invoices b on a.InvoiceId = b.InvoiceId LEFT OUTER JOIN customers c on c.CustomerId = b.CustomerId WHERE trackid = '232';
