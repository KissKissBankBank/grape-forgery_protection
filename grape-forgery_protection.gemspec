$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'grape/forgery_protection/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'grape-forgery_protection'
  s.version     = Grape::ForgeryProtection::VERSION
  s.authors     = ['Cyril LEPAGNOT']
  s.email       = ['cyril.lepagnot@kisskissbankbank.com']
  s.homepage    = 'https://github.com/KissKissBankBank/grape-forgery_protection'
  s.summary     = 'Protect your Grape API from forgery attacks.'
  s.description = 'Protect your Grape API from forgery attacks.'
  s.license     = 'MIT'

  s.files = Dir['{lib}/**/*',
                'LICENSE',
                'Rakefile',
                'README.md']

  s.add_dependency 'grape'

  # Code quality checker
  s.add_development_dependency 'fashion_police'

  # Code review automation
  s.add_development_dependency 'pronto'

  # Rubocop Adapter for pronto
  s.add_development_dependency 'pronto-rubocop'

  # Debugger
  s.add_development_dependency 'pry'
  s.add_development_dependency 'pry-byebug'
  # Specs
  s.add_development_dependency 'test-unit' # required for ruby > 2.1
end
