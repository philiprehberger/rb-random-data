# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Philiprehberger::RandomData do
  it 'has a version number' do
    expect(described_class::VERSION).not_to be_nil
  end

  describe '.name' do
    it 'returns a string with first and last name' do
      result = described_class.name
      expect(result).to be_a(String)
      expect(result.split(' ').length).to eq(2)
    end

    it 'uses names from the data lists' do
      result = described_class.name
      parts = result.split(' ')
      expect(described_class::FIRST_NAMES).to include(parts[0])
      expect(described_class::LAST_NAMES).to include(parts[1])
    end
  end

  describe '.first_name' do
    it 'returns a string from the first names list' do
      expect(described_class::FIRST_NAMES).to include(described_class.first_name)
    end
  end

  describe '.last_name' do
    it 'returns a string from the last names list' do
      expect(described_class::LAST_NAMES).to include(described_class.last_name)
    end
  end

  describe '.email' do
    it 'returns a valid email format' do
      result = described_class.email
      expect(result).to match(/\A[a-z_.]+@[a-z.]+\z/)
    end

    it 'uses a known domain' do
      result = described_class.email
      domain = result.split('@').last
      expect(described_class::EMAIL_DOMAINS).to include(domain)
    end
  end

  describe '.phone' do
    it 'returns a string of digits and formatting' do
      result = described_class.phone
      expect(result).to match(/[\d\s()+-]+/)
    end

    it 'contains correct number of digits' do
      result = described_class.phone
      digits = result.gsub(/\D/, '')
      expect(digits.length).to be >= 10
    end
  end

  describe '.uuid' do
    it 'returns a valid UUID v4 format' do
      result = described_class.uuid
      expect(result).to match(/\A[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}\z/)
    end

    it 'generates unique values' do
      a = described_class.uuid
      b = described_class.uuid
      expect(a).not_to eq(b)
    end
  end

  describe '.sentence' do
    it 'returns a capitalized string ending with a period' do
      result = described_class.sentence
      expect(result).to match(/\A[A-Z]/)
      expect(result).to end_with('.')
    end

    it 'respects word count' do
      result = described_class.sentence(words: 5)
      words = result.chomp('.').split(' ')
      expect(words.length).to eq(5)
    end
  end

  describe '.paragraph' do
    it 'returns a string with multiple sentences' do
      result = described_class.paragraph(sentences: 3)
      sentence_count = result.scan(/\./).length
      expect(sentence_count).to eq(3)
    end
  end

  describe '.integer' do
    it 'returns an integer within default range' do
      result = described_class.integer
      expect(result).to be_a(Integer)
      expect(result).to be_between(0, 100)
    end

    it 'respects custom range' do
      result = described_class.integer(10..20)
      expect(result).to be_between(10, 20)
    end
  end

  describe '.float' do
    it 'returns a float within default range' do
      result = described_class.float
      expect(result).to be_a(Float)
      expect(result).to be_between(0.0, 1.0)
    end

    it 'respects custom range' do
      result = described_class.float(5.0..10.0)
      expect(result).to be_between(5.0, 10.0)
    end
  end

  describe '.date' do
    it 'returns a Date object' do
      expect(described_class.date).to be_a(Date)
    end

    it 'returns a date within default range' do
      today = Date.today
      result = described_class.date
      expect(result).to be_between(today - 365, today)
    end

    it 'respects custom range' do
      start_date = Date.new(2025, 1, 1)
      end_date = Date.new(2025, 12, 31)
      result = described_class.date(start_date..end_date)
      expect(result).to be_between(start_date, end_date)
    end
  end

  describe '.boolean' do
    it 'returns true or false' do
      result = described_class.boolean
      expect([true, false]).to include(result)
    end
  end

  describe '.hex' do
    it 'returns a hex string of default length' do
      result = described_class.hex
      expect(result).to match(/\A[0-9a-f]{16}\z/)
    end

    it 'returns a hex string of specified length' do
      result = described_class.hex(8)
      expect(result).to match(/\A[0-9a-f]{8}\z/)
    end
  end

  describe '.pick' do
    it 'returns an element from the array' do
      arr = [1, 2, 3]
      expect(arr).to include(described_class.pick(arr))
    end

    it 'raises Error for empty array' do
      expect { described_class.pick([]) }.to raise_error(described_class::Error)
    end

    it 'raises Error for nil' do
      expect { described_class.pick(nil) }.to raise_error(described_class::Error)
    end
  end

  describe '.sample' do
    it 'returns n elements from the array' do
      arr = [1, 2, 3, 4, 5]
      result = described_class.sample(arr, 3)
      expect(result.length).to eq(3)
      result.each { |item| expect(arr).to include(item) }
    end

    it 'raises Error for empty array' do
      expect { described_class.sample([], 1) }.to raise_error(described_class::Error)
    end
  end

  describe '.ipv4' do
    it 'returns a valid IPv4 format' do
      result = described_class.ipv4
      expect(result).to match(/\A\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\z/)
    end

    it 'has octets in valid range' do
      result = described_class.ipv4
      octets = result.split('.').map(&:to_i)
      octets.each { |o| expect(o).to be_between(1, 254) }
    end
  end

  describe 'data lists' do
    it 'has at least 30 first names' do
      expect(described_class::FIRST_NAMES.length).to be >= 30
    end

    it 'has at least 30 last names' do
      expect(described_class::LAST_NAMES.length).to be >= 30
    end

    it 'has lorem ipsum words' do
      expect(described_class::LOREM_WORDS.length).to be > 0
    end
  end
end
