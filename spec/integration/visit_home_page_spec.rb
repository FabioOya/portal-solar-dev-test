require 'rails_helper'

feature 'Visits home page' do
  scenario 'succesfully' do

    visit root_path

    expect(page).to have_content('Geradores de Energia')
  end

end