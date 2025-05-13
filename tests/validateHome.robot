*** Settings ***

Resource    ../resources/base.resource
Suite Setup    Set Appium Timeout    20s

*** Variables ***

${TEXT_VIEW}    xpath=//android.widget.TextView

*** Test Cases ***

Deve validar as informações da página "Home"

    [Tags]    bdd

    Dado que o app foi iniciado e o usuário está logado
    Quando o usuário acessa a Home Page do app
    Então os dados exibidos devem estar corretos

*** Keywords ***

Dado que o app foi iniciado e o usuário está logado
    Dado que o usuário iniciou a sessão no app
    E o usuário seleciona o idioma
    Quando o usuário faz login
    Então a tela inicial do app é carregada corretamente

Quando o usuário acessa a Home Page do app
    Acessar Menu     Home
    Esperar por    ${logo_homepage}

Então os dados exibidos devem estar corretos
    Validar textos da página "Home"
