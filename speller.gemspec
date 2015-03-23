$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'speller/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'speller'
  s.version     = Speller::VERSION
  s.authors     = ['Eugene Shuvalov']
  s.email       = ['evshuvalov@yandex.ru']
  s.homepage    = 'https://github.com/ex0rcist/speller'
  s.summary     = 'Wrapper for Yandex.Speller service'
  s.description = 'Wrapper for Yandex.Speller service'
  s.license     = 'MIT'

  s.files = Dir["{app,config,db,lib}/**/*", 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 4.1.10'
  s.add_dependency 'rest-client'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails', '~> 3.0.0.beta'
end
