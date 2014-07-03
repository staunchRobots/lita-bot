module Lita
  module Handlers
    class Greeter < Handler
      
      def self.greetings
        %w(hello hi greetings sup yo oy hola)
      end

      route /^(#{greetings.join('|')})$/, :greet, :command => true

      route /^say\s+(.+)/, :say, :command => true

      def greet(response)
        response.reply "#{self.class.greetings.shuffle.first} #{response.user.name}!"
      end

      def say(response)
        response.reply response.matches
      end
    end

    Lita.register_handler(Greeter)
  end
end
