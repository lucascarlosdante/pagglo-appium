*** Settings ***

library    AppiumLibrary

*** Test Cases ***

Deve abrir a tela inicial do app

    [Documentation]    Teste de abertura do app
    Open Application    http://localhost:4723
    ...                 platformName=Android
    ...                 deviceName=Android Emulator
    ...                 automationName=UIAutomator2
    ...                 app=${EXECDIR}/app/app-loopiclub-release.apk
    ...                 udid=emulator-5554
    ...                 autoGrantPermissions=true

    # Wait Until Page Contains    Aguarde..
    # Wait Until Page Contains    Estamos carregando as informações do aplicativo!
    # Wait Until Page Contains    We are loading the app settings!
    Wait Until Page Contains    Select a language
    Wait Until Page Contains    Portuguese (Brazil)
    Wait Until Page Contains    Portuguese (Portugal)
    Wait Until Page Contains    English
    Wait Until Page Contains    Spanish
    Wait Until Page Contains    French
    Wait Until Page Contains    Polish
    # Wait Until Page Contains    LoopiClub

    Close Application