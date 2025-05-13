*** Settings ***

Resource    ../resources/base.resource
Suite Setup    Set Appium Timeout    20s

*** Variables ***

${INSTANCE_COUNT}    9  # Quantidade de campos de texto em "Atualizar dados do usuário"

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
    Start session
    Select language
    logIn

Quando o usuário acessa a tela de edição de dados
    Navigate to    Mais    Perfil    Atualizar dados de usuário
    Wait For Multiple Text Fields

E altera os dados com novas informações
    Edit User Data

E retorna os dados originais do usuário
    Return User Data

Então os dados exibidos devem estar corretos
    Validate User1 Fields


Navigate to
    [Arguments]    ${menu_item}    ${checkout_perfil}    ${menu_data}

    ${item_text}     Set Variable    xpath=//android.view.ViewGroup[@content-desc="${menu_item}"]
    Wait Until Element Is Visible    ${item_text}
    Click Element                    ${item_text}    

    ${perfil_item}     Set Variable  xpath=//android.widget.TextView
    Wait Until Element Is Visible    xpath=//android.view.View[@text="${checkout_perfil}"]
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

Edit User Data

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

Return User Data

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

Validate User1 Fields

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