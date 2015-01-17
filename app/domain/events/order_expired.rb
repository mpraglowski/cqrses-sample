module Domain
  module Events
    class OrderExpired < Event
      def self.create(order_id)
        new({order_id: order_id})
      end

      private
      def initialize(data)
        super(data)
      end
    end
  end
end
