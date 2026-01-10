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

// CORREÇÃO 1: Adicionada a tag Player: para bater com o protótipo da include
public OnPlayerConnect(Player:playerid)
{
    // Em open.mp, playerid já carrega a tag Player:
    SendClientMessage(playerid, -1, "Bem-vindo à Cidade Real!");
    return 1;
}

// CORREÇÃO 2: Adicionada a tag Player: aqui também
public OnPlayerText(Player:playerid, const text[])
{
    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);
    
    // CORREÇÃO 3: O foreach precisa da tag Player: para evitar 'tag mismatch'
    foreach(new Player:i : Player)
    {
        if(IsPlayerInRangeOfPoint(i, 20.0, x, y, z))
        {
            new msg[144];
            // No open.mp, %p converte automaticamente o ID do player no nome dele
            format(msg, sizeof(msg), "%p diz: %s", playerid, text);
            SendClientMessage(i, -1, msg);
        }
    }
    return 0; 
}
