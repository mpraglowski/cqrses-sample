module Domain
  module CommandHandlers
    class AddItemToBasket
      def call(command)
        puts command.inspect
      end
    end
  end
end
