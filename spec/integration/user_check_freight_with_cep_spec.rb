require 'rails_helper'

feature 'User check freight with cep' do
  scenario 'succesfully' do
    pg = PowerGenerator.find(1)
    visit root_path

    within("div#pg-#{pg.id}") do
      click_on 'Ver Detalhes'
    end

    click_on 'Consultar Frete'
    fill_in 'Digite o CEP', with: '05454040'
    click_on 'Calcular'
    
    expect(page).to have_content('Preço de Frete')
  end
end