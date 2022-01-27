insert into genre (name)
values ('Фантастика'),
       ('Роман'),
       ('Детектив'),
       ('Приключения'),
       ('Наука'),
       ('Фольклор'),
       ('Юмор');

insert into book (isbn, name, pages, publication_date)
values (null, 'Властелин колец: братство кольца', 250, '1954-06-29'),
       (null, 'Властелин колец: две крепости', 278, '1954-11-11'),
       (null, 'Властелин колец: возвращение короля', 256, '1955-10-20'),
       (null, 'Понедельник начинается в субботу', 216, '1964-01-01'),
       (null, 'Град обреченный', 417, '1988-01-01'),
       ('0-201-63361-2', 'Design Patterns: Elements of Reusable Object-Oriented Software', 395, '1994-01-01')
;

insert into author (name, surname)
values ('Erich', 'Gamma'),
       ('Richard', 'Helm'),
       ('Ralph', 'Johnson'),
       ('John', 'Vlissides'),
       ('Аркадий', 'Стругацкий'),
       ('Борис', 'Стругацкий'),
       ('Джон Рональд Руэл', 'Толкин')
;

insert into book_author (book_id, author_id)
values (6, 1),
       (6, 2),
       (6, 3),
       (6, 4),
       (4, 5),
       (4, 6),
       (5, 5),
       (5, 6),
       (1, 7),
       (2, 7),
       (3, 7)
;

insert into book_genre (book_id, genre_id)
values (6, 5),
       (1, 1),
       (2, 1),
       (3, 1),
       (1, 2),
       (2, 2),
       (3, 2),
       (4, 1),
       (5, 1)
;