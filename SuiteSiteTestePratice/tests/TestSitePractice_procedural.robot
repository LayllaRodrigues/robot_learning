*** Settings ***
Library    Selenium

*** Variables ***
${URL}                    http://automationpractice.com
${BROWSER}                chrome

*** Test Cases ***
Caso de teste 01: Pesquisar produto existente
    Acessar a página home do site
    Conferir se a palavra home foi exibida
    Digitar o nome do produto "Blouse" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir se o produto "Blouse" foi listado no site

Caso de teste 02: Pesquisar produto não existente
    Acessar a página home do site
    Conferir se a palavra home foi exibida
    Digitar o nome do produto "ItemNãoExistente" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir mensagem de erro "No results were found for your search "ItemNãoExistente""

*** Keywords ***

    
