module Speller
  class Text < Base

    # Возвращает исходный многострочный текст, очищенный от ошибок
    def spellsafe(variant = 0)

      rows = self.split("\n")

      rows.each_with_index do |row, i|
        row_mistakes = spellcheck.collect { |mistake| mistake if mistake['row'] == i }.compact
        row_mistakes.each do |mistake|
          row.sub!(mistake['word'], mistake['s'][variant]) if mistake['s'].any?
        end
      end.join("\n")

    end

    # возвращает список слов с ошибками
    # all - вернуть все слова, даже если вариантов замены нет
    def bad_words(all = false)
      spellcheck.collect { |h| h['word'] if (h['s'].any? || all) }.compact
    end

    # Исправляет текст на корректный, или возвращает исходный
    def correct!
      return self if correct?

      self.replace(spellsafe)
      @_spellcheck_result = []

      self
    end

  end
end