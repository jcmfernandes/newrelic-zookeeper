# -*- encoding: utf-8 -*-
# stub: newrelic-zookeeper 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "newrelic-zookeeper"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Joao Fernandes"]
  s.date = "2015-11-03"
  s.description = "ZooKeeper instrumentation for New Relic."
  s.email = ["joao.fernandes@ist.utl.pt"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.md"]
  s.files = ["History.txt", "Manifest.txt", "README.md", "Rakefile", "lib/newrelic-zookeeper.rb", "lib/newrelic_zookeeper/instrumentation.rb", "lib/newrelic_zookeeper/version.rb", "newrelic-zookeeper.gemspec"]
  s.homepage = "http://github.com/jcmfernandes/newrelic-zookeeper"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--main", "README.md"]
  s.rubygems_version = "2.4.6"
  s.summary = "ZooKeeper instrumentation for New Relic."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<zookeeper>, ["~> 1.4.0"])
      s.add_runtime_dependency(%q<newrelic_rpm>, ["~> 3.11"])
      s.add_development_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_development_dependency(%q<hoe>, ["~> 3.14"])
    else
      s.add_dependency(%q<zookeeper>, ["~> 1.4.0"])
      s.add_dependency(%q<newrelic_rpm>, ["~> 3.11"])
      s.add_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_dependency(%q<hoe>, ["~> 3.14"])
    end
  else
    s.add_dependency(%q<zookeeper>, ["~> 1.4.0"])
    s.add_dependency(%q<newrelic_rpm>, ["~> 3.11"])
    s.add_dependency(%q<rdoc>, ["~> 4.0"])
    s.add_dependency(%q<hoe>, ["~> 3.14"])
  end
end
