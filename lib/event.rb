require 'json'
require 'securerandom'
require 'active_support'
require 'active_support/core_ext'

class Event < Struct.new(:id, :type, :data, :metadata)
  def initialize(data, metadata = nil, id = SecureRandom.uuid)
    super(id, self.class.name, data, metadata)
    freeze
  end

  def to_json(*a)
    {
      'eventId'   => id,
      'eventType' => type,
      'data'      => data.to_json,
      'metadata'  => metadata.to_json,
    }
  end

  def self.json_create(o)
    event_class = o['eventType']
    event_class.constantize.new(
      JSON.parse(o['data']).with_indifferent_access,
      JSON.parse(o['metadata']).with_indifferent_access,
      o['eventId'])
  end
end
