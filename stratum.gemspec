Gem::Specification.new do |s|
  s.name        = 'stratum'
  s.version     = '0.1.1'
  s.date        = '2013-01-19'
  s.summary     = "A structural layer for your SASS"
  s.description = "Stratum is a collection of SASS mixins and utilities for your web development needs."
  s.authors     = ["Tyom Semonov"]
  s.email       = 'tyom@semonov.com'
  s.files       = `git ls-files | grep -v demo`.split("\n")
  s.executables << 'stratum'
  s.homepage    =
    'http://rubygems.org/gems/stratum'
end
