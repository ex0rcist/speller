module Speller
  class Word < Base

    # Возвращает строку, очищенную от ошибок
    # По умолчанию использует первый предложенный вариант
    # предполагается, что spellcheck возвращает массив из 0 или 1 элемента
    def spellsafe(variant = 0)
      spellcheck.first['s'][variant] rescue self
    end


    # Исправляет текст на корректный, или возвращает исходный
    def correct!(variant = 0)
      return self if correct?

      self.replace(spellsafe(variant))
      @_spellcheck_result = []

      self
    end

    # варианты исправлений ошибки
    def variants
      spellcheck.collect { |mistake| mistake['s'] }.flatten.compact
    end

  end
end