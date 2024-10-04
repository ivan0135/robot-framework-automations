** Settings **
Library    SeleniumLibrary

#abre o navegador antes de qualquer teste ser executado.
Suite Setup  Open Browser    https://homologacao.spdmpais.org.br/ManutPredial/Autenticacao/Login    chrome
#fecha o navegador após todos os testes serem executados.
Suite Teardown    Close Browser       

*** Keywords ***
Login no ambiente 
    Maximize Browser Window
    #seleniumLibrary.Set Screenshot Directory    ${capturasDeTela}
    SeleniumLibrary.Input Text    //input[@id='Login']    620026901
    SeleniumLibrary.Input Text    //input[@id='Senha']    Ique2507! 
    SeleniumLibrary.Click Element    //button[normalize-space()='Login']
    ${Titulo}=  Get Title
        Run Keyword If    'Engenharia predial' == '${Titulo}'      Log    Login efetuado com sucesso
    ...     ELSE    Log    Login não validado

*** Test Cases ***
Cenario 01 - 
    Login no ambiente
