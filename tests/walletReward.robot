*** Settings ***

Resource    ../resources/base.resource

*** Test Cases ***

Deve alterar os dados do usuário

    Start session
    Select language
    logIn
    Navigate to      Carteira

*** Keywords ***

Navigate to
    [Arguments]    ${menu_item}

    ${item_text}     Set Variable    xpath=//android.view.ViewGroup[@content-desc="${menu_item}"]
    Wait Until Element Is Visible    ${item_text}
    Click Element                    ${item_text}    
    Wait Until Element Is Visible    ${item_text}

    # Wait Until Element Is Visible    xpath=//android.view.View[@text="${checkout_perfil}"]
    # Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="${USER1["name"]}"]
    # Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="${USER1["email"]}"]
    # Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Português (Brasil)"]
    # Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Fale conosco"]
    # Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Regulamento e Termos de uso"]
    # Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Carteirinha"]
    # Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Minhas Compras"]
    # Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Encerrar conta"]
    # Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Sair"]
    
    # ${user_data}     Set Variable    xpath=//android.widget.TextView[@text="${menu_data}"]
    # Wait Until Element Is Visible    ${user_data}
    # Click Element                    ${user_data}
    # Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="${menu_data}"]
    # Wait Until Element Is Visible    xpath=//android.view.View[@text="${checkout_data}"]     
    # Wait Until Element Is Visible    xpath=//android.view.View[@text="Dados do Usuário"]     

# Close session  
#     Close Application    