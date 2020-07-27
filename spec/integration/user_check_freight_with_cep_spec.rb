require 'rails_helper'

feature 'User check freight with cep' do
  scenario 'succesfully' do
    pg = PowerGenerator.find(1)
    visit root_path

    within("div#pg-#{pg.id}") do
      click_on 'Ver Detalhes'
    end

    click_on 'Consultar Frete'

    expect(current_path).to eq(new_freight_path)

    fill_in 'Digite o CEP', with: '05454040'
    click_on 'Calcular'

  end
end