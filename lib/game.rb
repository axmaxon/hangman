class Game
  # Допустимое количество ошибок
  TOTAL_ERRORS_ALLOWED = 7

  def initialize(word)
    @letters = word.upcase.chars
    @user_guesses = []
  end

  # Возвращает количество ошибок, сделанных пользователем
  def errors_made
    errors.length
  end

  # Возвращает массив неправильных букв (нет в слове), введенных пользователем
  def errors
    @user_guesses - normalized_letters
  end

  # Сколько ещё разрешено ошибок
  def errors_allowed
    TOTAL_ERRORS_ALLOWED - errors_made
  end

  # Проходит по буквам слова-образца, сравнивает с введенными буквами. Для совпавших букв
  # берем "ненормализованные" из @letters. Возвращает - массив совпадений
  # например такой ['Б', 'Е', 'nil','Р', 'Ё', 'З', nil]
  def letters_to_guess
    normalized_letters.map.with_index do |letter, index|
      if @user_guesses.include?(letter)
        @letters[index]
      end
    end
  end

  # Возвращает true если допустимое оставшееся количество ошибок == 0
  def lost?
    errors_allowed == 0
  end

  # Заменяет Ё и Й на Е и И, остальное возвращает без изменений
  def normalize_letter(letter)
    if letter == 'Ё'
      'Е'
    elsif letter == 'Й'
      'И'
    else
      letter
    end
  end

  # Заменяет Ё и Й на Е и И в массиве @letters.
  def normalized_letters
    @letters.map { |letter| normalize_letter(letter) }
  end

  # Возвращает true если состоялся выигрыш или проигрыш
  def over?
    won? || lost?
  end

  # Метод меняет состояние игры, поэтому '!''. Отправляет очередную букву в
  # "нормализатор", потом, если игра не окончена и массив с угаданными буквами не
  # содержит такую букву - добавляет букву в массив
  def play!(letter)
    letter = normalize_letter(letter)

    if !over? && !@user_guesses.include?(letter)
      @user_guesses << letter
    end
  end

  # Если массив содержащий разность букв в уг.слове и букв введенных - пуст, то true
  def won?
    (normalized_letters - @user_guesses).empty?
  end

  # Возвращает загаданное слово, склеивая его из загаданных букв
  def word
    @letters.join
  end
end
