*** Settings ***

Resource       ../resources/keywords.resource
Suite Setup    Set Appium Timeout    20s

*** Variables ***

${TEXT_VIEW}         xpath=//android.widget.TextView
${wallet_header}     xpath=//android.view.View[@text="Carteira"]

*** Test Cases ***

Deve validar as informações da página "Carteira"

    [Tags]    bdd

    Dado que o app foi iniciado e o usuário está logado
    Quando o usuário acessa o Ranking no app
    Então os dados exibidos devem estar corretos





*** Keywords ***

Dado que o app foi iniciado e o usuário está logado
    E que o usuário iniciou a sessão no app    loopiclub
    E o usuário seleciona o idioma    ptBr
    Quando o usuário faz login com o usuário    USER1
    Então a tela inicial do app é carregada corretamente

Quando o usuário acessa o Ranking no app    
    Acessar Menu      Carteira
    Esperar por      ${wallet_header}

Então os dados exibidos devem estar corretos
    Validar texto da página "Wallet"

# Close session  
#     Close Application    