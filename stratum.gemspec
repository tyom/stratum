# -*- encoding: utf-8 -*-

$:.push File.expand_path("../lib", __FILE__)
require "stratum/version"

Gem::Specification.new do |s|
  s.name          = 'stratum'
  s.version       = Stratum::VERSION
  s.summary       = "A structural layer for your SASS"
  s.description   = "Stratum is a collection of SASS mixins and utilities for your web development needs."
  s.authors       = ["Tyom Semonov"]
  s.email         = 'tyom@semonov.com'
  s.files         = `git ls-files | grep -v demo`.split("\n")
  s.executables   << 'stratum'
  s.homepage      = 'http://rubygems.org/gems/stratum'

  s.require_paths = ["lib"]

  s.add_dependency('thor')
end
