*** Settings ***
Resource            ../resource/Resource.robot
Test Setup          Abrir navegador
Test Teardown       Fechar navegador

*** Variables ***
${URL}              http://automationpractice.com
${BROWSER}          chrome
${categoria}        Women
${first_name}       Julia
${last_name}        Potter

${senha}=    Evaluate    random.sample(range(1, 11), 6)    random

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

Cenário 04: Adicionar Produtos no carrinho
    Dado que estou na página home do site
    Quando eu digitar o nome de produto "t-shirt" no campo de pesquisa.
    E clicar no botão de pesquisa
    E Clicar no botão "Add to cart" do produto
    E Clicar no botão "Proceed to checkout
    Então tela do carrinho de compras deve ser exibido, juntamente com os dados do produto adicionado e os devidos valores

Cenário 5: Remover Produtos
    Dado que estou na página home do site
    Quando clicar no ícone carrinho de compras no menu superior direito
    E clicar no botão de remoção de produtos (delete) no produto do carrinho
    Então o sistema deve exibir a mensagem "Your shopping cart is empty."

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
    Wait until Element Is Visible     id=email_create
    ${Email}                          Generate Random String
    Input Text                        id=email_create            ${Email}@testerobot.com


E clicar no botão "Create account"
    Click Element        xpath=//*[@id="SubmitCreate"]/span/font/font

E preencher os campos obrigatórios
    Wait until Element Is Visible            xpath=//*[@id="account-creation_form"]/div[1]/h3/font/font
    Click Element                            css=input[value="2"]
    Input Text                               css=input[name="customer_firstname"]                ${first_name}
    Input Text                               css=input[name="customer_lastname"]                 ${last_name}
    Input Text                               css=input[id="passwd"]                              ${senha}
    Click Element                            css=div[id="uniform-days"]                               
    Select From List                         css=select[id="days"]                                2
    Click Element                            css=div[id="uniform-months"]
    Select From List                         css=[id="months"]                                    2
    Click Element                            css=div[id="uniform-years"]
    Select From List                         css=select[id="years"]                               2000
    Select Checkbox                          css=input[id="newsletter"]
    Select Checkbox                          css=input[id="optin"]











    

E clicar em "Register"para finalizar o cadastro.


Então a página de gerenciamento da conta deve ser exibida

Dado que estou na página home do site

Quando eu digitar o nome de produto "t-shirt" no campo de pesquisa.

E clicar no botão de pesquisa

E Clicar no botão "Add to cart" do produto

E Clicar no botão "Proceed to checkout

Então tela do carrinho de compras deve ser exibido, juntamente com os dados do produto adicionado e os devidos valores


