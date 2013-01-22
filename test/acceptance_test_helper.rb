require "minitest_helper"
require "database_cleaner"

# Uncomment if you want Capybara in accceptance/integration tests
require "minitest/rails/capybara"

#Capybara.javascript_driver = :webkit
#Capybara.default_wait_time = 5
#Capybara.run_server = true
#Capybara.app_host = "http://127.0.0.1:#{Capybara.server_port}"

class MiniTest::Rails::ActionDispatch::IntegrationTest
  
  # Make the Capybara DSL available in all integration tests
  include Rails.application.routes.url_helpers
  include Capybara::DSL
  include Capybara::RSpecMatchers

  # Stop ActiveRecord from wrapping tests in transactions
  self.use_transactional_fixtures = false
  
  teardown do
    DatabaseCleaner.clean       # Truncate the database
    Capybara.reset_sessions!    # Forget the (simulated) browser state
    Capybara.use_default_driver # Revert Capybara.current_driver to Capybara.default_driver
  end
  
  def set_host (host)
    host! host
    Capybara.server_port = 3000
    @old_default_host = Capybara.default_host
    @old_app_host = Capybara.app_host
    
    Capybara.app_host = "http://" + host
  end
  
  def reset_host
    Capybara.current_session.driver.reset!
    Capybara.default_host = @old_default_host
    Capybara.app_host =  @old_app_host
  end
    
  def sign_in_as(user, password)
     visit '/'
     #page.save_screenshot('screenshot.png')
     fill_in 'Email', :with => user.email
     fill_in 'Password', :with => password
     click_link_or_button('Sign in')
     assert new_session_path != current_path, "Not Logged in: #{current_path}"
   end
     
   def sign_out
      click_link_or_button('Sign Out')
      assert_equal current_path, login_path  
   end
     
   def setup_defaults
     setup_default_data
   end
end