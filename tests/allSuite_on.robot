*** Settings ***

Resource          ../resources/base.resource
Library           OperatingSystem

*** Variables ***
${APK_FOLDER}     ./app
${PLATFORM_NAME}  Android
${DEVICE_NAME}    Android Emulator
${apk_files}=    List Files In Directory    ${APK_FOLDER}    pattern=*.apk

*** Test Cases ***
Deve acessar todos os APKs da pasta

    [Tags]    bdd

    Dado que os APKs estão disponíveis na pasta
    Então abrir e fechar cada APK

*** Keywords ***

Dado que os APKs estão disponíveis na pasta
    ${apk_files}=    List Files In Directory    ${APK_FOLDER}    pattern=*.apk
    Set Suite Variable    ${apk_files}
    ${total_apks}=    Get Length    ${apk_files}
    Log    Total de APKs encontrados: ${total_apks}

Então abrir e fechar cada APK

    Should Not Be Empty    ${apk_files}    Nenhum APK encontrado na pasta '${APK_FOLDER}'

    FOR    ${apk}    IN    @{apk_files}
        Log    Abrindo: ${apk}

        Open Application    http://localhost:4723
        ...                 platformName=${PLATFORM_NAME}
        ...                 deviceName=${DEVICE_NAME}
        ...                 automationName=UIAutomator2
        ...                 app=${EXECDIR}/${APK_FOLDER}/${apk}
        ...                 udid=emulator-5554
        ...                 autoGrantPermissions=true

        Wait Until Element Is Visible    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout

        # Wait Until Page Contains    Select a language
        Wait Until Page Contains    Selecione uma linguagem
        Wait Until Page Contains    ${LANGUAGE}
        Click Text                  ${LANGUAGE}

        Log    Fechando: ${apk}
        Close Application

    END