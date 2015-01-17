module Domain
  module CommandHandlers
    class CreateOrder
      include CommandHandler

      def call(command)
        with_aggregate(command.aggregate_id) do |order|
          order.create(command.order_number, command.customer_id)
        end
      end

      def aggregate_class
        Domain::Order
      end
    end
  end
end
