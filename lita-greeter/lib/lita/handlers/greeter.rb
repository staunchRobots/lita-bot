require 'pry'
module Lita
  module Handlers
    class Greeter < Handler
      def self.greetings
        t("greetings")
      end

      route /(#{greetings.join('|')})\s+/, :greet
      route /^(#{greetings.join('|')})$/,  :greet

      route /^say\s+(.+)/, :say, :command => true

      def random_greet
        self.class.greetings.shuffle.first
      end

      def greet(response)
        response.reply "#{random_greet} @#{response.user.mention_name}!"
      end

      def say(response)
        response.reply response.matches
      end
    end

    Lita.register_handler(Greeter)
  end
end
