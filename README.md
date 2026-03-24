# philiprehberger-random_data

[![Tests](https://github.com/philiprehberger/rb-random-data/actions/workflows/ci.yml/badge.svg)](https://github.com/philiprehberger/rb-random-data/actions/workflows/ci.yml)
[![Gem Version](https://badge.fury.io/rb/philiprehberger-random_data.svg)](https://rubygems.org/gems/philiprehberger-random_data)
[![License](https://img.shields.io/github/license/philiprehberger/rb-random-data)](LICENSE)

Lightweight random test data generator for names, emails, and common types

## Requirements

- Ruby >= 3.1

## Installation

Add to your Gemfile:

```ruby
gem "philiprehberger-random_data"
```

Or install directly:

```bash
gem install philiprehberger-random_data
```

## Usage

```ruby
require 'philiprehberger/random_data'

Philiprehberger::RandomData.name        # => "Jessica Martinez"
Philiprehberger::RandomData.first_name  # => "Robert"
Philiprehberger::RandomData.last_name   # => "Johnson"
Philiprehberger::RandomData.email       # => "mary_smith@example.com"
Philiprehberger::RandomData.phone       # => "(555) 123-4567"
Philiprehberger::RandomData.uuid        # => "a1b2c3d4-e5f6-4a7b-8c9d-0e1f2a3b4c5d"
```

### Text

```ruby
Philiprehberger::RandomData.sentence    # => "Lorem ipsum dolor sit amet."
Philiprehberger::RandomData.paragraph   # => "Consectetur adipiscing elit..."
Philiprehberger::RandomData.sentence(words: 5)  # => "Lorem ipsum dolor sit amet."
```

### Numbers and Dates

```ruby
Philiprehberger::RandomData.integer(1..100)  # => 42
Philiprehberger::RandomData.float(0.0..1.0)  # => 0.7342
Philiprehberger::RandomData.date             # => #<Date: 2026-01-15>
Philiprehberger::RandomData.boolean          # => true
Philiprehberger::RandomData.hex(8)           # => "a3f7b2c1"
```

### Collections

```ruby
colors = %w[red green blue yellow]
Philiprehberger::RandomData.pick(colors)       # => "green"
Philiprehberger::RandomData.sample(colors, 2)  # => ["blue", "red"]
```

### Network

```ruby
Philiprehberger::RandomData.ipv4  # => "192.45.67.123"
```

## API

| Method | Description |
|--------|-------------|
| `RandomData.name` | Random full name |
| `RandomData.first_name` | Random first name |
| `RandomData.last_name` | Random last name |
| `RandomData.email` | Random email address |
| `RandomData.phone` | Random phone number |
| `RandomData.uuid` | Random UUID v4 |
| `RandomData.sentence(words:)` | Random lorem ipsum sentence |
| `RandomData.paragraph(sentences:)` | Random paragraph |
| `RandomData.integer(range)` | Random integer in range |
| `RandomData.float(range)` | Random float in range |
| `RandomData.date(range)` | Random date in range |
| `RandomData.boolean` | Random true or false |
| `RandomData.hex(length)` | Random hex string |
| `RandomData.pick(array)` | Random element from array |
| `RandomData.sample(array, n)` | Random n elements from array |
| `RandomData.ipv4` | Random IPv4 address |

## Development

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

## License

MIT
