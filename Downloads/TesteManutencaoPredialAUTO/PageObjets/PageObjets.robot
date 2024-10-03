*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    OperatingSystem
Library    String
Library    XML
Library    Screenshot
Library    AppiumLibrary

** Keywords **  
#Login 
Login no ambiente 
    Maximize Browser Window
    seleniumLibrary.Set Screenshot Directory    ${capturasDeTela}
    SeleniumLibrary.Input Text    ${CampoLogin}    ${User}
    SeleniumLibrary.Input Text    ${CampoSenha}    ${Password}
    SeleniumLibrary.Click Element    ${Entrar}
    ${Titulo}=  Get Title
        Run Keyword If    'Engenharia predial' == '${Titulo}'      Log    Login efetuado com sucesso
    ...     ELSE    Log    Login não validado

Acessando a funcionalidade - Ordens de Serviços
    seleniumLibrary.Click Element    ${BtnOrdemdeServico}
    seleniumLibrary.Click Element    ${OrdensdeServico}
    seleniumLibrary.Wait Until Page Contains    Ordens de Serviços
    sleep  1s

*** Variables ***
## Login  ##
${Ambiente_ManutencaoPredial}    https://homologacao.spdmpais.org.br/ManutPredial/Autenticacao/Login
${CampoLogin}    //input[@id='Login']
${CampoSenha}    //input[@id='Senha']
${User}          620026901
${Password}      Ique2507!  
${Entrar}        //button[normalize-space()='Login']
${capturasDeTela}             Capturas de tela


### > ADMINISTRATIVO  <  ###

## Cadastro de prestador ##
${BtnAdministrativo}        //a[@id="ddlCadastros"]
${BtnCadastroPrestador}     //a[@class="nav-link dropdown-item-menu-a"][@href="/ManutPredial/Prestador/index"]
${BtnCadastrarPrestador}    //button[@id="btnPrestador"]
${TitleCadastroPrestador}   //h5[@class="modal-title"]
${CampoNomeFornecedor}      //input[@id='Descricao']
${SeletorBDI}               //select[@id='ddlBDIModal']
${BtnSalvar}                //input[@id='btnSalvar']
${ModalSucesso}             //div[@class='toast-message']
## Desativando um prestador ##
${PrestadorAtivo}       //span[@class="badge badge-success"]
${FuncioPrestador}      //button[@id="dropdownMenuFuncionalidades"][@class="btn btn-info dropdown-toggle"]
${BtnDesativar}         //button[@id="btnDesativar"]
${ModalConfirmacao}     //h2[@id="swal2-title"]
${BtnSim}               //button[@class="swal2-confirm swal2-styled"]
## Ativando um prestdor ##
${OutraPagina}         //a[@href="/Manutencao_Predial/Prestador/Listar?qtdPorPagina=10&pagina=4"]
${BtnAtivar}           //div[@class='dropdown-menu dropdown-menu-right show']//button[@id='btnAtivar']
${PrestadorInativo}    //span[@class="badge badge-danger"]


## Cadastro de tecnicos ##
${BtnCadastroTecnicos}        //a[@href="/ManutPredial/Tecnico/index"]
${BtnCadastrarNewTecnico}     //button[@id='btnTecnico']
${CadastroNewTecModal}        //h5[normalize-space()='Cadastro de Técnicos de Edificações']
${Ivani}                      //div[contains(text(), 'IVANI CORREIA DE SANTANA - 6203523-04')]
${BtnAdicionarTEC}            //input[@id='btnSalvar']

