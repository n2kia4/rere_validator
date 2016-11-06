require "rere_validator/version"
require "rere_validator/reserved_words"

class RegexReservedValidator < ActiveModel::EachValidator
  DEFAULT_MESSAGE = {
    :invalid_characters => "can't contain invalid characters",
    :invalid_characters_at_begin => "can't begin with '.', '-', '_'",
    :invalid_characters_at_end => "can't end with '.', '-', '_'",
    :reserved_words => "can't be used a reserved words"
  }.freeze

  def validate_each(record, attribute, value)
    if reserved?(value)
      add_error(record, attribute, :reserved_words)
    end

    if value !~ /\A[a-zA-Z0-9_.-]+\z/
      add_error(record, attribute, :invalid_characters)
    elsif value.match(/\A[_.-].*\z/)
      add_error(record, attribute, :invalid_characters_at_begin)
    elsif value.match(/\A.*[_.-]\z/)
      add_error(record, attribute, :invalid_characters_at_end)
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
    add_reserved_words = @options[:add_reserved_words] || []
    (RESERVED_WORDS + add_reserved_words).include?(value.downcase)
  end
end
