module Domain
  module Events
    class PaymentFailed < Event
      def self.create(order_id, payment_id, reason)
        new({order_id: order_id, payment_id: payment_id, reason: reason})
      end

      private
      def initialize(data)
        super(data)
      end
    end
  end
end
