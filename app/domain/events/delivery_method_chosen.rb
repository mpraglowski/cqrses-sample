module Domain
  module Events
    class DeliveryMethodChosen < Event
      def self.create(order_id, delivery_method_code)
        new({order_id: order_id, delivery_method_code: delivery_method_code})
      end

      private
      def initialize(data)
        super(data)
      end
    end
  end
end
