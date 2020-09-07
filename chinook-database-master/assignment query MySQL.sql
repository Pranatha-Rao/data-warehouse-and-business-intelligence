select g.name, i.total
from genre g
join track t on t.GenreId = g.GenreId
join invoiceline iv on iv.TrackId = t.TrackId
join invoice i on i.InvoiceId = iv.InvoiceId
group by Name
order by i.total desc;

select a.title, max(i.total) as sales
from album a 
join track t on a.AlbumId = t.AlbumId
join invoiceline iv on iv.TrackId = t.TrackId
join invoice i on i.InvoiceId = iv.InvoiceId
group by title
order by max(i.total) desc
limit 10;
