*** Settings ***
Resource            ../resource/Resource.robot
Test Setup          Abrir navegador
Test Teardown       Fechar navegador

### SETUP: ele roda keyword antes da suite ou antes de um teste
### TEARDOWN: ele roda keyword depois de uma suite ou um teste

*** Test Case ***
Caso de Teste 01: Pesquisar produto existente
    Acessar a página home do site
    Digitar o nome do produto "Blouse" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir se o produto "Blouse" foi listado no site

Caso de Teste 02: Pesquisar produto não existente
    Acessar a página home do site
    Digitar o nome do produto "itemNãoExistente" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir mensagem "No results were found for your search "itemNãoExistente""

Caso de Teste 03: Listar Produtos
    Acessar a página home do site
    Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    Clicar na sub categoria "Summer Dresses"
    Conferir se os produtos da sub-categoria "Summer Dresses" foram mostrados na página

Caso de Teste 04: Adicionar Produtos no Carrinho
    Acessar a página home do site
    Digitar o nome do produto "t-shirt" no campo de pesquisa
    Clicar no botão pesquisar
    Clicar no botão "Add to Cart" do produto
    Clicar no botão "Proceed to checkout"
    Conferir se o produto "t-shirt" foi adicionado no carrinho com seus devidos dados e valores

Caso de Teste 05: Remover Produtos
    Acessar a página home do site
    Adicionar o produto "t-shirt" no carrinho
    Excluir o produto do carrinho
    Conferir se o carrinho fica vazio

Caso de Teste 06: Adicionar Cliente
    Acessar a página home do site
    Clicar em "Sign in"
    Informar um e-mail válido
    Clicar em "Create an account"
    Preencher os dados obrigatórios
    Submeter cadastro
    Conferir se o cadastro foi efetuado com sucesso
