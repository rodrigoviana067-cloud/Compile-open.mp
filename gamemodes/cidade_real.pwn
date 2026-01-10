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

// Em open.mp, playerid deve ter a tag Player:
public OnPlayerConnect(Player:playerid)
{
    SendClientMessage(playerid, -1, "Bem-vindo à Cidade Real!");
    return 1;
}

public OnPlayerText(Player:playerid, const text[])
{
    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);
    
    // Foreach ajustado para os novos tipos de dados
    foreach(new Player:i : Player)
    {
        if(IsPlayerInRangeOfPoint(i, 20.0, x, y, z))
        {
            new msg[144]; // Tamanho definido para evitar erro de buffer
            format(msg, sizeof(msg), "%p diz: %s", playerid, text);
            SendClientMessage(i, -1, msg);
        }
    }
    return 0; 
}
