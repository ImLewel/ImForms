delete from `options`;
delete from questions;
delete from quizes;


insert into quizes
values
(700, 'Shape quiz', 'Shape quiz title', 'Shape quiz description', '2023-02-21'),
(740, 'Math quiz', 'Math quiz title', 'Math quiz description', '2023-03-17'),
(750, 'C# quiz', 'C# quiz title', 'C# quiz description', '2023-01-10');

# Shape quiz
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

# Math quiz
insert into questions
select 220, 'Solve 2+2', 'Enter your answer below', 'title', '*Necessarily', 1, quizes.id
from quizes where quizes.id = 740;
insert into questions
select 221, 'Solve 3*3', 'Enter your answer below', 'title', '*Necessarily', 1, quizes.id
from quizes where quizes.id = 740;
insert into questions
select 222, 'factorial of zero =', 'Choose rigth option', 'title', '*Necessarily', 1, quizes.id
from quizes where quizes.id = 740;

# C# quiz
insert into questions
select 500, 'C# is a programing language', 'Choose rigth option', 'title', '*Necessarily', 1, quizes.id
from quizes where quizes.id = 750;
insert into questions
select 501, 'Is C# a OOP language?', 'Choose rigth option', 'title', '*Necessarily', 1, quizes.id
from quizes where quizes.id = 750;
insert into questions
select 502, 'C# can be used in WEB dev?', 'Enter your answer below', 'title', '*Necessarily', 1, quizes.id
from quizes where quizes.id = 750;

# Shape quiz
insert into `options`
select 0, 'Yes', 1, questions.id
from questions where questions.id = 120;
insert into `options`
select 1, 'No', 0, questions.id
from questions where questions.id = 120;

insert into `options`
select 2, 'Yes', 1, questions.id
from questions where questions.id = 121;
insert into `options`
select 3, 'No', 0, questions.id
from questions where questions.id = 121;
insert into `options`
select 4, 'I dont know', 0, questions.id
from questions where questions.id = 121;

insert into `options`
select 5, 'Yes', 1, questions.id
from questions where questions.id = 122;
insert into `options`
select 6, 'No', 0, questions.id
from questions where questions.id = 122;
insert into `options`
select 7, 'Wut', 0, questions.id
from questions where questions.id = 122;

insert into `options`
select 8, 'Yes', 1, questions.id
from questions where questions.id = 123;
insert into `options`
select 9, 'No', 0, questions.id
from questions where questions.id = 123;
insert into `options`
select 10, 'I like squares', 0, questions.id
from questions where questions.id = 123;
insert into `options`
select 11, 'Or not?', 0, questions.id
from questions where questions.id = 123;

# Math quiz
insert into `options`
select 12, '5', 0, questions.id
from questions where questions.id = 220;

insert into `options`
select 13, '9', 1, questions.id
from questions where questions.id = 221;

insert into `options`
select 14, '10', 0, questions.id
from questions where questions.id = 222;
insert into `options`
select 15, '1', 1, questions.id
from questions where questions.id = 222;
insert into `options`
select 16, '0', 0, questions.id
from questions where questions.id = 222;

# C# quiz
insert into `options`
select 17, 'No', 0, questions.id
from questions where questions.id = 500;
insert into `options`
select 18, 'Yes', 1, questions.id
from questions where questions.id = 500;
insert into `options`
select 19, 'C# is kinda musical stuff, isn\'t it?', 0, questions.id
from questions where questions.id = 500;

insert into `options`
select 20, 'No', 0, questions.id
from questions where questions.id = 501;
insert into `options`
select 21, 'Yes', 1, questions.id
from questions where questions.id = 501;
insert into `options`
select 22, 'Totally no!', 0, questions.id
from questions where questions.id = 501;

insert into `options`
select 23, 'No', 0, questions.id
from questions where questions.id = 502;
insert into `options`
select '24', 'Yes, but with .NET framework', 1, questions.id
from questions where questions.id = 502;
insert into `options`
select 25, 'C# is programing language, OK, now I got it', 1, questions.id
from questions where questions.id = 502;