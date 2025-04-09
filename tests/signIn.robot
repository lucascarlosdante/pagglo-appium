*** Settings ***

library    AppiumLibrary

*** Variables ***
${LANGUAGE}    Portuguese (Brazil)

*** Test Cases ***

Deve realizar um clique simples
    # Step 1
    [Documentation]     Teste de abertura do app
    Open Application    http://localhost:4723
    ...                 platformName=Android
    ...                 deviceName=Android Emulator
    ...                 automationName=UIAutomator2
    ...                 app=${EXECDIR}/app/app-loopiclub-release.apk
    ...                 udid=emulator-5554
    ...                 autoGrantPermissions=true

   # Step 1
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout

    Wait Until Page Contains    Select a language
    Wait Until Page Contains    ${LANGUAGE}
    Click Text                  ${LANGUAGE}

    # ${cadastro}     Set Variable     xpath=//android.widget.TextView[@text=" Cadastre-se"]
    # Wait Until Element Is Visible    ${cadastro}
    # Click Element                    ${cadastro}
    # Step 2
    ${email}     Set Variable        xpath=//android.widget.EditText[@text="E-mail"]
    Wait Until Element Is Visible    ${email}
    Click Element                    ${email}
    
    ${senha}     Set Variable        xpath=//android.widget.EditText[@text="Senha"]
    Wait Until Element Is Visible    ${senha}
    Click Element                    ${senha}

    # Wait Until Page Contains    LoopiClub


    # Close Application    