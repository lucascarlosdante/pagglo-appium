*** Settings ***

Resource    ../resources/keywords.resource
Suite Setup    Set Appium Timeout    30s

*** Variables ***

${mais_header}    xpath=//android.view.View[@text="Perfil"]

*** Test Cases ***

Deve alterar os dados do usuário

    [Tags]    bdd

    Dado que o app foi iniciado e o usuário está logado
    Quando o usuário acessa a tela de edição de dados
    E altera os dados com novas informações
    E retorna os dados originais do usuário
    Então os dados exibidos devem estar corretos

*** Keywords ***

Dado que o app foi iniciado e o usuário está logado
    E que o usuário iniciou a sessão no app    loopiclub
    E o usuário seleciona o idioma    ptBr
    Quando o usuário faz login com o usuário    USER1
    Então a tela inicial do app é carregada corretamente

Quando o usuário acessa a tela de edição de dados
    Acessar Menu    Mais
    Esperar por    ${mais_header}
    Acessar opção    Atualizar dados de usuário
    Espera vários campos de inserção    9

E altera os dados com novas informações
    Edita os dados do usuário    
    # Edita os dados do usuário    # USER2

E retorna os dados originais do usuário
    Retorna os Dados de Usuário
    # Edita os dados do usuário    # USER1

Então os dados exibidos devem estar corretos
    Acessar Menu    Mais
    Validar texto da página "Mais"
    Acessar opção    Atualizar dados de usuário
    Validar Dados User 1
