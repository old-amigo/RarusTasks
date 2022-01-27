/*
select count(book_author.book_id) as count,
       author.name,
       author.surname
from book_author
         join author on book_author.author_id = author.id
group by author_id
order by count desc
limit 1
;
*/

select a.name, a.surname
from book_author
         join author a on book_author.author_id = a.id
group by author_id
having count(book_id) = (select max(count)
                         from (select count(book_id) as count from book_author group by author_id) as max_count);