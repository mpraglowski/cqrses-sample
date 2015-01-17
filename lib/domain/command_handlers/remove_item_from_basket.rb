module Domain
  module CommandHandlers
    class RemoveItemFromBasket
      def call(command)
        puts command.inspect
      end
    end
  end
end
