*** Settings ***
Resource        ../resource/Resource.robot
Test Setup      Abrir navegador
Test Teardown   Fechar navegador

*** Variables ***
${URL}          http://automationpractice.com
${BROWSER}      chrome

*** Test Case ***
Cenário 01: Pesquisar produto existente
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "Blouse"
    Então o produto "Blouse" deve ser listado na página de resultado da busca

Cenário 02: Pesquisar produto não existente
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "itemNãoExistente"
    Então a página deve exibir a mensagem "No results were found for your search "itemNãoExistente""

Cenário 03: Listar Produtos
    Dado que estou na página home do site
    Quando eu acessar a categoria "Women"
    E consultar a sub-categoria "Summer Dresses"
    Então a página deve exibir os produtos da sub-categoria "Summer Dresses"

Cenário 04: Adicionar Produtos no Carrinho
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "t-shirt"
    E adicionar o produto no carrinho
    Então a tela do carrinho deve ser mostrada juntamente cos dados e valores do produto

Cenário 05: Remover Produtos
    Dado que estou na página home do site
    E existe o produto "t-shirt" adicionado no carrinho
    Quando excluir o produto do carrinho
    Então a página deve exibir a mensagem "Your shopping cart is empty."

Cenário 06: Adicionar Cliente
    Dado que estou na página home do site
    Quando eu solictar cadastro de novo cliente
    Então o cadastro deve ser efetuado com sucesso

