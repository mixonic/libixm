# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{libixm}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Matthew Beale"]
  s.date = %q{2009-09-20}
  s.description = %q{The Illuminato X Machina is a module hardware unit for scalable and robust computing.  More at: http://www.liquidware.com/shop/show/IXM/Illuminato+X+Machina}
  s.email = %q{mixonic@synitech.com}
  s.extra_rdoc_files = [
    "README.mkd"
  ]
  s.files = [
    "README.mkd",
     "VERSION",
     "examples/yodel_with_echo_packet.rb",
     "lib/adapters/sfbprog.rb",
     "lib/interfaces/simple.rb",
     "lib/libixm.rb",
     "libixm.rb",
     "sketches/packet_echo.hex"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/mixonic/libixm}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{LibIXM is a Ruby interface for the IXM platform}
  s.test_files = [
    "examples/yodel_with_echo_packet.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
