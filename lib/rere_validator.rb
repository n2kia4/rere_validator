require "rere_validator/version"
require "rere_validator/reserved_words"

class RegexReservedValidator < ActiveModel::EachValidator
  DEFAULT_MESSAGE = {
    :reserved_words => "can't be used a reserved words"
  }.freeze

  def validate_each(record, attribute, value)
    if reserved?(value)
      add_error(record, attribute, :reserved_words)
    end
  end

  def add_error(record, attr_name, message)
    message_options = {
      default: [DEFAULT_MESSAGE[message], options[:message]],
      scope: [:errors, :messages]
    }
    record.errors.add(attr_name, I18n.t(message, message_options))
  end

  def reserved?(value)
    RESERVED_WORDS.include?(value.downcase)
  end
end
