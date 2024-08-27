require "selenium-webdriver"

class ScreenshotJob < ApplicationJob
  queue_as :default

  include Rails.application.routes.url_helpers

  def perform(goal_id)
    goal = Goal.find(goal_id)

    # 1. set up Selenium
    options = Selenium::WebDriver::Chrome::Options.new

    driver = Selenium::WebDriver::Chrome.new(options: options, path: '/usr/local/bin/chromedriver')

    
    # 2. navigate to your site
    driver.navigate.to goal_url(goal)
    
    # 3. take a screenshot and save it to a file
    driver.save_screenshot("screenshotone.png")
    
    # 4. quit Selenium
    driver.quit  end

    private

    def default_url_options
      { host: "localhost:3000"}
    end
end
