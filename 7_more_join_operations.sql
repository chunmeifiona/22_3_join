-- https://sqlzoo.net/wiki/More_JOIN_operations
-- 1
SELECT id, title
FROM movie
WHERE yr=1962

-- 2
SELECT yr
FROM movie
WHERE title = 'Citizen Kane'

-- 3
select id, title, yr

from movie
where title like '%Star Trek%'
order by yr

-- 4
select id
from actor
where name = 'Glenn Close'

-- 5
select id
from movie
where title =  'Casablanca'

-- 6
select name
from casting c 
join actor a on a.id=c.actorid
join movie m on m.id=c.movieid
where c.movieid = 11768

-- 7
select name
from casting c 
join actor a on a.id=c.actorid
join movie m on m.id=c.movieid
where m.title =  'Alien'

-- 8
select m.title
from casting c 
join actor a on a.id=c.actorid
join movie m on m.id=c.movieid
where a.name= 'Harrison Ford'

-- 9
select m.title
from casting c 
join actor a on a.id=c.actorid
join movie m on m.id=c.movieid
where a.name= 'Harrison Ford' and ord<>1

-- 10
select m.title, a.name
from casting c 
join actor a on a.id=c.actorid
join movie m on m.id=c.movieid
where m.yr=1962 and ord=1

-- 11
SELECT yr, COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

-- 12
select m.title, a.name
from casting c join actor a on a.id=c.actorid
               join movie m on m.id=c.movieid
WHERE ord=1 and m.id in (
  select movieid from casting where actorid IN (
      SELECT id FROM actor WHERE name='Julie Andrews') 
)

-- 13
select name
from actor join casting on id=actorid
where ord=1
group by name
having count(ord)>=15


-- 14
select title, count(actorid)
from movie join casting on id=movieid
where yr=1978
group by movieid
order by count(actorid) desc, title

-- 15
select name
from actor join casting on casting.actorid=actor.id
where name<> 'Art Garfunkel' and movieid in (
        select movieid from actor join casting on casting.actorid=actor.id
            where name= 'Art Garfunkel')
