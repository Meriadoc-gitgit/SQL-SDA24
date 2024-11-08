# 1ère partie -- Base de données Sakila

# 1 -- Tous les acteurs dont le nom de famille contient les lettres 'gen'
select * from sakila.actor
where lower(last_name) like '%gen%';

# 2 -- Tous les acteurs dont le nom de famille contient les lettres 'li'
select * from sakila.actor
where lower(last_name) like '%li%';

# 3 -- Liste des noms de famille de tous les acteurs, ainsi que le nombre d'acteurs portant chaque nom de famille
select last_name, count(*)
from sakila.actor
group by last_name;

# 4 -- Liste des noms de famille des acteurs et le nombre d'acteurs qui portent chaque nom de famille, mais seulement pour les noms qui sont portés par au moins 2 acteurs
select last_name, count(*)
from sakila.actor
group by last_name 
having count(*) >= 2;

# 5 -- Utilisez JOIN pour afficher le montant total perçu par chaque membre du personnel en août 2005
select p.staff_id, s.first_name, s.last_name, sum(p.amount)
from sakila.staff s 
	join sakila.payment p 
	on s.staff_id = p.staff_id
where date_format(p.payment_date, '%Y-%m') = '2005-08'
group by p.staff_id, s.first_name, s.last_name;

# 6 -- Afficher les titres des films commençant par les lettres K et Q dont la langue est l'anglais
select distinct f.title
from sakila.film f, sakila.language l
where 
	lower(f.title) like 'k%' 
		or lower(f.title) like 'q%'
	and f.language_id = l.language_id 
    and l.name = 'English';
    
# 7 -- Affichez les noms et les adresses électroniques de tous les clients canadiens
select c.last_name, c.email, c.email, a.address, a.district, ci.city, a.postal_code, co.country 
from sakila.customer c, sakila.city ci, sakila.address a, sakila.country co
where 
	c.address_id = a.address_id 
    and ci.city_id = a.city_id 
	and co.country_id = ci.country_id 
    and co.country = 'Canada';

# 8 -- Quelles sont les ventes de chaque magasin pour chaque mois de 2005 (CONCAT)
select s.store_id, count(p.payment_id) as number_sold, concat('0',month(p.payment_date),'-',year(p.payment_date)) as month_year
from sakila.payment p, sakila.staff st, sakila.store s
where 
	p.staff_id = st.staff_id 
    and st.store_id = s.store_id
	and year(p.payment_date) = 2005
group by concat('0',month(p.payment_date),'-',year(p.payment_date)), s.store_id
order by concat('0',month(p.payment_date),'-',year(p.payment_date)) asc;

# 9 -- Trouvez le titre du film, le nom du client, le numéro de téléphone du client et l'adresse du client pour tous les DVD en circulation (qui n'ont pas prévu d'être rendus)
select distinct f.title, concat(c.first_name, ' ', c.last_name) as name, a.phone, concat(a.address, ' ', a.district, ' ', a.postal_code, ' ', ci.city, ' ', co.country) as address
from sakila.rental r
	join sakila.customer c 
		on r.customer_id = c.customer_id
	join sakila.address a
		on a.address_id = c.address_id
	join sakila.inventory i
		on i.inventory_id = r.inventory_id
	join sakila.film f
		on f.film_id = i.film_id
	join sakila.city ci 
		on ci.city_id = a.city_id
	join sakila.country co
		on co.country_id = ci.country_id
where r.return_date is null;
