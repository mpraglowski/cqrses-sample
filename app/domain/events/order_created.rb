module Domain
  module Events
    class OrderCreated < Event
      def self.create(customer_id, basket_id)
        new({customer_id: customer_id, basket_id: basket_id})
      end

      private
      def initialize(data)
        super(data)
      end
    end
  end
end
