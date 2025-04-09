*** Settings ***

Library    AppiumLibrary

*** Variables ***
${LANGUAGE}    Portuguese (Brazil)
&{USER1}    email=lucasinboxtest@gmail.com    senha=Senha1*

*** Keywords ***
Start session
    [Documentation]     Teste de abertura do app
    Open Application    http://localhost:4723
    ...                 platformName=Android
    ...                 deviceName=Android Emulator
    ...                 automationName=UIAutomator2
    ...                 app=${EXECDIR}/app/app-loopiclub-release.apk
    ...                 udid=emulator-5554
    ...                 autoGrantPermissions=true

Select language
    Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout

    Wait Until Page Contains    Select a language
    Wait Until Page Contains    ${LANGUAGE}
    Click Text                  ${LANGUAGE}

logIn
    ${email}     Set Variable        xpath=//android.widget.EditText[@text="E-mail"]
    Wait Until Element Is Visible    ${email}
    Click Element                    ${email}
    Input Text                       ${email}      ${USER1["email"]}
    
    ${senha}     Set Variable        xpath=//android.widget.EditText[@text="Senha"]
    Wait Until Element Is Visible    ${senha}
    Click Element                    ${senha}
    Input Text                       ${senha}      ${USER1["senha"]}

    ${entrar}     Set Variable       xpath=//android.widget.TextView[@text="ENTRAR"]
    Wait Until Element Is Visible    ${entrar}
    Click Element                    ${entrar}