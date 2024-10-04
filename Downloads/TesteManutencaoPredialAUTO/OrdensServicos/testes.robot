** Settings **
Resource  ../PageObjets/PageObjets.robot     
#abre o navegador antes de qualquer teste ser executado.
Suite Setup  Open Browser    ${Ambiente_ManutencaoPredial}    chrome
#fecha o navegador após todos os testes serem executados.
Suite Teardown    Close Browser

** Keywords **  
Visualizando a opção "estimativa de custos"
    ${functionalities}=    seleniumLibrary.Get WebElements    ${FuncioOSButton}
    FOR    ${funcionalidade}    IN    @{functionalities}
        seleniumLibrary.Wait Until Element Is Visible    ${funcionalidade}    timeout=10
        seleniumLibrary.Click Element    ${funcionalidade}
        ${encontrou}=   Verificar função 
        Run Keyword If    ${encontrou}    Set Suite Variable    ${funcionalidade} 
        Run Keyword If    ${encontrou}    Exit For Loop
        ...  ELSE     seleniumLibrary.Click Element    //h1[contains(text(),'ASSOCIAÇÃO PAULISTA PARA O DESENVOLVIMENTO DA MEDI')]
    END
    sleep  1s
    seleniumLibrary.Wait Until Element Is Visible    ${BtnEstimavasCustos} 
    seleniumLibrary.Click Element                    ${BtnEstimavasCustos}
    seleniumLibrary.Wait Until Page Contains    Estimativas de custos
    sleep  1s
    Capture Element Screenshot    ${TelaEstimativaCUSTO}
 
Verificar função
    ${textoEstimava}=    seleniumLibrary.Get Text    ${html}
    ${encontrou}=    Run Keyword And Return Status    Should Contain    ${textoEstimava}    ${EstimaAVA}
    RETURN        ${encontrou}

*** Test Cases ***
Cenario 01 - teste
    Login no ambiente
    Acessando a funcionalidade - Ordens de Serviços
    ${resultado}=     Visualizando a opção "estimativa de custos"
    Log    Função encontrada: ${resultado}
    