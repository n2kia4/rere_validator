# RereValidator

Custom validator for ActiveModel.

Provides regex and reserved words to username.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rere_validator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rere_validator

## Usage

Set the validation to your ActiveModel:

```ruby
class User < ActiveRecord
  validates :username, regex_reserved: true
end
```

If you want to add reserved words:

```ruby
class User < ActiveRecord
  validates :username, regex_reserved: {
    add_reserved_words: %w[tweet retweet]
  }
end
```

### Error Messages

You can define new error messages using the I18n system:

```yaml
en:
  errors:
    messages:
      invalid_characters: "can't contain invalid characters"
      invalid_characters_at_begin: "can't begin with '.', '-', '_'"
      invalid_characters_at_end: "can't end with '.', '-', '_'"
      reserved_words: "can't be used a reserved words"
```

