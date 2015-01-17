class Command
  ValidationError = Class.new(StandardError)

  include Virtus.model
  include ActiveModel::Validations
  include ActiveModel::Conversion

  def validate!
    raise ValidationError, errors unless valid?
  end

  def persisted?
    false
  end
end
