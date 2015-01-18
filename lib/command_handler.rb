module CommandHandler
  include StorageInjector
  include PublisherInjector

  def with_aggregate(aggregate_id)
    aggregate = build(aggregate_id)
    yield aggregate
    storage.append(stream_id(aggregate_id), aggregate.changes)
    publish(aggregate.changes)
  end

  private
  def build(aggregate_id)
    aggregate = aggregate_class.new
    events = load_events(aggregate_id)
    if events.present?
      aggregate.rebuild(events)
    end
    aggregate
  end

  def load_events(aggregate_id)
    storage.read(stream_id(aggregate_id))
  end

  def stream_id(aggregate_id)
    "#{aggregate_class.to_s}$#{aggregate_id}"
  end
end
