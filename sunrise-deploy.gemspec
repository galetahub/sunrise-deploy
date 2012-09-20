# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sunrise/deploy/version"

Gem::Specification.new do |s|
  s.name = "sunrise-deploy"
  s.version = Sunrise::Deploy::VERSION.dup
  s.platform = Gem::Platform::RUBY 
  s.summary = "Deploy for sunrise-cms"
  s.description = "Deploy module for sunrise-cms using capistrano"
  s.authors = ["Igor Galeta", "Pavlo Galeta"]
  s.email = "galeta.igor@gmail.com"
  s.rubyforge_project = "sunrise-deploy"
  s.homepage = "https://github.com/galetahub/sunrise-deploy"
  
  s.files = Dir["{lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["{spec}/**/*"]
  s.extra_rdoc_files = ["README.rdoc"]
  s.require_paths = ["lib"]
  
  s.add_dependency "capistrano"
  s.add_dependency "rvm-capistrano"
end