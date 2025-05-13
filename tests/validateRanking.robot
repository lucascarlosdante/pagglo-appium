*** Settings ***

Resource    ../resources/keywords.resource
Suite Setup    Set Appium Timeout    20s

*** Variables ***

${INSTANCE_COUNT}    9  # Quantidade de campos de texto em "Atualizar dados do usuário"
${TEXT_VIEW}         xpath=//android.widget.TextView
${ranking_header}    xpath=//android.view.View[@text="Ranking"]

*** Test Cases ***

Deve validar as informações da página "Ranking"

    [Tags]    bdd

    Dado que o app foi iniciado e o usuário está logado
    Quando o usuário acessa o Ranking no app
    Então os dados exibidos devem estar corretos

*** Keywords ***

Dado que o app foi iniciado e o usuário está logado
    E que o usuário iniciou a sessão no app    loopiclub
    E o usuário seleciona o idioma
    Quando o usuário faz login
    Então a tela inicial do app é carregada corretamente

Quando o usuário acessa o Ranking no app
    Acessar Menu     Ranking
    Esperar por      ${ranking_header}

Então os dados exibidos devem estar corretos
    Validar texto da página "Ranking"
