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

// Em modo SAMP_COMPAT, o cabeçalho NÃO pode ter a tag Player:
public OnPlayerConnect(playerid)
{
    // Mas as funções pedem a tag, então usamos Player:playerid aqui
    SendClientMessage(Player:playerid, -1, "Bem-vindo à Cidade Real!");
    return 1;
}

// Removida a tag do cabeçalho para corrigir o Erro 025
public OnPlayerText(playerid, const text[])
{
    new Float:x, Float:y, Float:z;
    // Adicionada a tag na função interna
    GetPlayerPos(Player:playerid, x, y, z);
    
    // Corrigida a sintaxe do foreach para evitar o Erro 001 e 017
    foreach(new i : Player)
    {
        // Aqui convertemos o 'i' para Player:i para evitar o Tag Mismatch
        if(IsPlayerInRangeOfPoint(Player:i, 20.0, x, y, z))
        {
            new msg[144];
            format(msg, sizeof(msg), "%p diz: %s", Player:playerid, text);
            SendClientMessage(Player:i, -1, msg);
        }
    }
    return 0; 
}
