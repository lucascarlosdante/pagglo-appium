*** Settings ***

Library    AppiumLibrary
Library           OperatingSystem

*** Variables ***

&{USER1}    email=lucasinboxtest@gmail.com    senha=Senha1*    name=Quentin     lastname=Alves    cpf=04547531102    telefone=(61) 98918-9189    apelido=QA    instagram=@insta    facebook=@face    tiktok=@tiktok
&{USER2}    email=lucasinboxtest@gmail.com    senha=Senha1*    name=Quentin Alves    lastname=Novais    cpf=01234567890    telefone=61891998819    apelido=QA2    instagram=@insta2    facebook=@face2    tiktok=@tiktok2
&{USER}    USER1=${USER1}    USER2=${USER2}

&{ptBr}    idioma=Português (Brasil)    text=Selecione uma linguagem
&{ptPt}    idioma=Português (Portugal)    text=Selecione uma linguagem
&{enUs}    idioma=Portuguese (Brazil)    text=Select a language
&{frFr}    idioma=Portugais (Brésil)    text=Select a language
&{esEs}    idioma=Portugués (Brasil)    text=Select a language
&{pkPk}    idioma=Portugalski (Brazylia)    text=Select a language
&{LANGUAGE}    ptBr=${ptBr}    ptPt=${ptPt}    enUs=${enUs}    frFr=${frFr}    esEs=${esEs}    pkPk=${pkPk}


${field_cpf}         xpath=//android.widget.EditText[1]
${field_name}        xpath=//android.widget.EditText[2]
${field_lastname}    xpath=//android.widget.EditText[3]
${field_email}       xpath=//android.widget.EditText[4]
${field_telefone}    xpath=//android.widget.EditText[5]
${field_apelido}     xpath=//android.widget.EditText[6]
${field_instagram}   xpath=//android.widget.EditText[7]
${field_facebook}    xpath=//android.widget.EditText[8]
${field_tiktok}      xpath=//android.widget.EditText[9]
${logo_homepage}     //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.ImageView

${TEXT_VIEW}         xpath=//android.widget.TextView

${PLATFORM_NAME}  Android
${DEVICE_NAME}    Android Emulator

${APK_FOLDER}     ./app
${apk_files}=    List Files In Directory    ${APK_FOLDER}    pattern=*.apk

# ${PERFIL_ITEM}       xpath=//android.widget.TextView

# ${INSTANCE_COUNT}    9  # Quantidade de campos de texto em "Atualizar dados do usuário"
