require 'capybara/rspec'
require 'webdrivers'
require 'capybara-screenshot/rspec'

feature 'example' do

  Capybara.app_host = 'https://google.com'
  Capybara.run_server = false
  Capybara.default_driver = :selenium_chrome

  scenario 'sitelogin' do
    visit 'https://forum.awd.ru'
    find_all(:link, 'Вход').first.click
    fill_in 'username', with: '123456'
    fill_in 'password', with: '*******'
    check 'autologin'
    check 'viewonline'
    click_button 'Вход'
    expect(page).to have_content ('Информация')
    click_on 'Выход'
    expect(page).to have_content ('Вы успешно вышли из системы')
    screenshot_and_open_image
  end
end



