# frozen_string_literal: true

require 'securerandom'
require 'date'
require_relative 'random_data/version'
require_relative 'random_data/data'

module Philiprehberger
  module RandomData
    class Error < StandardError; end

    # Generate a random full name
    #
    # @return [String] first and last name
    def self.name
      "#{first_name} #{last_name}"
    end

    # Generate a random first name
    #
    # @return [String] first name
    def self.first_name
      FIRST_NAMES.sample
    end

    # Generate a random last name
    #
    # @return [String] last name
    def self.last_name
      LAST_NAMES.sample
    end

    # Generate a random email address
    #
    # @return [String] email address
    def self.email
      fn = first_name.downcase
      ln = last_name.downcase
      domain = EMAIL_DOMAINS.sample
      separator = ['.', '_', ''].sample
      "#{fn}#{separator}#{ln}@#{domain}"
    end

    # Generate a random phone number
    #
    # @return [String] formatted phone number
    def self.phone
      format = PHONE_FORMATS.sample
      format.gsub('#') { rand(10).to_s }
    end

    # Generate a random UUID v4
    #
    # @return [String] UUID string
    def self.uuid
      SecureRandom.uuid
    end

    # Generate a random sentence
    #
    # @param words [Integer] number of words
    # @return [String] sentence with capitalized first word and period
    def self.sentence(words: rand(5..15))
      selected = Array.new(words) { LOREM_WORDS.sample }
      selected[0] = selected[0].capitalize
      "#{selected.join(' ')}."
    end

    # Generate a random paragraph
    #
    # @param sentences [Integer] number of sentences
    # @return [String] paragraph of sentences
    def self.paragraph(sentences: rand(3..7))
      Array.new(sentences) { sentence }.join(' ')
    end

    # Generate a random integer within a range
    #
    # @param range [Range] range of integers
    # @return [Integer] random integer
    def self.integer(range = 0..100)
      rand(range)
    end

    # Generate a random float within a range
    #
    # @param range [Range] range of floats
    # @return [Float] random float
    def self.float(range = 0.0..1.0)
      min = range.min.to_f
      max = range.max.to_f
      min + (rand * (max - min))
    end

    # Generate a random date within a range
    #
    # @param range [Range<Date>] range of dates
    # @return [Date] random date
    def self.date(range = nil)
      if range
        start_date = range.min
        end_date = range.max
        days = (end_date - start_date).to_i
        start_date + rand(0..days)
      else
        today = Date.today
        today - rand(0..365)
      end
    end

    # Generate a random boolean
    #
    # @return [Boolean] true or false
    def self.boolean
      [true, false].sample
    end

    # Generate a random hex string
    #
    # @param length [Integer] number of hex characters
    # @return [String] hex string
    def self.hex(length = 16)
      SecureRandom.hex((length / 2) + 1)[0, length]
    end

    # Pick a random element from an array
    #
    # @param array [Array] source array
    # @return [Object] random element
    def self.pick(array)
      raise Error, 'Array must not be empty' if array.nil? || array.empty?

      array.sample
    end

    # Sample n random elements from an array
    #
    # @param array [Array] source array
    # @param n [Integer] number of elements
    # @return [Array] random elements
    def self.sample(array, n)
      raise Error, 'Array must not be empty' if array.nil? || array.empty?

      array.sample(n)
    end

    # Generate a random IPv4 address
    #
    # @return [String] IPv4 address
    def self.ipv4
      Array.new(4) { rand(1..254) }.join('.')
    end

    # Generate a random geographic coordinate pair.
    #
    # Latitude is drawn uniformly from `-90.0..90.0` and longitude from
    # `-180.0..180.0`. The distribution is not area-weighted — it samples
    # the latitude axis uniformly, not over a sphere — which is usually
    # what test fixtures want.
    #
    # @return [Hash{Symbol => Float}] `{ latitude:, longitude: }`
    def self.coordinates
      { latitude: float(-90.0..90.0), longitude: float(-180.0..180.0) }
    end

    # Generate a random address
    #
    # @return [Hash] address with street, city, state, zip
    def self.address
      number = rand(100..9999)
      street = "#{LAST_NAMES.sample} #{STREET_SUFFIXES.sample}"
      city = CITIES.sample
      state = STATES.sample
      zip = format('%05d', rand(10_000..99_999))
      { street: "#{number} #{street}", city: city, state: state, zip: zip }
    end

    # Generate a random company name
    #
    # @return [String] company name
    def self.company
      "#{LAST_NAMES.sample} #{COMPANY_SUFFIXES.sample}"
    end

    # Generate a random URL
    #
    # @return [String] URL
    def self.url
      scheme = URL_SCHEMES.sample
      domain = "#{LAST_NAMES.sample.downcase}#{rand(1..999)}"
      tld = URL_TLDS.sample
      "#{scheme}://#{domain}.#{tld}"
    end

    # Generate a random hex color
    #
    # @return [String] hex color string
    def self.color
      format('#%06x', rand(0x000000..0xFFFFFF))
    end

    # Generate a random password
    #
    # @param length [Integer] password length
    # @param symbols [Boolean] include symbols
    # @return [String] random password
    def self.password(length: 16, symbols: true)
      chars = [('a'..'z'), ('A'..'Z'), ('0'..'9')].flat_map(&:to_a)
      chars += %w[! @ # $ % ^ & * _ - + =] if symbols
      Array.new(length) { chars.sample }.join
    end

    # Generate a random timestamp
    #
    # @param range [Range<Time>] optional time range
    # @return [Time] random time
    def self.timestamp(range = nil)
      if range
        start_time = range.min
        end_time = range.max
        Time.at(start_time.to_f + (rand * (end_time.to_f - start_time.to_f)))
      else
        Time.now - rand(0..(365 * 24 * 60 * 60))
      end
    end

    # Generate an array of `size` items by repeatedly calling the named generator.
    # Extra options are forwarded to the generator on every call.
    #
    # @example
    #   RandomData.array(of: :email, size: 3)
    #   RandomData.array(of: :integer, size: 5, range: 1..10)
    #
    # @param of [Symbol] generator method name (must be a public method on this module other than `array`)
    # @param size [Integer] number of items to generate (must be >= 0)
    # @param opts [Hash] keyword arguments forwarded to the generator
    # @return [Array] generated items
    # @raise [Error] if `of` is not a known generator or `size` is negative
    def self.array(of:, size:, **opts)
      raise Error, 'size must be a non-negative Integer' unless size.is_a?(Integer) && size >= 0
      raise Error, "unknown generator: #{of}" unless of != :array && respond_to?(of)

      Array.new(size) do
        opts.empty? ? public_send(of) : public_send(of, **opts)
      end
    end

    # Seed Ruby's PRNG so subsequent generators produce a deterministic sequence.
    # Useful for reproducible test runs and golden-file fixtures. Note that methods
    # using `SecureRandom` (`uuid`, `hex`) are not affected — they read from the
    # OS CSPRNG.
    #
    # @param value [Integer] seed value
    # @return [Integer] the previous seed
    # @raise [Error] if `value` is not an Integer
    def self.seed!(value)
      raise Error, 'seed must be an Integer' unless value.is_a?(Integer)

      Kernel.srand(value)
    end
  end
end
