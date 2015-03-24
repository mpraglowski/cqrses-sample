module CommandHandler
  include StorageInjector
  include PublisherInjector

  def with_aggregate(aggregate_id)
    aggregate = build(aggregate_id)
    yield aggregate
    store_events(aggregate_id, aggregate.changes, aggregate.version)
    publish(aggregate.changes)
  end

  private
  def build(aggregate_id)
    aggregate = aggregate_class.new(aggregate_id)
    events = load_events(aggregate_id)
    if events.present?
      aggregate.rebuild(events)
    end
    aggregate
  end
end
