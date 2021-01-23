*** Settings ***
Library     Browser
Library     ../libraries/Addrees.py
Library     ../libraries/ClashRoyale.py

Resource    ./variables/globais.robot


*** Keywords ***
Abrir Pagina
    Log To Console  ${\n}Abrindo Pagina Web.
    New Browser    timeout=00:00:05
    New Page   ${URL}

Acessar o website.
    Log To Console  ${\n}Acessando o WebSite.
    Abrir Pagina

Clicar no botão login.
    Log To Console  Clicando no Botão para Login.
    Click                       ${ELEMENT_LOGIN}

Inserir usuário e senha.
    Log To Console  Inserindo Usuário e Senha.
    Fill Text      ${ELEMENT_USER}   ${USER}
    Fill Text      ${ELEMENT_PASSWORD}    ${PASSWORD}

Clicar em login.
    Log To Console  Clicando no Botão de Realizar Login.
    Click       ${ELEMENT_LOGIN_ENTER}

Ir até o menu minha conta.
    Log To Console  Indo ao Menu Minha Conta.
    Click       ${ELEMENT_MENU}
    Click       ${ELEMENT_MY_ACCOUNT}

Pegar Ip Externo
    Log To Console  Buscando IP Externo.
    ${EXTERNAL_IP}  Get External Ip
    Set Suite Variable      ${EXTERNAL_IP}
    Log To Console      IP Externo ${EXTERNAL_IP}

Criar uma nova chave.
    Log To Console  Criando uma Nova Chave.
    Pegar Ip Externo
    Click       ${ELEMENT_CREATE_NEW_KEY}
    Fill Text   ${ELEMENT_KEY_NAME}     ${KEY_NAME}
    Fill Text   ${ELEMENT_KEY_DESC}     ${KEY_DESC}
    Fill Text   ${ELEMENT_IP_ADDRESS}   ${EXTERNAL_IP}
    Click       ${ELEMENT_CREATE_KEY}
    Log To Console  Salvando Token.
    Buscar Chave Criada

Buscar Chave Criada
    Click       ${ELEMENT_KEY}
    ${MY_TOKEN}     Get Text    ${ELEMENT_TOKEN}
    Set Suite Variable  ${MY_TOKEN}

Deletar Token
    Acessar o website.
    Clicar no botão login.
    Inserir usuário e senha.
    Clicar em login.
    Ir até o menu minha conta.
    Click       ${ELEMENT_KEY}
    Log To Console  Deletando o Token.
    Click       ${ELEMENT_DELETE_TOKE}
    Get Page Source    contains     Key deleted successfully
    Log To Console  Token Deletado com Sucesso.


Através da API do Clash Royale, obtenha as informações do clã de nome "${CLAN_NAME}", cuja tag começa com "${PARTIAL_TAG}" e que esteja localizado no "${COUNTRY}".
    Log To Console  ${\n}Buscando Informações do Clã.
    ${TAG}  Get Tag Clan  ${MY_TOKEN}  ${CLAN_NAME}  ${PARTIAL_TAG}  ${COUNTRY}
    Set Suite Variable  ${TAG}

Utilizando a resposta da chamada do passo 1, realizar uma nova chamada para recuperar a lista de membros do clã.
    Log To Console  Buscando Lista de Membros do Clã.
    ${LIST_MEMBERS}  Get Members Clan  ${MY_TOKEN}  ${TAG}
    Set Suite Variable  ${LIST_MEMBERS}

Por fim, escrever num arquivo .csv as seguintes informações de cada membro - nome(name), - level(expLevel), - troféus(trophies), - papel(role).
    Log To Console  Criando arquivo ${FILE_NAME}.
    Create File Clan Members  ${FILE_NAME}  ${LIST_MEMBERS}
