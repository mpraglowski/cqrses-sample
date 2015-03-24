require 'domain_event'

module Domain
  module Events
    class OrderExpired
      include DomainEvent
      include Virtus.model

      attribute :order_id, String

      def self.create(order_id)
        new({order_id: order_id})
      end
    end
  end
end
