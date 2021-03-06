class JsonValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    begin
      JSON.parse(value)
    rescue JSON::ParserError
      record.errors[attribute] << "must be valid JSON"
    end
  end
end
