# frozen_string_literal: true

module Philiprehberger
  module RandomData
    FIRST_NAMES = %w[
      James Mary Robert Patricia John Jennifer Michael Linda David Elizabeth
      William Barbara Richard Susan Joseph Jessica Thomas Sarah Charles Karen
      Christopher Lisa Daniel Nancy Matthew Betty Mark Sandra Donald Ashley
      Steven Emily Paul Kimberly Andrew Donna Joshua Michelle Kenneth Dorothy
      Kevin Carol Brian Amanda George Melissa Edward Deborah Ronald Stephanie
    ].freeze

    LAST_NAMES = %w[
      Smith Johnson Williams Brown Jones Garcia Miller Davis Rodriguez Martinez
      Hernandez Lopez Gonzalez Wilson Anderson Thomas Taylor Moore Jackson Martin
      Lee Perez Thompson White Harris Sanchez Clark Ramirez Lewis Robinson Walker
      Young Allen King Wright Scott Torres Nguyen Hill Flores Green Adams Nelson
      Baker Hall Rivera Campbell Mitchell Carter Roberts Gomez Phillips Evans
    ].freeze

    LOREM_WORDS = %w[
      lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod
      tempor incididunt ut labore et dolore magna aliqua enim ad minim veniam
      quis nostrud exercitation ullamco laboris nisi aliquip ex ea commodo
      consequat duis aute irure in reprehenderit voluptate velit esse cillum
      fugiat nulla pariatur excepteur sint occaecat cupidatat non proident sunt
      culpa qui officia deserunt mollit anim id est
    ].freeze

    EMAIL_DOMAINS = %w[
      example.com test.com mail.test sample.org demo.net
    ].freeze

    PHONE_FORMATS = [
      '(###) ###-####',
      '###-###-####',
      '+1 ### ### ####'
    ].freeze

    STREET_SUFFIXES = %w[St Ave Blvd Dr Ln Rd Way Ct Pl Cir].freeze

    CITIES = %w[
      Springfield Riverside Fairview Madison Clinton Franklin Greenville Bristol
      Oakland Burlington Salem Georgetown Manchester Arlington Jackson Lexington
    ].freeze

    STATES = %w[
      AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD
      MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC
      SD TN TX UT VT VA WA WV WI WY
    ].freeze

    COMPANY_SUFFIXES = %w[Inc LLC Corp Group Solutions Systems Labs Technologies].freeze

    URL_SCHEMES = %w[https http].freeze

    URL_TLDS = %w[com org net io dev app co].freeze

    # Pick a random element from +array+ using the matching probability +weights+.
    #
    # Each index in +array+ has a corresponding non-negative numeric weight in +weights+.
    # The element is selected via cumulative-weight sampling, where elements with higher
    # weights are proportionally more likely to be returned.
    #
    # @param array [Array] source array
    # @param weights [Array<Numeric>] non-negative weights, one per element
    # @return [Object] one element from +array+ chosen proportionally to its weight
    # @raise [ArgumentError] if +array+ and +weights+ differ in length,
    #   if any weight is negative, or if every weight is zero
    def self.weighted_pick(array, weights:)
      raise ArgumentError, 'array and weights must be the same length' if array.length != weights.length
      raise ArgumentError, 'weights must all be numeric' unless weights.all?(Numeric)
      raise ArgumentError, 'weights must all be non-negative' if weights.any?(&:negative?)

      total = weights.sum
      raise ArgumentError, 'weights must not all be zero' if total.zero?

      threshold = rand * total
      cumulative = 0.0
      array.each_with_index do |element, index|
        cumulative += weights[index]
        return element if threshold < cumulative
      end

      array.last
    end
  end
end
