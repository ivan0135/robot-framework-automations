** Settings **
Resource  ../PageObjets/PageObjets.robot     
#abre o navegador antes de qualquer teste ser executado.
Suite Setup  Open Browser    ${Ambiente_ManutencaoPredial}    chrome
#fecha o navegador após todos os testes serem executados.
Suite Teardown    Close Browser   

** Keywords **  
Acessando a funcionalidade 
    seleniumLibrary.Click Element    ${BtnAdministrativo}
    seleniumLibrary.Click Element    ${BtnCadastroPrestador} 
    seleniumLibrary.Wait Until Page Contains    Cadastro de Prestadores
#Cenario 01 - Cadastrando um prestador
Cadastrando um prestador
    seleniumLibrary.Wait Until Element Is Visible    ${BtnCadastrarPrestador}
    seleniumLibrary.Click Element    ${BtnCadastrarPrestador}
    #Validador
    seleniumLibrary.Wait Until Element Is Visible    ${TitleCadastroPrestador} 
    ${random_string}=    String.Generate Random String    4
    Log    ${random_string}
    seleniumLibrary.Input Text    ${CampoNomeFornecedor}      ${random_string}
    seleniumLibrary.Select From List By Index    ${SeletorBDI}      1
    seleniumLibrary.Click Element    ${BtnSalvar}
    sleep  1s
    seleniumLibrary.Wait Until Element Is Visible    ${ModalSucesso}
    sleep  1s
Desativando um prestador de serviços 
    ${linhas}=    SeleniumLibrary.Get WebElements    ${PrestadorAtivo}
    FOR    ${linha}    IN    @{linhas}
        ${texto}=    SeleniumLibrary.Get Text    ${linha}
        Run Keyword If    'Sim' == '${texto}'    
        ...    SeleniumLibrary.Click Element    ${FuncioPrestador}
        sleep  1s
        SeleniumLibrary.Click Element    ${BtnDesativar}
        sleep  1s
        seleniumLibrary.Wait Until Element Is Visible    ${ModalConfirmacao}
        seleniumLibrary.Click Element    ${BtnSim}
        seleniumLibrary.Wait Until Element Is Visible    ${ModalSucesso}
        Capture Element Screenshot    ${ModalSucesso}
        Exit For Loop
    END 
    sleep  1s 
Ativando um prestador de serviços 
    ${linhas}=    SeleniumLibrary.Get WebElements    ${PrestadorInativo}
    FOR    ${linha}    IN    @{linhas}
        ${texto}=    SeleniumLibrary.Get Text    ${linha}
        Run Keyword If    'Não' == '${texto}'    
        ...    SeleniumLibrary.Click Element    ${FuncioPrestador}
        sleep  1s
        SeleniumLibrary.Click Element    ${BtnAtivar} 
        sleep  1s
        seleniumLibrary.Wait Until Element Is Visible    ${ModalConfirmacao}
        seleniumLibrary.Click Element    ${BtnSim}
        seleniumLibrary.Wait Until Element Is Visible    ${ModalSucesso}
        Capture Element Screenshot    ${ModalSucesso}
        Exit For Loop
    END 

*** Test Cases ***
cenario 01 - Cadastrando um Prestador
    Login no ambiente
    Acessando a funcionalidade
    Cadastrando um prestador
Cenario 02 - Desativando um prestador    
    Desativando um prestador de serviços 
Cenario 03 - Desativando um prestador 
    Ativando um prestador de serviços 
