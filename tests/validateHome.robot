*** Settings ***

Resource    ../resources/keywords.resource
Suite Setup    Set Appium Timeout    20s

*** Variables ***

*** Test Cases ***

Deve validar as informações da página "Home"

    [Tags]    bdd

    Dado que o app foi iniciado e o usuário está logado
    Quando o usuário acessa a Home Page do app
    Então os dados exibidos devem estar corretos

*** Keywords ***

Dado que o app foi iniciado e o usuário está logado
    E que o usuário iniciou a sessão no app    loopiclub
    E o usuário seleciona o idioma    ptBr
    Quando o usuário faz login com o usuário    USER1
    Então a tela inicial do app é carregada corretamente

Quando o usuário acessa a Home Page do app
    Acessar Menu     Home
    Esperar por    ${logo_homepage}

Então os dados exibidos devem estar corretos
    Validar textos da página "Home"