## Ordem de serviço ##
${BtnOrdemdeServico}    //body/nav[@class='navbar navbar-expand-lg']/div[@id='navbarSupportedContent']/ul[@class='navbar-nav mr-auto']/li[3]/a[1]
${OrdensdeServico}      //a[normalize-space()='Ordens de Serviço']
## Cadastrando uma OS ##
${BtnCadastrarOs}      //button[@id='btnOrdemServico']
${TituloCadastro}      //h5[normalize-space()='Cadastrar ordem de serviço']
${CampoTipoServico}    //select[@id='ddlTipoServicoModalCreate']
${CampoDataOS}         //input[@id='InputDataSolicitacao']
${CampoContrato}       //select[@id='ddlContratoModalCreate']
${CampoDescricao}      //textarea[@id='textAreaModificado']
${BtnCadastrar}        //input[@id='btnSalvar']
${ModalSucessoOS}      //div[@class='toast-title']
## Visualizando Logs ##
${FuncioOSButton}        //button[@id="dropdownMenuFuncionalidades"]
${BtnVisualizarLogs}     //div[@class='dropdown-menu dropdown-menu-right show']//button[@id='btnLogs']
${TitleLogs}             //h5[normalize-space()='Logs da ordem de serviço']
${NumOS}                 //input[@id='txtNúmeroOs:']
${TableNomeUser}         //th[normalize-space()='Nome Usuario']
${TableDataAlteracao}    //th[normalize-space()='Data Alteração']
${TableStatus}           //table[@id='tbPagamento']//th[contains(text(),'Status')]
${dataAlteracao}         //body[1]/div[6]/div[1]/div[1]/div[1]/form[1]/div[1]/div[2]/div[1]/table[1]/tbody[1]/tr[1]/td[1]
${BtnFecharLogs}         //input[@value='Fechar']
## Detalhes da OS ##
${DetailOS}     Detalhes da OS
${AllTela}              //div[@class="modal-body"]
${TitleDetail}          //h5[normalize-space()='Resumo da Ordem de serviço']
${BtnDetalhesOs}        //div[@class='dropdown-menu dropdown-menu-right show']//button[@id='btnDetalhesOs']
${NumOSDetalhes}        //div[@id='avaliacao-tecnico']//input[@id='txtNúmeroOs:']
${NomeUnidade}          //div[@id='avaliacao-tecnico']//input[@id='txtNomeunidade:']
${CampoPrioridade}      //div[@id='avaliacao-tecnico']//input[@id='txtNomeunidade:']
${CampoTipoServiço}     //input[@id='txtTiposerviço:']
${BtnFehcarDetails}     //input[@value='Fechar'] 
## Preecher avaliação  ##
${AvaliacaoTEC}        Avaliação Técnica
${BntPreencherAvaliacao}        //button[@id="btnPreencherAvaliacao"]
${PrioridadeNenhuma}            //span[contains(text(), 'Nenhuma')]
${BtnFuncionalidadesOS}         //button[@id='dropdownMenuFuncionalidades']
${CampoPrioridadeOS}            //select[@id='ddlPrioridadeModalCreate']
${TipoServicoOS}                //select[@id='ddlTipoServicoModalCreate']
${CampoEmpresaOS}               //select[@id='ddlEmpresaModalCreate']
${CampoTecnicoOS}               //select[@id='ddlTecnicoModalCreate']
${BntConfirmarAvaliacaoOS}      //input[@id="btnCadastrarAvaliacao"]
${BtnFecharOS}                  //input[@value='Fechar']
## Cancelar uma OS  ##
${CancelarOS}     Cancelar
${BtnCancelarOS}            //button[@id="btnCancelar"]
${ModalConfimaCancelar}     //h2[@class="swal2-title"]
${BtnSIMcancelar}           //button[@class="swal2-confirm swal2-styled"]
${ModalMotivoCancelar}      //h2[@id='swal2-title']
${CampoMotivoInput}         //input[@id='swal2-input']
${BtnConfimaCancelamento}   //button[normalize-space()='Confirmar']
## Estimativas OS ##
${PrioridadeBaixa}        //span[contains(text(), 'BAIXA')]
${BtnEstimavasCustos}     //div[@class='dropdown-menu dropdown-menu-right show']//button[@id='btnCadastroEstimativaDeCustos']
${EstimaAVA}              Cadastro estimativa de custos   
${html}                   //div[@class='dropdown-menu dropdown-menu-right show']
${TelaEstimativaCUSTO}    //div[@class='modal-body']