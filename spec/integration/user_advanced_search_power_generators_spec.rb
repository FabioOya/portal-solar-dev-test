require 'rails_helper'

feature 'User advanced search power generator' do
  scenario 'input all fields receives specific result' do
    visit root_path
    
    click_on 'Pesquisa Avançada'
    fill_in 'Palavra-chave', with: '380V'
    select 'metalico', from: 'Estrutura'
    select 'WEG', from: 'Fabricante'
    fill_in 'Preço Minimo', with:'0'
    fill_in 'Preço Máximo', with:'500000'
    fill_in 'Kwp', with: 17.34
    click_on 'Pesquisar'

    expect(page).to have_content('TRIFÁSICO 380V')
    expect(page).not_to have_content(PowerGenerator.find(8))
  end

  scenario 'searches with partially data' do
    visit root_path
    
    click_on 'Pesquisa Avançada'
    fill_in 'Palavra-chave', with: ''
    select 'WEG', from: 'Fabricante'
    fill_in 'Preço Minimo', with:''
    fill_in 'Preço Máximo', with:''
    fill_in 'Kwp', with: ''
    click_on 'Pesquisar'

    expect(page).to have_content('TRIFÁSICO 380V')
    expect(page).to have_content('WEG HÍBRIDO') 
  end

  scenario 'inputs nonsense data and receive no matches' do
    visit root_path
    
    click_on 'Pesquisa Avançada'
    fill_in 'Palavra-chave', with: '312312312312312'
    select 'WEG', from: 'Fabricante'
    fill_in 'Preço Minimo', with:''
    fill_in 'Preço Máximo', with:''
    fill_in 'Kwp', with: ''
    click_on 'Pesquisar'

    expect(page).to have_content('Nenhum resultado encontrado')
  end

  scenario 'receive all generators case all inputs empty' do
    power_generators = PowerGenerator.all
    visit root_path
    
    click_on 'Pesquisa Avançada'
    fill_in 'Palavra-chave', with: ''
    fill_in 'Preço Minimo', with:''
    fill_in 'Preço Máximo', with:''
    fill_in 'Kwp', with: ''
    click_on 'Pesquisar'
    
    #expect(page).to have_content(power_generators.pluck(:name))
    expect(page).to have_content('TRIFÁSICO 380V')
    expect(page).to have_content('YC600 MONOFÁSICO')
    expect(page).to have_content('POLI HALF CELL')
    expect(page).to have_content('CELLS MONO PERC')
    expect(page).to have_content('WEG HÍBRIDO')
    expect(page).to have_content('FRONIUS METALICA')
    expect(page).to have_content('FRONIUS TRAPEZOIDAL')
    expect(page).to have_content('FRONIUS LAJE')
    expect(page).to have_content('REFUSOL LAJE')
    expect(page).to have_content('SMA SOLO')
    expect(page).to have_content('REFUSOL SOLO')
    expect(page).to have_content('MONO PERC')
    expect(page).to have_content('POLI HALF CELL PRIMO')
    expect(page).to have_content('TRINA LAJE PLUS')
  end
end