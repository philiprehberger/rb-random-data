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
  end
end
