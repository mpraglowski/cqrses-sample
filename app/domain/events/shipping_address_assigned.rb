module Domain
  module Events
    class ShippingAddressAssigned < Event
      def self.create(order_id, shipping_address_id)
        new({order_id: order_id, shipping_address_id: shipping_address_id})
      end

      private
      def initialize(data)
        super(data)
      end
    end
  end
end
