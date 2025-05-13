*** Settings ***

Resource    ../resources/base.resource
Suite Setup    Set Appium Timeout    20s

*** Variables ***

*** Test Cases ***

Deve alterar os dados do usuário

    [Tags]    bdd

    Dado que o app foi iniciado e o usuário está logado
    Quando o usuário acessa a tela de edição de dados
    E altera os dados com novas informações
    E retorna os dados originais do usuário
    Então os dados exibidos devem estar corretos

*** Keywords ***

Dado que o app foi iniciado e o usuário está logado
    Dado que o usuário iniciou a sessão no app
    E o usuário seleciona o idioma
    Quando o usuário faz login
    Então a tela inicial do app é carregada corretamente

Quando o usuário acessa a tela de edição de dados
    Navigate to    Mais    Perfil    Atualizar dados de usuário
    Wait For Multiple Text Fields

E altera os dados com novas informações
    Edita os dados do usuário    # USER2

E retorna os dados originais do usuário
    Retorna os Dados de Usuário
    # Edita os dados do usuário    # USER1

Então os dados exibidos devem estar corretos
    Validar Dados User 1


    Wait Until Element Is Visible      xpath=//android.widget.TextView[@text="Atualizar dados de usuário"]
    Click Element                      xpath=//android.widget.TextView[@text="Atualizar dados de usuário"]

    Wait Until Element Is Visible      xpath=//android.view.View[@text="Dados do Usuário"]     

    ${name}       Get Text    ${field_name}
    Should Be Equal    ${name}       ${USER1["name"]}

    ${lastname}   Get Text    ${field_lastname}
    Should Be Equal    ${lastname}   ${USER1["lastname"]}

    ${telefone}   Get Text    ${field_telefone}
    Should Be Equal    ${telefone}   ${USER1["telefone"]}

    ${apelido}    Get Text    ${field_apelido}
    Should Be Equal    ${apelido}    ${USER1["apelido"]}

    ${instagram}  Get Text    ${field_instagram}
    Should Be Equal    ${instagram}  ${USER1["instagram"]}

    ${facebook}   Get Text    ${field_facebook}
    Should Be Equal    ${facebook}   ${USER1["facebook"]}

    ${tiktok}     Get Text    ${field_tiktok}
    Should Be Equal    ${tiktok}     ${USER1["tiktok"]}