## Консольная игра "Hangman"

---

### Суть игры:

В данном приложении реализована популярная игра "Виселица", в которой необходимо угадать скрытое слово
по буквам. При каждом неправильном ответе к человечку на виселице будет прибавляться часть
тела. Если пользователь ошибся 7 раз, игра будет проиграна, а в консоли отобразится 
полное изображение висельника.
---
### Установка и запуск:

**Примечание:** Игра является ruby-приложением, поэтому необходимо чтобы на вашем компьютере был 
установлен интерпретатор Ruby.

Перенесите содержимое данного репозитория на свой компьютер.
Для запуска приложения из папки ***hangman*** выполнить в командной строке:

```
ruby main.rb
```
### Как добавить/удалить слова для игры:

Вы можете добавлять (удалять) используемые приложением слова в файле words.txt.
Местонахождение файла: hangman/data/words.txt
Редактировать необходимо по аналогии с текущим содержанием файла: Каждое слово с 
новой строки, **ПРОПИСНЫМИ** буквами.
---