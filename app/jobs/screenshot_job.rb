require "selenium-webdriver"

class ScreenshotJob < ApplicationJob
  queue_as :default

  include Rails.application.routes.url_helpers

  def perform(goal_id)
    goal = Goal.find(goal_id)

    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--no-sandbox')
    options.add_argument('--headless') # if you are running headless
    options.add_argument('--disable-dev-shm-usage') # Add this for more stability

    driver = Selenium::WebDriver.for :chrome, options: options

    # 1. set up Selenium
    
    
    # 2. navigate to your site
    driver.navigate.to goal_url(goal)
    
    # 3. take a screenshot and save it to a file
    driver.save_screenshot("screenshotone.png")
    
    # 4. quit Selenium
    driver.quit  
  end

    private

    def default_url_options
      { host: "localhost:3000"}
    end
end
