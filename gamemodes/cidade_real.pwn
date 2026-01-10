#define SAMP_COMPAT
#include <open.mp>
#include <foreach>

main() {
    print("Cidade Real RP - Iniciado");
}

public OnGameModeInit() {
    SetGameModeText("Cidade Real v1.0");
    return 1;
}

// CORREÇÃO: Adicionada a tag Player: ao playerid
public OnPlayerConnect(Player:playerid)
{
    SendClientMessage(playerid, -1, "Bem-vindo à Cidade Real!");
    return 1;
}

// CORREÇÃO: Adicionada a tag Player: ao playerid
public OnPlayerText(Player:playerid, const text[])
{
    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);
    
    // O foreach precisa reconhecer a tag Player: para evitar o warning 213
    foreach(new Player:i : Player)
    {
        if(IsPlayerInRangeOfPoint(i, 20.0, x, y, z))
        {
            new msg[144];
            // %p é um especificador do open.mp que pega o nome do jogador automaticamente
            format(msg, sizeof(msg), "%p diz: %s", playerid, text);
            SendClientMessage(i, -1, msg);
        }
    }
    return 0; 
}
