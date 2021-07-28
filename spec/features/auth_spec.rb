require 'rails_helper'
require 'spec_helper'

feature 'signing up', type: :feature do
    scenario 'has a new user page'do
        visit new_user_url
        expect(page).to have_content "Enter Username"
        expect(page).to have_content "Enter Password"
    end

    subject(:user) { 
        User.create!(
            username: 'anthill499',
            password: 'password')
        }

    scenario 'should redirect us back to index' do
        log_in_user(user)
        visit users_url
        expect(page).to have_content "Here are the users!"
        expect(current_path).to eq(users_url)
    end
end
