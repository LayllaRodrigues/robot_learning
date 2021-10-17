*** Settings ***
Library            SeleniumLibrary

### SETUP roda keyword antes da suite ou teste
### TEARDOWN roda keyword depois da suite ou teste

*** Variables ***
${URL}                    http://automationpractice.com
${BROWSER}                chrome
    
*** Keywords ***

Abrir navegador
    Open Browser    about:blank    ${BROWSER}

Fechar navegador
    Close Browser

Acessar a página home do site
    Go To    http://automationpractice.com
    Title Should Be    My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text    name=search_query    ${PRODUTO}

Clicar no botão pesquisar 
    Click Element    name=submit_search

Conferir se o produto "${PRODUTO}" foi listado no site 
