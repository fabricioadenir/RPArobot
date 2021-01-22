*** Settings ***
Resource    ../resources/ClashRoyale.robot

*** Tasks ***

Primeiro Passo: Gerar Token Api Clash Royale.
    Acessar o website.
    Clicar no botão login.
    Inserir usuário e senha.
    Clicar em login.
    Ir até o menu minha conta.
    Criar uma nova chave.

Segundo Passo: Gerar Informações do Clash Royale.
    Através da API do Clash Royale, obtenha as informações do clã de nome "The resistance", cuja tag começa com "#9V2Y" e que esteja localizado no "Brazil".
    Utilizando a resposta da chamada do passo 1, realizar uma nova chamada para recuperar a lista de membros do clã.
    Por fim, escrever num arquivo .csv as seguintes informações de cada membro - nome(name), - level(expLevel), - troféus(trophies), - papel(role).

Ultimo Passo: Apagar Token.
    Deletar Token
