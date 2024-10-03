** Settings **
Resource  ../PageObjets/PageObjets.robot     
#abre o navegador antes de qualquer teste ser executado.
Suite Setup  Open Browser    ${Ambiente_ManutencaoPredial}    chrome
#fecha o navegador após todos os testes serem executados.
Suite Teardown    Close Browser

** Keywords **  
Cadastrando uma OS
    SeleniumLibrary.Click Element    ${BtnCadastrarOs}
    SeleniumLibrary.Wait Until Element Is Visible    ${TituloCadastro} 
    SeleniumLibrary.Select From List By Index    ${CampoContrato}    1
    SeleniumLibrary.Select From List By Index    ${CampoTipoServico}    1
    #SeleniumLibrary.Input Text    ${CampoDataOS}    30092024
    SeleniumLibrary.Input text     ${CampoDescricao}         TesteQ2A - TesteQA - TesteQA
    sleep  1s
    SeleniumLibrary.Click Element    ${BtnCadastrar}
    sleep  1s
    SeleniumLibrary.Wait Until Element Is Visible    ${ModalSucessoOS}
Visualizando Logs
    sleep  1s
    ${FuncionalizadesOS}=    seleniumLibrary.Get WebElements    ${FuncioOSButton}
    ${seletorFuncinalidades}=    Get From List    ${FuncionalizadesOS}   0
    seleniumLibrary.Click Element    ${seletorFuncinalidades}
    sleep  1s
    seleniumLibrary.Click Element    ${BtnVisualizarLogs}
    seleniumLibrary.Wait Until Element Is Visible    ${TitleLogs}
    seleniumLibrary.Wait Until Element Is Visible    ${NumOS}
    seleniumLibrary.Wait Until Element Is Visible    ${TableNomeUser}
    seleniumLibrary.Wait Until Element Is Visible    ${TableDataAlteracao}
    seleniumLibrary.Wait Until Element Is Visible    ${TableStatus}
    #seleniumLibrary.Wait Until Element Is Visible    ${dataAlteracao} 
    sleep  1s
    seleniumLibrary.Click Element    ${BtnFecharLogs}
    sleep  1s

Detalhes da OS
    ${functionalities}=    seleniumLibrary.Get WebElements    ${FuncioOSButton}
    FOR    ${funcionalidade}    IN    @{functionalities}
        seleniumLibrary.Wait Until Element Is Visible    ${funcionalidade}    timeout=10
        seleniumLibrary.Click Element    ${funcionalidade}
        ${encontrou}=   Verificar função Detail 
        Run Keyword If    ${encontrou}    Set Suite Variable    ${funcionalidade} 
        Run Keyword If    ${encontrou}    Exit For Loop
        ...  ELSE     seleniumLibrary.Click Element    //h1[contains(text(),'ASSOCIAÇÃO PAULISTA PARA O DESENVOLVIMENTO DA MEDI')]
    END
    seleniumLibrary.Click Element    ${BtnDetalhesOs}
    seleniumLibrary.Wait Until Element Is Visible    ${TitleDetail} 
    seleniumLibrary.Wait Until Element Is Visible    ${NumOSDetalhes} 
    seleniumLibrary.Wait Until Element Is Visible    ${NomeUnidade} 
    seleniumLibrary.Wait Until Element Is Visible    ${CampoPrioridade}
    seleniumLibrary.Wait Until Element Is Visible    ${CampoTipoServiço}
    Capture Element Screenshot    ${AllTela}
    sleep  1s
    seleniumLibrary.Click Element    ${BtnFehcarDetails}
Verificar função Detail
    ${textoEstimava}=    seleniumLibrary.Get Text    ${html}
    ${encontrou}=    Run Keyword And Return Status    Should Contain    ${textoEstimava}    ${DetailOS}
    RETURN        ${encontrou}

Verificar função avaliação
    ${textoEstimava}=    seleniumLibrary.Get Text    ${html}
    ${encontrou}=    Run Keyword And Return Status    Should Contain    ${textoEstimava}    ${AvaliacaoTEC}
    RETURN        ${encontrou}

