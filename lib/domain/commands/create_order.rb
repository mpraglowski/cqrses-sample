module Domain
  module Commands
    class CreateOrder < Command
      attribute :order_id, String
      attribute :customer_id, Integer

      validates :order_id, presence: true
      validates :customer_id, presence: true

      alias :aggregate_id :order_id
    end
  end
end

