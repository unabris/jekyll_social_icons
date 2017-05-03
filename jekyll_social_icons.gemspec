# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll_social_icons/version'

Gem::Specification.new do |spec|
  spec.name          = 'jekyll_social_icons'
  spec.version       = JekyllSocialIcons::VERSION
  spec.authors       = ['Unai Abrisketa']
  spec.email         = ['unai.abrisqueta@gmail.com']

  spec.summary       = %q{Jekyll plugin to render your social networks icons}
  spec.homepage      = 'https://github.com/unabris/jekyll_social_icons'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
end
