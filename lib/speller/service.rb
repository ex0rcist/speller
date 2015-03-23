module Speller
  module Service

    extend self

    SERVICE_URL = 'http://speller.yandex.net/services/spellservice.json/checkText'

    def ask(text, options = {})

      begin
        response = RestClient.post SERVICE_URL, options.merge({text: text})
        JSON.parse(response.to_str)
      rescue => e
        e.response
      end

      # 'Приевт'.spelling => {errors: [{code => 1, code_text => 'Ошибка', correct => 'Привет'}]}
      # 'Приевт'.spellsafe => "Привет"
      # 'Приевт'.correct? => false  'Привет'.correct? => true

    end
  end
end