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

// Em algumas versões do omp-stdlib, o protótipo ainda espera playerid sem tag
// Para resolver o erro 025 e o tag mismatch da linha 17:
public OnPlayerConnect(playerid)
{
    // Usamos _:playerid para remover a tag se necessário
    SendClientMessage(Player:playerid, -1, "Bem-vindo à Cidade Real!");
    return 1;
}

public OnPlayerText(playerid, const text[])
{
    new Float:x, Float:y, Float:z;
    GetPlayerPos(Player:playerid, x, y, z);
    
    // Corrigindo o foreach para evitar o erro de identificador/new
    foreach(new i : Player)
    {
        // Forçamos a tag Player: no IsPlayerInRangeOfPoint para o open.mp
        if(IsPlayerInRangeOfPoint(Player:i, 20.0, x, y, z))
        {
            new msg[144];
            // No format, usamos _: para garantir que o ID passe como inteiro
            format(msg, sizeof(msg), "ID %d diz: %s", _:playerid, text);
            SendClientMessage(Player:i, -1, msg);
        }
    }
    return 0; 
}
