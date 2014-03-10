# -*- encoding: utf-8 -*-
require File.expand_path('../lib/spree/alchemy/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Tyler Smart"]
  gem.email         = ["tyleresmart@gmail.com"]
  gem.description   = %q{A Spree connector to Alchemy CMS}
  gem.summary       = %q{Let Spree be your main site and dynamically inject content into your site via Alchemy}
  gem.homepage      = ""
  gem.license       = 'BSD New'
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "spree_alchemy"
  gem.require_paths = ["lib"]
  gem.version       = Spree::Alchemy::VERSION

  gem.add_dependency('alchemy_cms', ['~> 3.0.0.rc4'])
  gem.add_dependency('spree', ['>= 2.1', '< 3.0'])
  gem.add_dependency('spree', ['>= 2.1', '< 3.0'])
end
