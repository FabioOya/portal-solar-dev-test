require 'rails_helper'

feature 'User search power generator' do
  scenario 'by exact name' do
 
    visit root_path
    fill_in 'Busca', with: 'YC600'
    click_on 'Pesquisar'

    expect(page).to have_content('YC600')
    expect(page).not_to have_content('POLI HALF CELL')
  end

  scenario 'by partial name' do
    visit root_path

    fill_in 'Busca', with: 'POLI'
    click_on 'Pesquisar'

    expect(page).to have_content('POLI HALF CELL')
    expect(page).to have_content('POLI HALF CELL PRIMO')
    expect(page).to have_content('R$ 20.565,70')
    expect(page).to have_content('R$ 12.223,73')
    expect(page).not_to have_content('YC600')
   
  end

  scenario 'by structure type' do
    visit root_path

    fill_in 'Busca', with: 'metalico'
    click_on 'Pesquisar'

    expect(page).to have_content('TRIFÁSICO 380V')
    expect(page).to have_content('POLI HALF CELL')
    expect(page).to have_content('FRONIUS METALICA')
    expect(page).to have_content('metalico')
    expect(page).not_to have_content('Y600')
    expect(page).not_to have_content('ceramico')
  end
  
  scenario 'by manufacturer' do
    visit root_path
    fill_in 'Busca', with: 'q cells'
    click_on 'Pesquisar'

    expect(page).to have_content('CELLS MONO PERC')
    expect(page).to have_content('FRONIUS TRAPEZOIDAL')
    expect(page).to have_content('FRONIUS TRAPEZOIDAL')
    expect(page).to have_content('REFUSOL LAJE')
    expect(page).to have_content('SMA SOLO')
    expect(page).to have_content('REFUSOL SOLO')
    expect(page).to have_content('MONO PERC')
    expect(page).to have_content('Q CELLS')
    expect(page).not_to have_content('WEG')
    expect(page).not_to have_content('WEG HÍBRIDO')

  end

  scenario 'no matches' do
    visit root_path

    fill_in 'Busca', with: 'GERADOR DE ENERGIA BONITAO'
    click_on 'Pesquisar'

    expect(page).to have_content('Nenhum resultado encontrado')
  end
end