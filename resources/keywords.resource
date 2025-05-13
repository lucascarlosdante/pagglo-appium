*** Settings ***

Resource    ../resources/variables.resource

*** Variables ***

*** Keywords ***
Dado que o usuário iniciou a sessão no app
    [Documentation]     Teste de abertura do app
    Open Application    http://localhost:4723
    ...                 platformName=Android
    ...                 deviceName=Android Emulator
    ...                 automationName=UIAutomator2
    ...                 app=${EXECDIR}/app/app-loopiclub-release.apk
    ...                 udid=emulator-5554
    ...                 autoGrantPermissions=true

E o usuário seleciona o idioma
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout

    # Wait Until Page Contains    Select a language
    Wait Until Page Contains    Selecione uma linguagem
    Wait Until Page Contains    ${LANGUAGE}
    Click Text                  ${LANGUAGE}

Quando o usuário faz login
    ${email}     Set Variable        xpath=//android.widget.EditText[@text="E-mail"]
    Input Text                       ${email}      ${USER1["email"]}
    
    ${senha}     Set Variable        xpath=//android.widget.EditText[@text="Senha"]
    Input Text                       ${senha}      ${USER1["senha"]}

    ${entrar}     Set Variable       xpath=//android.widget.TextView[@text="ENTRAR"]
    Click Element                    ${entrar}

Então a tela inicial do app é carregada corretamente

    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]

Acessar Menu    
    [Arguments]    ${menu_item}

    ${item_text}     Set Variable    ${TEXT_VIEW}\[@text="${menu_item}"\]
    Wait Until Element Is Visible    ${item_text}
    Click Element                    ${item_text}

Esperar por
    [Arguments]    ${page_header}

    Wait Until Element Is Visible    ${page_header}

Navigate to
    [Arguments]    ${menu_item}    ${checkout_perfil}    ${menu_data}

    ${item_text}     Set Variable    xpath=//android.view.ViewGroup[@content-desc="${menu_item}"]
    Wait Until Element Is Visible    ${item_text}
    Click Element                    ${item_text}    

    ${perfil_item}     Set Variable  xpath=//android.widget.TextView
    Wait Until Element Is Visible    xpath=//android.view.View[@text="${checkout_perfil}"]
    # Wait Until Element Is Visible    ${perfil_item}\[@text="${USER2["name"]} ${USER2["lastname"]}"]
    Wait Until Element Is Visible    ${perfil_item}\[@text="${USER1["name"]} ${USER1["lastname"]}"]
    Wait Until Element Is Visible    ${perfil_item}\[@text="${USER1["email"]}"]
    Wait Until Element Is Visible    ${perfil_item}\[@text="Português (Brasil)"]
    Wait Until Element Is Visible    ${perfil_item}\[@text="Fale conosco"]
    Wait Until Element Is Visible    ${perfil_item}\[@text="Regulamento e Termos de uso"]
    Wait Until Element Is Visible    ${perfil_item}\[@text="Carteirinha"]
    Wait Until Element Is Visible    ${perfil_item}\[@text="Minhas Compras"]
    Wait Until Element Is Visible    ${perfil_item}\[@text="Encerrar conta"]
    Wait Until Element Is Visible    ${perfil_item}\[@text="Sair"]
    
    ${user_data}     Set Variable    xpath=//android.widget.TextView[@text="${menu_data}"]
    Wait Until Element Is Visible    ${user_data}
    Click Element                    ${user_data}
    Wait Until Element Is Visible    xpath=//android.view.View[@text="Dados do Usuário"]     

    ${user_data2}    Set Variable    xpath=//android.widget.EditText[@text="CPF"]
    Wait Until Element Is Visible    ${user_data2}

Wait For Multiple Text Fields

    FOR    ${index}    IN RANGE    0    ${INSTANCE_COUNT}
        ${xpath_locator}    Set Variable    xpath=//android.widget.EditText[${index + 1}]
        Wait Until Element Is Visible    ${xpath_locator}
    END

