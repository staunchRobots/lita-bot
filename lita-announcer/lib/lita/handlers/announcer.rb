module Lita
  module Handlers
    class Announcer < Handler
      on :joined, :announce_join
      on :parted, :announce_part

      route /^die/, :seppuku, :command => true 

      def seppuku(response)
        response.reply "Hai!"
        robot.shut_down
      end

      def announce_join(payload)
        announce target(payload), t("join")
      end

      def announce_part(payload)
        announce target(payload), t("part")
      end

      def announce(target,message)
        robot.send_message target, message
      end

      private

      def target(payload)
        Source.new(room: payload[:room])
      end

    end

    Lita.register_handler(Announcer)
  end
end
