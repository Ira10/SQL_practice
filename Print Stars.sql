https://docs.google.com/spreadsheets/d/1_Y46EL4nvmdzsGFqQLecMkhBNPWKt2rL-Neto4NU6Ek/edit?gid=722957585#gid=722957585


select genre	
, title	
, CEILING(avg(rating)) as rating_	
, replicate('*', round(avg(rating),0)) AS stars	
	
from movies m	
JOIN reviews r	
ON m.id = r.movie_id	
	
GROUP by genre, title;	
	
