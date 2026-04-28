# philiprehberger-random_data

[![Tests](https://github.com/philiprehberger/rb-random-data/actions/workflows/ci.yml/badge.svg)](https://github.com/philiprehberger/rb-random-data/actions/workflows/ci.yml)
[![Gem Version](https://badge.fury.io/rb/philiprehberger-random_data.svg)](https://rubygems.org/gems/philiprehberger-random_data)
[![Last updated](https://img.shields.io/github/last-commit/philiprehberger/rb-random-data)](https://github.com/philiprehberger/rb-random-data/commits/main)

Lightweight random test data generator for names, emails, addresses, and common types

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
require "philiprehberger/random_data"

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

### Weighted Pick

```ruby
tiers = %w[bronze silver gold]
Philiprehberger::RandomData.weighted_pick(tiers, weights: [70, 25, 5])
# => "bronze" most of the time, "gold" rarely
```

### Network

```ruby
Philiprehberger::RandomData.ipv4  # => "192.45.67.123"
Philiprehberger::RandomData.url   # => "https://smith42.com"
```

### Coordinates

```ruby
Philiprehberger::RandomData.coordinates
# => { latitude: 42.7651, longitude: -87.3419 }
```

### Address and Company

```ruby
Philiprehberger::RandomData.address
# => { street: "1234 Johnson Ave", city: "Springfield", state: "CA", zip: "90210" }

Philiprehberger::RandomData.company  # => "Garcia Solutions"
```

### Color, Password, and Timestamp

```ruby
Philiprehberger::RandomData.color      # => "#a3f7b2"
Philiprehberger::RandomData.password   # => "kQ7!mR2@nP5#xL9"
Philiprehberger::RandomData.password(length: 8, symbols: false)  # => "kQ7mR2nP"
Philiprehberger::RandomData.timestamp  # => 2025-08-14 03:22:11 +0000
```

### Bulk Generation

`array` calls a generator `size` times and forwards options on every call.

```ruby
Philiprehberger::RandomData.array(of: :email, size: 3)
# => ["alice.smith@example.com", "bob_jones@test.com", "carol.lee@demo.com"]

Philiprehberger::RandomData.array(of: :integer, size: 5, range: 1..10)
# => [3, 8, 1, 6, 9]

Philiprehberger::RandomData.array(of: :address, size: 2)
# => [{ street: ..., city: ..., state: ..., zip: ... }, ...]
```

### Deterministic Output

Seed Ruby's PRNG so subsequent calls produce a deterministic sequence. Useful
for reproducible test runs and golden-file fixtures. `uuid` and `hex` use
`SecureRandom` and are not affected.

```ruby
Philiprehberger::RandomData.seed!(42)
Philiprehberger::RandomData.integer(1..100)  # => deterministic value
Philiprehberger::RandomData.integer(1..100)  # => deterministic next value
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
| `RandomData.weighted_pick(array, weights:)` | Random element chosen proportionally to matching weights |
| `RandomData.ipv4` | Random IPv4 address |
| `RandomData.coordinates` | Random `{ latitude:, longitude: }` pair |
| `RandomData.address` | Random address hash with street, city, state, zip |
| `RandomData.company` | Random company name |
| `RandomData.url` | Random URL |
| `RandomData.color` | Random hex color string |
| `RandomData.password(length:, symbols:)` | Random password |
| `RandomData.timestamp(range)` | Random Time object |
| `RandomData.array(of:, size:, **opts)` | Generate `size` items by repeatedly calling the named generator; forwards `opts` |
| `RandomData.seed!(value)` | Seed Ruby's PRNG so subsequent generators are deterministic; returns the previous seed |

## Development

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

## Support

If you find this project useful:

⭐ [Star the repo](https://github.com/philiprehberger/rb-random-data)

🐛 [Report issues](https://github.com/philiprehberger/rb-random-data/issues?q=is%3Aissue+is%3Aopen+label%3Abug)

💡 [Suggest features](https://github.com/philiprehberger/rb-random-data/issues?q=is%3Aissue+is%3Aopen+label%3Aenhancement)

❤️ [Sponsor development](https://github.com/sponsors/philiprehberger)

🌐 [All Open Source Projects](https://philiprehberger.com/open-source-packages)

💻 [GitHub Profile](https://github.com/philiprehberger)

🔗 [LinkedIn Profile](https://www.linkedin.com/in/philiprehberger)

## License

[MIT](LICENSE)
