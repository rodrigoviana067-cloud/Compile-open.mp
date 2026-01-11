#include <open.mp>
#include <a_samp>
#include <YSI_Core/y_core>
#include <YSI_Storage/y_ini>
#include <YSI_Coding/y_hooks>
#define DIALOG_LOGIN    1
#define DIALOG_REGISTRO 2

#define COR_VERDE    0x00FF00FF
#define COR_VERMELHO 0xFF0000FF

enum pInfo
{
    bool:Logado,
    Senha[32]
};
new PlayerInfo[MAX_PLAYERS][pInfo];

// =========================
public OnGameModeInit()
{
    SetGameModeText("Cidade Real - open.mp");
    AddPlayerClass(0, -1257.5, -2704.9, 14.0, 0.0, 0,0,0,0,0,0);
    return 1;
}

public OnPlayerConnect(playerid)
{
    PlayerInfo[playerid][Logado] = false;
    MostrarLogin(playerid);
    return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    SalvarConta(playerid);
    return 1;
}

// =========================
MostrarLogin(playerid)
{
    if (ContaExiste(playerid))
    {
        ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD,
            "Cidade Real",
            "Digite sua senha:",
            "Entrar", "Sair");
    }
    else
    {
        ShowPlayerDialog(playerid, DIALOG_REGISTRO, DIALOG_STYLE_PASSWORD,
            "Cidade Real",
            "Crie uma senha:",
            "Registrar", "Sair");
    }
}

// =========================
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if (!response) return Kick(playerid);

    if (dialogid == DIALOG_LOGIN)
    {
        if (!strcmp(inputtext, PlayerInfo[playerid][Senha]))
        {
            PlayerInfo[playerid][Logado] = true;
            SpawnPlayer(playerid);
            SendClientMessage(playerid, COR_VERDE, "Login efetuado!");
        }
        else
        {
            SendClientMessage(playerid, COR_VERMELHO, "Senha incorreta!");
            MostrarLogin(playerid);
        }
    }
    else if (dialogid == DIALOG_REGISTRO)
    {
        format(PlayerInfo[playerid][Senha], 32, "%s", inputtext);
        CriarConta(playerid);
        PlayerInfo[playerid][Logado] = true;
        SpawnPlayer(playerid);
        SendClientMessage(playerid, COR_VERDE, "Conta criada!");
    }
    return 1;
}

// =========================
public OnPlayerSpawn(playerid)
{
    if (!PlayerInfo[playerid][Logado]) return Kick(playerid);

    SetPlayerPos(playerid, -1257.5, -2704.9, 14.0);
    SetPlayerSkin(playerid, 0);
    GivePlayerMoney(playerid, 5000);
    return 1;
}

// =========================
stock ContaExiste(playerid)
{
    new nome[MAX_PLAYER_NAME], arquivo[64];
    GetPlayerName(playerid, nome, sizeof nome);
    format(arquivo, sizeof arquivo, "scriptfiles/contas/%s.ini", nome);
    return fexist(arquivo);
}

stock CriarConta(playerid)
{
    new nome[MAX_PLAYER_NAME], arquivo[64], File:f;
    GetPlayerName(playerid, nome, sizeof nome);
    format(arquivo, sizeof arquivo, "scriptfiles/contas/%s.ini", nome);
    f = fopen(arquivo, io_write);
    fwrite(f, PlayerInfo[playerid][Senha]);
    fclose(f);
}

stock SalvarConta(playerid)
{
    if (!PlayerInfo[playerid][Logado]) return;

    new nome[MAX_PLAYER_NAME], arquivo[64], File:f;
    GetPlayerName(playerid, nome, sizeof nome);
    format(arquivo, sizeof arquivo, "scriptfiles/contas/%s.ini", nome);
    f = fopen(arquivo, io_write);
    fwrite(f, PlayerInfo[playerid][Senha]);
    fclose(f);
}
