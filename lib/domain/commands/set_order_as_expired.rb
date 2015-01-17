module Domain
  module Commands
    class SetOrderAsExpired < Command
      attribute :order_id, String
      validates :order_id, presence: true

      alias :aggregate_id :order_id
    end
  end
end