Edita os dados do usuário
    # [Arguments]    ${userId}    

    # ${user_dict}    Get Variable Value    ${userId}
    
    # Input Text    ${field_cpf}        ${user_dict["cpf"]}
    # Input Text    ${field_name}       ${user_dict["name"]}
    # Input Text    ${field_lastname}   ${user_dict["lastname"]}
    # Input Text    ${field_telefone}   ${user_dict["telefone"]}
    # Input Text    ${field_apelido}    ${user_dict["apelido"]}
    # Input Text    ${field_instagram}  ${user_dict["instagram"]}
    # Input Text    ${field_facebook}   ${user_dict["facebook"]}
    # Input Text    ${field_tiktok}     ${user_dict["tiktok"]}

    Input Text    ${field_cpf}         ${USER2["cpf"]}
    Input Text    ${field_name}        ${USER2["name"]}
    Input Text    ${field_lastname}    ${USER2["lastname"]}
    Input Text    ${field_telefone}    ${USER2["telefone"]}
    Input Text    ${field_apelido}     ${USER2["apelido"]}
    Input Text    ${field_instagram}   ${USER2["instagram"]}
    Input Text    ${field_facebook}    ${USER2["facebook"]}
    Input Text    ${field_tiktok}      ${USER2["tiktok"]}

    Click Element                      xpath=//android.view.ViewGroup[@content-desc="Confirmar"]
    
    Wait Until Element Is Visible      id=android:id/button1
    Click Element                      id=android:id/button1

Retorna os Dados de Usuário

    Wait Until Element Is Visible      xpath=//android.widget.TextView[@text="Atualizar dados de usuário"]
    Click Element                      xpath=//android.widget.TextView[@text="Atualizar dados de usuário"]

    Wait Until Element Is Visible      xpath=//android.view.View[@text="Dados do Usuário"]     

    Input Text    ${field_cpf}         ${USER1["cpf"]}
    Input Text    ${field_name}        ${USER1["name"]}
    Input Text    ${field_lastname}    ${USER1["lastname"]}
    Input Text    ${field_telefone}    ${USER1["telefone"]}
    Input Text    ${field_apelido}     ${USER1["apelido"]}
    Input Text    ${field_instagram}   ${USER1["instagram"]}
    Input Text    ${field_facebook}    ${USER1["facebook"]}
    Input Text    ${field_tiktok}      ${USER1["tiktok"]}

    Click Element                      xpath=//android.view.ViewGroup[@content-desc="Confirmar"]
    
    Wait Until Element Is Visible      id=android:id/button1
    Click Element                      id=android:id/button1

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

Validar textos da página "Home"

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

Validar textos da página "Ranking"

    Wait Until Element Is Visible    ${TEXT_VIEW}\[@text="Últimos 7 dias"]
    ${filter}     Get Text     ${TEXT_VIEW}\[@text="Últimos 7 dias"]
    Should Be Equal                 ${filter}     Últimos 7 dias

    Wait Until Element Is Visible    ${TEXT_VIEW}\[@text="Período"]
    ${period}     Get Text     ${TEXT_VIEW}\[@text="Período"]
    Should Be Equal                 ${period}     Período

    Wait Until Element Is Visible    ${TEXT_VIEW}\[@text="Aplicar"]
    ${filter_button}     Get Text     ${TEXT_VIEW}\[@text="Aplicar"]
    Should Be Equal                 ${filter_button}     Aplicar

    Wait Until Element Is Visible    ${TEXT_VIEW}\[@text="Histórico de transações"]
    ${history_title}        Get Text     ${TEXT_VIEW}\[@text="Histórico de transações"]
    Should Be Equal                 ${history_title}        Histórico de transações


Validar texto da página "Wallet"
    Wait Until Element Is Visible    ${TEXT_VIEW}\[@text="Participando"]