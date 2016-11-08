require 'active_model'
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rere_validator'

class UserWithAddReservedWords
  include ActiveModel::Validations

  attr_accessor :username

  validates :username, regex_reserved: {
    add_reserved_words: %w[foobar]
  }
end
