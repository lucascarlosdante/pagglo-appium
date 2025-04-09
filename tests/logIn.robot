*** Settings ***

Resource    ../resources/base.resource

*** Variables ***
${LANGUAGE}    Portuguese (Brazil)
&{USER1}    email=lucasinboxtest@gmail.com    senha=Senha1*

*** Test Cases ***

Deve realizar o logIn

    Start session
    Select language
    logIn
    
# Close session  
#     Close Application    