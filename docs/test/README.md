# Тестування працездатності системи

# Початкові дані
![Таблиця опитувань](initial_quizes_table.png "Таблиця опитувань")
![Таблиця питань](initial_questions_table.png "Таблиця опитувань")

![Таблиця варіантів відповідей/відповідей](initial_options_table.png "Таблиця варіантів відповідей/відповідей")

# Запити до таблиці options
## GET запит
![GET запит](get-query.png "GET запит")
![Результат GET запиту](get-query-res.png "Результат GET запиту")
## GET запит по id
![Результат GET запиту по id](getId-query.png "Результат GET запиту по id")
## GET запит по questions_id
![Результат GET запиту по questions_id](get-byQuestionId-query.png "Результат GET запиту по questions_id")
## POST запит
![POST запит](post-query.png "POST запит")
![Результат POST запиту](post-query-res.png "Результат POST запиту")
## PUT запит
![PUT запит по id](post-query.png "PUT запит по id")
![Результат PUT запиту](post-query-res.png "Результат PUT запиту")
## DELETE запит
![DELETE запит по id](del-query.png "DELETE запит по id")
![Результат DELETE запиту](del-query-res.png "Результат DELETE запиту")
## DELETE запит по questions_id
![DELETE запит по questions_id](del-byId-query.png "DELETE запит по questions_id")
![Результат DELETE запиту по questions_id](del-byId-query-res.png "Результат DELETE запиту по questions_id")
# Результати при виконанні з неправильними або недостатними даними
## GET запит по неіснуючому id
![GET запит по неіснуючому id](get-not-existing-id.png "GET запит по неіснуючому id")
## GET запит по неіснуючому questions_id
![GET запит по неіснуючому questions_id](get-not-existing-questionId.png "GET запит по неіснуючому questions_id")
## PUT запит по неіснуючому id
![PUT запит по неіснуючому id](put-into-not-existing.png "PUT запит по неіснуючому id")
## POST запит у вже існуючий id
![POST запит по існуючому id](post-into-existing.png "POST запит по існуючому id")
## DELETE запит по неіснуючому id
![DELETE запит по неіснуючому questions_id](not-existing-del.png "DELETE запит по неіснуючому questions_id")
## DELETE запит по неіснуючому questions_id
![DELETE запит по неіснуючому questions_id](not-existing-del-byQuestionId.png "DELETE запит по неіснуючому questions_id")
## POST запит з неповними даними
![POST запит з неповними даними](not-fullfilled-post.png "POST запит з неповними даними")
## DELETE запит (по id) з неповними даними
![DELETE запит (по id) з неповними даними](not-fullfilled-del.png "DELETE запит (по id) з неповними даними")
## DELETE запит (по questions_id) з неповними даними
![DELETE запит (по questions_id) з неповними даними](not-fullfilled-del-byQuestionId.png "DELETE запит (по questions_id) з неповними даними")
## PUT запит з неповними даними
![PUT запит з неповними даними](not-fullfilled-put.png "PUT запит з неповними даними")