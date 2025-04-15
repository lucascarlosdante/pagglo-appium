*** Settings ***

Resource    ../resources/base.resource

*** Variables ***
${CLASS_NAME}    android.widget.EditText
${INSTANCE_COUNT}    12  # Set this to the total number of instances you want to wait for

*** Test Cases ***

Deve alterar os dados do usuário

    Start session
    Select language
    logIn
    Navigate to      Mais    Perfil    Atualizar dados de usuário    Dados do Usuário
    Wait For Multiple Text Fields

*** Keywords ***

Navigate to
    [Arguments]    ${menu_item}    ${checkout_perfil}    ${menu_data}    ${checkout_data}

    ${item_text}     Set Variable    xpath=//android.view.ViewGroup[@content-desc="${menu_item}"]
    Wait Until Element Is Visible    ${item_text}
    Click Element                    ${item_text}    

    ${perfil_item}     Set Variable  xpath=//android.widget.TextView
    Wait Until Element Is Visible    xpath=//android.view.View[@text="${checkout_perfil}"]
    Wait Until Element Is Visible    ${perfil_item}\[@text="${USER1["name"]}"]
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
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="${menu_data}"]
    Wait Until Element Is Visible    xpath=//android.view.View[@text="${checkout_data}"]     
    # Wait Until Element Is Visible    xpath=//android.view.View[@text="Dados do Usuário"]     

    ${user_data2}    Set Variable    xpath=//android.widget.EditText[@text="CPF"]
    Wait Until Element Is Visible    ${user_data2}

# Wait For Multiple Text Fields
#     FOR    ${index}    IN RANGE    0    ${INSTANCE_COUNT}
#         # ${text_field_locator}    Set Variable    -android uiautomator=new UiSelector().className("${CLASS_NAME}").instance(${index})
#         Wait Until Element Is Visible    -android uiautomator=new UiSelector().className("${CLASS_NAME}").instance(${index})
#     END

Wait For Multiple Text Fields
    FOR    ${index}    IN RANGE    0    ${INSTANCE_COUNT}
        ${xpath_locator}    Set Variable    xpath=//${CLASS_NAME}[${index}]
        Wait Until Element Is Visible    ${xpath_locator}
    END
    
    # ${text_field}    Set Variable    -android uiautomator=new UiSelector().className("android.widget.EditText")
    # Wait Until Element Is Visible    ${text_field}.instance(0)
    # Wait Until Element Is Visible    ${text_field}.instance(1)
    # Wait Until Element Is Visible    ${text_field}.instance(2)
    # Wait Until Element Is Visible    ${text_field}.instance(3)
    # Wait Until Element Is Visible    ${text_field}.instance(4)
    # Wait Until Element Is Visible    ${text_field}.instance(5)
    # Wait Until Element Is Visible    ${text_field}.instance(6)
    # Wait Until Element Is Visible    ${text_field}.instance(7)
    # Wait Until Element Is Visible    ${text_field}.instance(8)
    # Wait Until Element Is Visible    ${text_field}.instance(9)
    # Wait Until Element Is Visible    ${text_field}.instance(10)



# Close session  
#     Close Application    