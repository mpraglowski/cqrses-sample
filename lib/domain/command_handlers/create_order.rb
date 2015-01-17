module Domain
  module CommandHandlers
    class CreateOrder
      def call(command)
        puts command.inspect
      end
    end
  end
end
