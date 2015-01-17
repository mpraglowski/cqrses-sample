module Domain
  module Events
    class ItemAddedToBasket < Event
      def self.create(order_id, product_id)
        new({order_id: order_id, product_id: product_id})
      end

      private
      def initialize(data)
        super(data)
      end
    end
  end
end
