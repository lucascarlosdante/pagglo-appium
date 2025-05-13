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

${TEXT_VIEW}    xpath=//android.widget.TextView

${INSTANCE_COUNT}    9  # Quantidade de campos de texto em "Atualizar dados do usuário"
