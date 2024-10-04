** Settings **
Resource  ../PageObjets/PageObjets.robot     
#abre o navegador antes de qualquer teste ser executado.
Suite Setup  Open Browser    ${Ambiente_ManutencaoPredial}    chrome
#fecha o navegador após todos os testes serem executados.
Suite Teardown    Close Browser   

** Keywords ** 
Acessando a funcionalidade 
    seleniumLibrary.Click Element    ${BtnAdministrativo}
    seleniumLibrary.Click Element    ${BtnCadastroTecnicos}
    seleniumLibrary.Wait Until Page Contains    Cadastro de técnicos

Cadastrando um tecnico
    seleniumLibrary.Click Element    ${BtnCadastrarNewTecnico}
    seleniumLibrary.Wait Until Element Is Visible   ${CadastroNewTecModal}
    seleniumLibrary.Input Text    //input[@id='inptTecnico']    IVANI CORREIA DE SANTANA
    sleep  1s
    seleniumlibrary.Click Element    ${Ivani}
    sleep  1s
    seleniumlibrary.clickElement    ${BtnAdicionarTEC}
    sleep  1s 
    
    ${texto}=    seleniumlibrary.Get Text     //div[@class='toast-message']
    Run Keyword If    'Tecnico já cadastrado' == '${texto}'    
    ...    Fatal Error 
    ...    ELSE    Log    User cadastrado com sucesso
      

####TESTE

*** Test Cases ***
Cenario 01 
    Login no ambiente
    Acessando a funcionalidade
    Cadastrando um tecnico
    