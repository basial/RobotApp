require 'spec_helper'

describe 'managing credits' do
  context 'adding new credits' do
    it 'adds new credits with valid data', js: true do
      visit '/'
      expect(page).to have_text 'Log in to operate the robot!'
      click_link 'Sign up'
      expect(page).to have_text 'Sign up'
      within('form.new_user') do
        fill_in 'user_email', with: 'user@example.com'
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_button 'Sign up'
      end 
      expect(page).to have_text 'Logged in as user@example.com'
      click_link 'Buy more credits'
      expect(page).to have_text 'With 1 credit you can play with the robot for 60 enjoyable seconds!'
      within('form.new_transaction') do
        fill_in 'transaction[amount]', with: '2'
        fill_in 'transaction[first_name]', with: 'User'
        fill_in 'transaction[last_name]', with: 'Example'
        fill_in 'transaction[cc_number]', with: '370000000000002'
        fill_in 'transaction[month]', with: '3'
        fill_in 'transaction[year]', with: '2015'
        fill_in 'transaction[verification_value]', with: '000'
        click_button 'Buy credits!'
      end
      expect(page).to have_text 'Use buttons to operate the robot or write your commands in the box below.'
      expect(page).to have_text 'Current balance: 4'

      click_button 'Left'
      expect(page).to have_text 'Current balance: 3'
      sleep(2)
      click_button 'Right'
      expect(page).to have_text 'Current balance: 2'
      sleep(2)
      click_button 'Run'
      expect(page).to have_text 'Current balance: 1'
      sleep(2)
      click_button 'Forward'
      expect(page).to have_text 'Current balance: 0'
      sleep(2)
      click_button 'Backward'
      expect(page).to have_text 'Buy more credits to play with the robot!'
    end
  end
end