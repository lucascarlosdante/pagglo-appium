*** Settings ***

Resource    ../resources/base.resource

*** Variables ***

*** Test Cases ***

Dado que o app está aberto
    Dado que o usuário iniciou a sessão no app
    E o usuário seleciona o idioma
    Quando o usuário faz login
    Então a tela inicial do app é carregada corretamente
    
# Close session  
#     Close Application    