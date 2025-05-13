*** Settings ***

Resource    ../resources/keywords.resource

*** Variables ***

*** Test Cases ***

Dado que o app está aberto
    E que o usuário iniciou a sessão no app    loopiclub
    E o usuário seleciona o idioma
    Quando o usuário faz login
    Então a tela inicial do app é carregada corretamente
    
# Close session  
#     Close Application    