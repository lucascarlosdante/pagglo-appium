*** Settings ***

Resource    ../resources/base.resource
Suite Setup    Set Appium Timeout    20s

*** Variables ***

${INSTANCE_COUNT}    9  # Quantidade de campos de texto em "Atualizar dados do usuário"
${TEXT_VIEW}    xpath=//android.widget.TextView

*** Test Cases ***

Deve validar as informações da página "Home"

    [Tags]    bdd

    Dado que o app foi iniciado e o usuário está logado
    Quando o usuário acessa a Home Page do app
    Então os dados exibidos devem estar corretos

*** Keywords ***

Dado que o app foi iniciado e o usuário está logado
    Start session
    Select language
    logIn

Quando o usuário acessa a Home Page do app
    Acessar Menu     Home
    Esperar por    ${logo_homepage}

Então os dados exibidos devem estar corretos
    Validate HomePage Texts


Acessar Menu    
    [Arguments]    ${menu_item}

    ${item_text}     Set Variable    ${TEXT_VIEW}\[@text="${menu_item}"\]
    Wait Until Element Is Visible    ${item_text}
    Click Element                    ${item_text}

Esperar por
    [Arguments]    ${page_header}

    Wait Until Element Is Visible    ${page_header}


Validate HomePage Texts

    Wait Until Element Is Visible    ${TEXT_VIEW}\[@text="Bem-vindo,"]
    ${bem_vindo}        Get Text     ${TEXT_VIEW}\[@text="Bem-vindo,"]
    Should Be Equal                 ${bem_vindo}        Bem-vindo,

    Wait Until Element Is Visible    ${TEXT_VIEW}\[@text="Quentin Alves"]
    ${nome_usuario}     Get Text     ${TEXT_VIEW}\[@text="Quentin Alves"]
    Should Be Equal                 ${nome_usuario}     Quentin Alves


    Wait Until Element Is Visible    ${TEXT_VIEW}\[@text="Junte Loopis"]
    ${junte_loopis}     Get Text     ${TEXT_VIEW}\[@text="Junte Loopis"]
    Should Be Equal                 ${junte_loopis}     Junte Loopis


    Wait Until Element Is Visible    ${TEXT_VIEW}\[@text="Loopi Teams"]
    ${loopi_teams}      Get Text     ${TEXT_VIEW}\[@text="Loopi Teams"]
    Should Be Equal                 ${loopi_teams}      Loopi Teams

    Swipe  500  1500  500  500  800

    Wait Until Element Is Visible    ${TEXT_VIEW}\[@text="Troque Loopis"]
    ${troque_loopis}    Get Text     ${TEXT_VIEW}\[@text="Troque Loopis"]
    Should Be Equal                 ${troque_loopis}    Troque Loopis

    Wait Until Element Is Visible    ${TEXT_VIEW}\[@text="Loopi Games"]
    ${loopi_games}      Get Text     ${TEXT_VIEW}\[@text="Loopi Games"]
    Should Be Equal                 ${loopi_games}      Loopi Games

    Swipe  500  1500  500  250  800

    Wait Until Element Is Visible    ${TEXT_VIEW}\[@text="Ingressos & Eventos"]
    ${ingressos_eventos}    Get Text    ${TEXT_VIEW}\[@text="Ingressos & Eventos"]
    Should Be Equal                ${ingressos_eventos}    Ingressos & Eventos

    Wait Until Element Is Visible    ${TEXT_VIEW}\[@text="Loopi Store"]
    ${loopi_store}      Get Text     ${TEXT_VIEW}\[@text="Loopi Store"]
    Should Be Equal                 ${loopi_store}      Loopi Store

    Swipe  500  1500  500  500  800

    Wait Until Element Is Visible    ${TEXT_VIEW}\[@text="Loopi Experiências"]
    ${loopi_experiencias}    Get Text    ${TEXT_VIEW}\[@text="Loopi Experiências"]
    Should Be Equal                 ${loopi_experiencias}    Loopi Experiências

    Swipe  500  1500  500  500  800

    Wait Until Element Is Visible    ${TEXT_VIEW}\[@text="Informações e Suporte"]
    ${informacoes_suporte}    Get Text    ${TEXT_VIEW}\[@text="Informações e Suporte"]
    Should Be Equal                 ${informacoes_suporte}    Informações e Suporte
