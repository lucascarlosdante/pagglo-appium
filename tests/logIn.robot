*** Settings ***

Resource    ../resources/keywords.resource

*** Variables ***

*** Test Cases ***

Dado que o app está aberto
    E que o usuário iniciou a sessão no app    loopilucaneta
    E o usuário seleciona o idioma    ptBr
    Quando o usuário faz login com o usuário    USER1
    Então a tela inicial do app é carregada corretamente
    
# Close session  
#     Close Application    