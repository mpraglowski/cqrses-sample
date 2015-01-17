module Domain
  module Events
    class ItemAddedToBasket
      include Virtus.model

      attribute :order_id, String
      attribute :product_id, Integer

      def self.create(order_id, product_id)
        new({order_id: order_id, product_id: product_id})
      end
    end
  end
end
