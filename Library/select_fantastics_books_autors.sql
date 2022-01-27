select book.name as 'Название книги',
       a.name as 'Имя автора',
       a.surname as 'Фамилия автора'
from book
         join book_author ba on book.id = ba.book_id
         join author a on a.id = ba.author_id
         join book_genre bg on book.id = bg.book_id
         join genre g on g.id = bg.genre_id
where g.name = 'Фантастика';
