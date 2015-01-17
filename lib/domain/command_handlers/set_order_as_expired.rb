module Domain
  module CommandHandlers
    class SetOrderAsExpired
      def call(command)
        puts command.inspect
      end
    end
  end
end
