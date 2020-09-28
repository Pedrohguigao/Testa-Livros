# frozen_string_literal: true

describe 'testa-livros' do
  before(:each) do
    page.current_window.resize_to(1280, 800)
  end

  it 'visitar a pagina' do
    visit 'https://www.submarino.com.br/'
  end

  it 'Procurar primeiro livro' do
    visit 'https://www.submarino.com.br/produto/132450880?chave=prf_hm_bn_lig_2_livro-do-dia-2109&pfmPage=home&pfmPos=maintop5&pfm_carac=Nome%20da%20area&pfm_index=0&pfm_type=vit_spacey'
  end

  it 'Procurar autor' do
    visit 'https://www.submarino.com.br/produto/132450880/livro-harry-potter-e-o-calice-de-fogo?chave=prf_hm_bn_lig_2_livro-do-dia-2109&pfmPage=home&pfmPos=maintop5&pfm_carac=Nome%20da%20area&pfm_index=0&pfm_type=vit_spacey#author-section'
  end

  it 'Procurar o mesmo livro no site da Americanas atraves do ISNB' do
    visit 'https://www.americanas.com.br/'

    fill_in 'busque aqui seu produto', with: '9788532530813'
    click_button 'Buscar'
  end

  it 'Procurar o mesmo livro no site da Amazon atraves do ISNB' do
    visit 'https://www.amazon.com.br/'

    fill_in 'twotabsearchtextbox', with: '9788532530813'
    click_button 'Ir'
    puts 'Teste finalizado com Sucesso'
  end

  after(:each) do |e|
    nome = e.description.gsub(/[^A-Za-z0-9 ]/,'').tr(' ', '_')
    page.save_screenshot('log/' + nome + '.png')
  end

end


