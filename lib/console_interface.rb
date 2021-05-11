class ConsoleInterface
  # Пишем в константу массив картинок
  FIGURES =
    Dir[__dir__ + '/../data/figures/*.txt'].
    sort.
    map { |file_name| File.read(file_name) }

  def initialize(game)
    @game = game
  end

  # Выводит в консоль состояние игры, используя данные экземпляра
	def print_out
    # Конструкция с тильдой - HEREDOC
    puts <<~END
      Слово: #{word_to_show}
      #{figure}
      Ошибки (#{@game.errors_made}): #{errors_to_show}
      У вас осталось ошибок: #{@game.errors_allowed}
    END

    if @game.won?
      puts "Вы выиграли!"
    elsif @game.lost?
      puts "Вы проиграли, загаданное слово #{@game.word}"
    end
	end

  # Возвращаем картинку номер (и индекс)которой соответствует количеству ошибок
  def figure
    FIGURES[@game.errors_made]
  end

  # Отобразить угадываемое слово (текущее состояние)
  def word_to_show
    result =
      @game.letters_to_guess.map do |letter|
      if letter.nil? # letter == nil
        "__"
      else
        letter
      end
    end
    # Преобразуем массив в строку с разделителем - пробелом
    result.join(" ") #
  end

  # Показать ошибки (через запятую)
  def errors_to_show
    @game.errors.join(', ')
  end

  # Получает букву от пользователя, приводит к верхнему регистру, возвращает
  def get_input
    print "Введите следующую букву: "
    # Принимаем только первую букву из того что введет пользователь и апкейсим
    letter = gets[0].upcase
    letter
  end
end
