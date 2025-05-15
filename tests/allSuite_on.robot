*** Settings ***

Resource          ../resources/keywords.resource
Suite Setup    Set Appium Timeout    60s

*** Variables ***


*** Test Cases ***
Deve acessar todos os APKs da pasta

    [Tags]    bdd

    Dado que os APKs estão disponíveis na pasta
    Então abrir e fazer login em cada APK

*** Keywords ***

# Dado que os APKs estão disponíveis na pasta
#     ${apk_files}=    List Files In Directory    ${APK_FOLDER}    pattern=*.apk
#     Set Suite Variable    ${apk_files}
#     ${total_apks}=    Get Length    ${apk_files}
#     Log    Total de APKs encontrados: ${total_apks}

# Então abrir e fazer login em cada APK

#     Should Not Be Empty    ${apk_files}    Nenhum APK encontrado na pasta '${APK_FOLDER}'

#     FOR    ${apk}    IN    @{apk_files}
#         Log    Abrindo: ${apk}

#         E que o usuário iniciou a sessão nos apps da pasta    ${APK_FOLDER}    ${apk}

#         Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout
        
#         E o usuário seleciona o idioma    ptBr
        
#         Sleep    2s

#         Quando o usuário faz login com o usuário    USER1

#         Então a tela inicial do app é carregada corretamente

#         Log    Fechando: ${apk}
#         Close Application

#     END