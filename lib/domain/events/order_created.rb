require 'domain_event'

module Domain
  module Events
    class OrderCreated < DomainEvent
      include Virtus.model

      attribute :order_id, String
      attribute :order_number, String
      attribute :customer_id, Integer

      def self.create(order_id, order_number, customer_id)
        new({order_id: order_id, order_number: order_number, customer_id: customer_id})
      end
    end
  end
end
