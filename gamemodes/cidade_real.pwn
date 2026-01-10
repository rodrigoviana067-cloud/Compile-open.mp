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

// CORREÇÃO ERRO 025: A tag 'Player:' deve estar ANTES do nome do parâmetro
public OnPlayerConnect(Player:playerid)
{
    SendClientMessage(playerid, -1, "Bem-vindo à Cidade Real!");
    return 1;
}

// CORREÇÃO ERRO 025: Tag 'Player:' obrigatória e parâmetro 'text' deve ser 'const'
public OnPlayerText(Player:playerid, const text[])
{
    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);
    
    // CORREÇÃO ERRO 001/017: No foreach do open.mp, a sintaxe correta é esta:
    foreach(new Player:i : Player)
    {
        // CORREÇÃO WARNING 213: 'i' já tem a tag Player: por causa do loop acima
        if(IsPlayerInRangeOfPoint(i, 20.0, x, y, z))
        {
            new msg[144];
            format(msg, sizeof(msg), "%p diz: %s", playerid, text);
            SendClientMessage(i, -1, msg);
        }
    }
    return 0; 
}
