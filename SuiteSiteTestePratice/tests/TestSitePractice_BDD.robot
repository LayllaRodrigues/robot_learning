*** Settings ***
Resource            ../resource/Resource.robot
Test Setup          Abrir navegador
Test Teardown       Fechar navegador

*** Variables ***
${URL}          http://automationpractice.com
${BROWSER}      chrome
${categoria}    Women

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
    Quando eu passar o mouse por cima da categoria ${woman}
    Então as sub categorias devem ser exibidas.

Cenário 06: Adicionar cliente 
    Dado que estou na página home do site
    Quando eu clicar no botão superior direito “Sign in”
    E inserir um e-mail válido
    E clicar no botão "Create account"
    E preencher os campos obrigatórios
    E clicar em "Register"para finalizar o cadastro.
    Então a página de gerenciamento da conta deve ser exibida


*** Keywords ***
Dado que estou na página home do site
    Acessar a página home do site

Quando eu pesquisar pelo produto "${PRODUTO}"
    Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Clicar no botão pesquisar

Então o produto "${PRODUTO}" deve ser listado na página de resultado da busca
    Conferir se o produto "${PRODUTO}" foi listado no site

Então a página deve exibir a mensagem "${MENSAGEM_ALERTA}"
    Conferir mensagem de erro "${MENSAGEM_ALERTA}"


Quando eu passar o mouse por cima da categoria "${categoria}" no menu principal superior de categorias
    Wait until Element Is Visible    xpath=//*[@id="block_top_menu"]//a[@title="${categoria}"]
    Mouse Over                       xpath=//*[@id="block_top_menu"]//a[@title="${categoria}"]

Então as sub categorias devem ser exibidas.
    Wait until Element Is Visible    xpath=//*[@id="block_top_menu"]//a[@title="Tops"]
    Page Should Contain              xpath=//*[@id="block_top_menu"]//a[@title="Tops"]
   
Quando eu clicar no botão superior direito “Sign in”
    Click Element        xpath=//*[@id="header"]/div[2]/div/div//a[@title="Log in to your customer account"]
    
E inserir um e-mail válido
    Wait until Element Is Visible
    Page Should Contain

E clicar no botão "Create account"

E preencher os campos obrigatórios

E clicar em "Register"para finalizar o cadastro.


Então a página de gerenciamento da conta deve ser exibida