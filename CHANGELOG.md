# Changelog

All notable changes to this gem will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.3.0] - 2026-04-16

### Added
- `RandomData.weighted_pick(array, weights:)` — pick an element using cumulative-weight sampling proportional to the supplied non-negative numeric weights

## [0.2.1] - 2026-03-31

### Changed
- Standardize README badges, support section, and license format

## [0.2.0] - 2026-03-31

### Added
- `RandomData.address` generating street, city, state, and zip
- `RandomData.company` generating random company names
- `RandomData.url` generating random URLs
- `RandomData.color` generating hex color strings
- `RandomData.password(length:, symbols:)` generating random passwords
- `RandomData.timestamp(range)` generating random Time objects
- GitHub issue templates, PR template, and Dependabot configuration

### Changed
- README restructured with all 8 standard badges and Support section

### Fixed
- Gemspec author and email fields corrected
- Ruby version requirement normalized to `>= 3.1.0`

## [0.1.4] - 2026-03-24

### Fixed
- Standardize README code examples to use double-quote require statements

## [0.1.3] - 2026-03-24

### Fixed
- Fix Installation section quote style to double quotes
- Remove inline comments from Development section to match template

## [0.1.2] - 2026-03-23

### Fixed
- Standardize README description to match template guide
- Update gemspec summary to match README description

## [0.1.1] - 2026-03-22

### Added
- Add bug_tracker_uri metadata to gemspec

## [0.1.0] - 2026-03-22

### Added
- Initial release
- Random name generation with 50 first names and 50 last names
- Random email and phone number generation
- UUID v4 generation
- Lorem ipsum sentence and paragraph generation
- Random integer, float, date, and boolean generation
- Hex string generation
- Array pick and sample methods
- Random IPv4 address generation
