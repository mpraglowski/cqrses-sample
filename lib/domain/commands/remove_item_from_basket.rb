module Domain
  module Commands
    class RemoveItemFromBasket < Command
      attribute :order_id, String
      attribute :product_id, Integer

      validates :order_id, presence: true
      validates :product_id, presence: true

      alias :aggregate_id :order_id
    end
  end
end
