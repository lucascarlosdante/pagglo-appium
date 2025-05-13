*** Settings ***
Library    Process
Suite Setup    Setup Global
Suite Teardown    Teardown Global

*** Test Cases ***
Executar Todos Os Testes
    Executar Modificação no Usuário
    Executar Validação da Home
    Executar Validação do Ranking
    Executar Validação da Carteira

*** Keywords ***
Executar Modificação no Usuário
    Run Process    robot    tests/modifyUser.robot    stdout=stdout.log    stderr=stderr.log

Executar Validação da Home
    Run Process    robot    tests/validateHome.robot    stdout=stdout.log    stderr=stderr.log

Executar Validação do Ranking
    Run Process    robot    tests/validateRanking.robot    stdout=stdout.log    stderr=stderr.log

Executar Validação da Carteira
    Run Process    robot    tests/validateWallet.robot    stdout=stdout.log    stderr=stderr.log

Setup Global
    Log    Configurando o ambiente antes de rodar os testes.

Teardown Global
    Log    Limpando o ambiente após a execução de todos os testes.
