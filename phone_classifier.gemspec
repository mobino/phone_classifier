Gem::Specification.new do |s|
  s.name        = 'phone_classifier'
  s.version     = '0.0.1'
  s.date        = '2012-11-09'
  s.summary     = "Classification of phone numbers"
  s.description = "Classifies some countries phone numbers into :mobile, :forbidden and :landline"

  s.authors     = ["Jens-Christian Fischer"]
  s.email       = 'jcf+phone_classifier@mobino.com'
  s.homepage    = 'http://github.com/mobino/phone_classifier'
  s.platform = Gem::Platform::RUBY
  s.files = Dir["lib/**/*.rb"]
  s.test_files = Dir["spec/**/*spec.rb"]
  s.has_rdoc = false
  s.extra_rdoc_files = ["README.md"]
  s.add_runtime_dependency 'phony', '~> 1.8'

end