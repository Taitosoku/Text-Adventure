require 'rake'
require 'rspec/core/rake_task'

namespace :spec do
  RSpec::Core::RakeTask.new(:all) do |t|
    t.pattern = Dir.glob('spec/**/*_spec.rb')
    t.rspec_opts = '--format documentation'
    # t.rspec_opts << ' more options'
  end

  RSpec::Core::RakeTask.new(:character) do |t|
    t.pattern = Dir.glob('spec/character_spec.rb')
    t.rspec_opts = '--format documentation'
    # t.rspec_opts << ' more options'
  end
end

task :default => :spec
