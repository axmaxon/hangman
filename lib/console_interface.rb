class ConsoleInterface
  # Пишем в константу массив картинок
  FIGURES =
    Dir["#{__dir__}/../data/figures/*.txt"].sort.map { |file_name| File.read(file_name) }

  def initialize(game)
    @game = game
  end

  # Выводит в консоль состояние игры, используя данные экземпляра
  def print_out
    puts
    puts "Слово: #{word_to_show}".light_blue
    puts figure.yellow
    puts "Ошибки (#{@game.errors_made}): #{errors_to_show}".red
    puts "У вас осталось ошибок: #{@game.errors_allowed}".light_blue

    if @game.won?
      puts 'Вы выиграли!'.green
    elsif @game.lost?
      puts "Вы проиграли, было загадано слово '#{@game.word}'".red
    end
  end

  # Возвращает картинку номер (и индекс)которой соответствует количеству ошибок
  def figure
    FIGURES[@game.errors_made]
  end

  # Возвращает текущее состояние угадываемого слова
  def word_to_show
    result = @game.letters_to_guess.map do |letter|
      if letter.nil?
        '__'
      else
        letter
      end
    end

    # Преобразуем массив в строку с разделителем - пробелом
    result.join(' ')
  end

  # Возвращает список ошибок (через запятую)
  def errors_to_show
    @game.errors.join(', ')
  end

  # Получает букву от пользователя, приводит к верхнему регистру, возвращает
  def get_input
    print 'Введите следующую букву: '

    # Принимаем только первую букву из того что введет пользователь и апкейсим
    gets[0].upcase
  end
end
