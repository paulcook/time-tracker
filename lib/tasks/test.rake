require 'rake/testtask'

namespace :test do
  Rake::TestTask.new(models: "test:prepare") do |t|
      t.libs << "test"
      t.test_files = Dir.glob('test/models/**/*_test.rb').sort
  end
  
  Rake::TestTask.new(controllers: "test:prepare") do |t|
      t.libs << "test"
      t.test_files = Dir.glob('test/controllers/**/*_test.rb').sort
  end
  
  Rake::TestTask.new(acceptance: "test:prepare") do |t|
      t.libs << "test"
      t.test_files = Dir.glob('test/acceptance/**/*_test.rb').sort
  end
end