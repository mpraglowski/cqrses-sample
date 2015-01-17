module Domain
  module Events
    class OrderCreated < Event
      def self.create(order_id, order_number, customer_id)
        new({order_id: order_id, order_number: order_number, customer_id: customer_id})
      end

      private
      def initialize(data)
        super(data)
      end
    end
  end
end
