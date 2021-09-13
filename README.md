Консольная игра "Hangman"
===

![hangman](https://github.com/axmaxon/hangman/blob/main/data/pictures/nangman_.png?raw=true)

## Суть игры:

В данном приложении реализована популярная игра "Виселица", в которой необходимо угадать скрытое слово
по буквам. При каждом неправильном ответе к человечку на виселице будет прибавляться часть
тела. Если пользователь ошибся 7 раз, игра будет проиграна, а в консоли отобразится 
полное изображение висельника.

## Установка и запуск:

**Примечание:** Игра является ruby-приложением, поэтому необходимо чтобы на вашем компьютере был 
установлен интерпретатор Ruby. 

Перенесите содержимое данного репозитория на свой компьютер.
Для корректной работы приложения необходимо установить Ruby gem "colorize". Для
этого в командной строке перейдите в папку **hangman**  и выполните:

```
bundle install
```

Теперь из той же папки можно запустить приложение следующей командой:

```
bundle exec ruby main.rb
```

## Как добавить/удалить слова для игры:

Вы можете добавлять (удалять) используемые приложением слова в файле words.txt.
Местонахождение файла: hangman/data/words.txt

Редактировать этот файл необходимо по аналогии с его текущим содержанием: Каждое слово с 
новой строки.
