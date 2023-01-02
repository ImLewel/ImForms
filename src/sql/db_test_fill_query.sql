delete from `options`;
delete from questions;
delete from quizes;


insert into quizes
values
(700, 'quiz_1', 'title_quiz1', 'desc_quiz_1', '2023-02-21'),
(740, 'quiz_2', 'title_quiz_2', 'desc_quiz_2', '2023-02-21'),
(750, 'quiz_3', 'title_quiz_3', 'desc_quiz_3', '2023-02-21');

insert into questions
select 120, 'Triangle is a shape?', 'description', 'title', 'helptext', 1, quizes.id
from quizes where quizes.id = 700;
insert into questions
select 121, 'Rectangle is a shape?', 'description', 'title', 'helptext', 1, quizes.id
from quizes where quizes.id = 700;
insert into questions
select 122, 'Circle is a shape?', 'description', 'title', 'helptext', 1, quizes.id
from quizes where quizes.id = 700;
insert into questions
select 123, 'Square is a shape?', 'description', 'title', 'helptext', 1, quizes.id
from quizes where quizes.id = 700;

insert into `options`
select 0, 'Yes', 0, questions.id
from questions where questions.id = 120;
insert into `options`
select 1, 'No', 1, questions.id
from questions where questions.id = 120;

insert into `options`
select 2, 'Yes', 0, questions.id
from questions where questions.id = 121;
insert into `options`
select 3, 'No', 1, questions.id
from questions where questions.id = 121;
insert into `options`
select 4, 'I dont know', 1, questions.id
from questions where questions.id = 121;

insert into `options`
select 5, 'Yes', 0, questions.id
from questions where questions.id = 122;
insert into `options`
select 6, 'No', 1, questions.id
from questions where questions.id = 122;
insert into `options`
select 7, 'Wut', 1, questions.id
from questions where questions.id = 122;

insert into `options`
select 8, 'Yes', 0, questions.id
from questions where questions.id = 123;
insert into `options`
select 9, 'No', 1, questions.id
from questions where questions.id = 123;
insert into `options`
select 10, 'I like squares', 1, questions.id
from questions where questions.id = 123;
insert into `options`
select 11, 'Or not?', 1, questions.id
from questions where questions.id = 123;