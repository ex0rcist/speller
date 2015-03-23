module Speller
  class Base < String

    # см. https://tech.yandex.ru/speller/doc/dg/reference/speller-options-docpage/
    OPTIONS = {
      IGNORE_UPPERCASE: 1, # Пропускать слова, написанные заглавными буквами, например, "ВПК".
      IGNORE_DIGITS: 2, #	Пропускать слова с цифрами, например, "авп17х4534".
      IGNORE_URLS: 4, #	Пропускать интернет-адреса, почтовые адреса и имена файлов.
      FIND_REPEAT_WORDS: 8, #	Подсвечивать повторы слов, идущие подряд. Например, "я полетел на на Кипр".
      IGNORE_LATIN: 16, #	Пропускать слова, написанные латиницей, например, "madrid".
      NO_SUGGEST: 32, #	Только проверять текст, не выдавая вариантов для замены.
      FLAG_LATIN: 128, #	Отмечать слова, написанные латиницей, как ошибочные.
      BY_WORDS: 256, #	Не использовать словарное окружение (контекст) при проверке. Опция полезна в случаях, когда на вход сервиса передается список отдельных слов.
      IGNORE_CAPITALIZATION: 512, #	Игнорировать неверное употребление ПРОПИСНЫХ/строчных букв, например, в слове "москва".
      IGNORE_ROMAN_NUMERALS: 2048, #	Игнорировать римские цифры ("I, II, III, ...").
    }


    # params:
    #   string lang: ru, en, uk
    #   int options: options sum
    #   string format: input format, plain or html
    def initialize(text, options = {})
      @service_options = {lang: 'ru,en', options: 0, format: 'plain'}.merge(options)
      super(text)
    end

    # выполнить проверку на ошибки
    def spellcheck
      @_spellcheck_result ||= Speller::Service.ask(self, @service_options)
    end

    # Проверяет текст на ошибки
    def correct?
      spellcheck.none?
    end

    def spellsafe
      raise 'Please implement "spellsafe" method in your subclass'
    end

    def correct!
      raise 'Please implement "correct!" method in your subclass'
    end

  end
end