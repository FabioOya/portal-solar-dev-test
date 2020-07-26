require 'rails_helper'

feature 'User search power generator' do
  xscenario 'by exact name' do
 
    visit root_path
    fill_in 'Busca', with: 'YC600'
    click_on 'Buscar'

    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.email)
    expect(page).to have_content(customer.document)
    expect(page).not_to have_content(another_customer.name)
    expect(page).not_to have_content(another_customer.email)
    expect(page).not_to have_content(another_customer.document)
  end

  scenario 'by partial name' do
    visit root_path

    fill_in 'Busca', with: 'YC600'
    click_on 'Pesquisar'

    #binding.pry
    expect(page).to have_content('YC600')
  end

  xscenario 'finds nothing' do
  end
end