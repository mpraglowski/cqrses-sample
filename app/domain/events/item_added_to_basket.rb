module Domain
  module Events
    class ItemAddedToBasket < Event
      def self.create(basket_id, product_id)
        new({basket_id: basket_id, product_id: product_id})
      end

      private
      def initialize(data)
        super(data)
      end
    end
  end
end
