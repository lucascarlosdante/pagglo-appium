*** Settings ***

Library    AppiumLibrary

*** Variables ***

# ${LANGUAGE}    Portuguese (Brazil)
${LANGUAGE}    Português (Brasil)
&{USER1}    email=lucasinboxtest@gmail.com    senha=Senha1*    name=Quentin     lastname=Alves    cpf=04547531102    telefone=(61) 98918-9189    apelido=QA    instagram=@insta    facebook=@face    tiktok=@tiktok
&{USER2}    email=lucasinboxtest@gmail.com    senha=Senha1*    name=Quentin Alves    lastname=Novais    cpf=01234567890    telefone=61891998819    apelido=QA2    instagram=@insta2    facebook=@face2    tiktok=@tiktok2

${field_cpf}         xpath=//android.widget.EditText[1]
${field_name}        xpath=//android.widget.EditText[2]
${field_lastname}    xpath=//android.widget.EditText[3]
${field_email}       xpath=//android.widget.EditText[4]
${field_telefone}    xpath=//android.widget.EditText[5]
${field_apelido}     xpath=//android.widget.EditText[6]
${field_instagram}   xpath=//android.widget.EditText[7]
${field_facebook}    xpath=//android.widget.EditText[8]
${field_tiktok}      xpath=//android.widget.EditText[9]
${logo_homepage}      //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.ImageView

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

    # Wait Until Page Contains    Select a language
    Wait Until Page Contains    Selecione uma linguagem
    Wait Until Page Contains    ${LANGUAGE}
    Click Text                  ${LANGUAGE}

logIn
    ${email}     Set Variable        xpath=//android.widget.EditText[@text="E-mail"]
    Input Text                       ${email}      ${USER1["email"]}
    
    ${senha}     Set Variable        xpath=//android.widget.EditText[@text="Senha"]
    Input Text                       ${senha}      ${USER1["senha"]}

    ${entrar}     Set Variable       xpath=//android.widget.TextView[@text="ENTRAR"]
    Click Element                    ${entrar}