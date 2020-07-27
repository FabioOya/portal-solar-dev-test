require 'rails_helper'

feature 'User view generator details' do
  scenario 'succesfully' do
    pg = PowerGenerator.find(1)
    visit root_path

    within("div#pg-#{pg.id}") do
      click_on 'Ver Detalhes'
    end

    expect(page).to have_content('Detalhes do gerador')
    expect(page).to have_content('R$ 49.990,00')
    expect(page).to have_content(pg.name)
    expect(page).to have_content(pg.manufacturer)
    expect(page).to have_content(pg.structure_type)
    expect(page).to have_content(pg.height)
    expect(page).to have_content(pg.width)
    expect(page).to have_content(pg.lenght)
    expect(page).to have_content(pg.weight)
    expect(page).to have_content(pg.kwp)
  end
end