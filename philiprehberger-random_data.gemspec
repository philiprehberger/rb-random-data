# frozen_string_literal: true

require_relative 'lib/philiprehberger/random_data/version'

Gem::Specification.new do |spec|
  spec.name = 'philiprehberger-random_data'
  spec.version = Philiprehberger::RandomData::VERSION
  spec.authors = ['philiprehberger']
  spec.email = ['philiprehberger@users.noreply.github.com']

  spec.summary = 'Lightweight random test data generator for names, emails, and common types'
  spec.description = 'Generate random test data including names, emails, phone numbers, UUIDs, sentences, ' \
                     'paragraphs, dates, numbers, and more. Includes 50 first names, 50 last names, and ' \
                     'lorem ipsum words for realistic test fixtures.'
  spec.homepage = 'https://github.com/philiprehberger/rb-random-data'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.1'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/blob/main/CHANGELOG.md"
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files = Dir['lib/**/*.rb', 'LICENSE', 'README.md', 'CHANGELOG.md']
  spec.require_paths = ['lib']
end
