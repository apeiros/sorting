# encoding: utf-8

Gem::Specification.new do |s|
  s.name                      = "sorting"
  s.version                   = "0.0.1"
  s.authors                   = "Stefan Rusterholz"
  s.email                     = "stefan.rusterholz@gmail.com"
  s.homepage                  = "https://github.com/apeiros/sorting"

  s.description               = <<-DESCRIPTION.gsub(/^    /, '').chomp
    Helpful functionality for sorting and comparing.
  DESCRIPTION
  s.summary                   = <<-SUMMARY.gsub(/^    /, '').chomp
    Helpful functionality for sorting and comparing.
  SUMMARY

  s.files                     =
    Dir['bin/**/*'] +
    Dir['lib/**/*'] +
    Dir['rake/**/*'] +
    Dir['test/**/*'] +
    Dir['*.gemspec'] +
    %w[
      .yardopts
      LICENSE.txt
      Rakefile
      README.markdown
    ]
  s.require_paths             = %w[lib]
  if File.directory?('bin') then
    executables = Dir.chdir('bin') { Dir.glob('**/*').select { |f| File.executable?(f) } }
    s.executables = executables unless executables.empty?
  end

  s.required_ruby_version     = ">= 1.9.2"
  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1")
  s.rubygems_version          = "1.3.1"
  s.specification_version     = 3
end
