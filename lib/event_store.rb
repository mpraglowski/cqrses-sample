require 'atom'
require 'httparty'

class EventStore
  attr_reader :host

  def initialize(host = 'http://127.0.0.1:2113')
    @host = host
  end

  def append(stream, events)
    url = build_stream_uri(stream)
    options = {
      headers: {
        'Content-Type' => 'application/vnd.eventstore.events+json'
      },
      body: serialize(Array.wrap(events))
    }
    HTTParty.post(url, options)
  end

  def read(stream)
    url = URI.parse(build_stream_uri(stream))
    feed = Atom::Feed.load_feed(url)
    return [] if feed.blank?
    events = []
    feed.each_entry(:paginate => true) do |entry|
      events << recreate_event(entry.summary,
                               read_event(entry.id))
    end
    events.reverse
  rescue Atom::LoadError => e
    return nil if e.response.code == '404'
    raise
  end

  private
  def recreate_event(type, data)
    type.constantize.new(data)
  end

  def serialize(events)
    events.map do |event|
      {
        'eventId'   => SecureRandom.uuid,
        'eventType' => event.class.name,
        'data'      => event.to_json,
      }
    end.to_json
  end

  def build_stream_uri(stream)
    "#{host}/streams/#{stream}"
  end

  def read_event(uri)
    res = HTTParty.get(uri, headers: {'Accept' => 'application/json'})
    JSON.parse(res).with_indifferent_access
  end
end
