# frozen_string_literal: true

require_relative 'lib/philiprehberger/random_data/version'

Gem::Specification.new do |spec|
  spec.name = 'philiprehberger-random_data'
  spec.version = Philiprehberger::RandomData::VERSION
  spec.authors = ['Philip Rehberger']
  spec.email = ['me@philiprehberger.com']

  spec.summary = 'Lightweight random test data generator for names, emails, addresses, and common types'
  spec.description = 'Generate random test data including names, emails, phone numbers, UUIDs, sentences, ' \
                     'paragraphs, dates, numbers, and more. Includes 50 first names, 50 last names, and ' \
                     'lorem ipsum words for realistic test fixtures.'
  spec.homepage = 'https://philiprehberger.com/open-source-packages/ruby/philiprehberger-random_data'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.1.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/philiprehberger/rb-random-data'
  spec.metadata['changelog_uri'] = 'https://github.com/philiprehberger/rb-random-data/blob/main/CHANGELOG.md'
  spec.metadata['bug_tracker_uri'] = 'https://github.com/philiprehberger/rb-random-data/issues'
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files = Dir['lib/**/*.rb', 'LICENSE', 'README.md', 'CHANGELOG.md']
  spec.require_paths = ['lib']
end
