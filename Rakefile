require 'rake/testtask'

Rake::TestTask.new(:test) do |test|
  test.libs << "tests"
  test.test_files = FileList['tests/test*.rb']
  test.verbose = true
end

task :default => :test