Verificar função Cancelar
    ${textoEstimava}=    seleniumLibrary.Get Text    ${html}
    ${encontrou}=    Run Keyword And Return Status    Should Contain    ${textoEstimava}    ${CancelarOS}
    RETURN        ${encontrou}

Preencher avaliacao
    sleep  1s
    ${functionalities}=    seleniumLibrary.Get WebElements    ${FuncioOSButton}
    FOR    ${funcionalidade}    IN    @{functionalities}
        seleniumLibrary.Wait Until Element Is Visible    ${funcionalidade}    timeout=10
        seleniumLibrary.Click Element    ${funcionalidade}
        ${encontrou}=   Verificar função avaliação 
        Run Keyword If    ${encontrou}    Set Suite Variable    ${funcionalidade} 
        Run Keyword If    ${encontrou}    Exit For Loop
        ...  ELSE     seleniumLibrary.Click Element    //h1[contains(text(),'ASSOCIAÇÃO PAULISTA PARA O DESENVOLVIMENTO DA MEDI')]
    END
    SeleniumLibrary.Wait Until Element Is Visible    ${BntPreencherAvaliacao} 
    SeleniumLibrary.Click Element    ${BntPreencherAvaliacao}
    sleep  1s
    SeleniumLibrary.Wait Until Page Contains    Preencher avaliação tecnico
    sleep  1s
    SeleniumLibrary.Select From List By Index    ${CampoPrioridadeOS}    2
    sleep  1s
    SeleniumLibrary.Select From List By Index    ${TipoServicoOS}    3
    sleep  1s
    SeleniumLibrary.Select From List By Index    ${CampoEmpresaOS}    5
    sleep  1s
    SeleniumLibrary.Select From List By Index    ${CampoTecnicoOS}      5
    SeleniumLibrary.Wait Until Element Is Visible    ${BntConfirmarAvaliacaoOS}
    sleep  1s
    seleniumLibrary.Click Element    ${BtnFecharOS}
    Sleep  1s

Cancelando uma OS
    ${functionalities}=    seleniumLibrary.Get WebElements    ${FuncioOSButton}
    FOR    ${funcionalidade}    IN    @{functionalities}
        seleniumLibrary.Wait Until Element Is Visible    ${funcionalidade}    timeout=10
        seleniumLibrary.Click Element    ${funcionalidade}
        ${encontrou}=   Verificar função Cancelar 
        Run Keyword If    ${encontrou}    Set Suite Variable    ${funcionalidade} 
        Run Keyword If    ${encontrou}    Exit For Loop
        ...  ELSE     seleniumLibrary.Click Element    //h1[contains(text(),'ASSOCIAÇÃO PAULISTA PARA O DESENVOLVIMENTO DA MEDI')]
    END
    SeleniumLibrary.Wait Until Element Is Visible    ${BtnCancelarOS}
    SeleniumLibrary.Click Element    ${BtnCancelarOS}
    SeleniumLibrary.Wait Until Element Is Visible    ${ModalConfimaCancelar}
    SeleniumLibrary.Click Element    ${BtnSIMcancelar}
    sleep  1s
    SeleniumLibrary.Wait Until Element Is Visible    ${ModalMotivoCancelar}
    SeleniumLibrary.Input Text    ${CampoMotivoInput}    TesteQATesteQATesteQATesteQA
    sleep  1s
    SeleniumLibrary.Click Element    ${BtnConfimaCancelamento}

*** Test Cases ***
## POSITIVOS  ## 
Cenario 01 - Cadastrando uma OS
    Login no ambiente
    Acessando a funcionalidade - Ordens de Serviços
    Cadastrando uma OS
Cenario 02 - Visualizando Logs    
    Visualizando Logs
Cenario 03 - Visualizando Details
    Detalhes da OS
Cenario 04 - Preenchendo uma avaliação
    Preencher avaliacao
Cenario 05 - Cancelando uma OS
    Cancelando uma OS



    