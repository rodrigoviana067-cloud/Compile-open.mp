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

// Em open.mp, o parâmetro DEVE ter a tag 'Player:'
public OnPlayerConnect(Player:playerid)
{
    // SendClientMessage também exige que o ID tenha a tag Player:
    SendClientMessage(playerid, -1, "Bem-vindo à Cidade Real!");
    return 1;
}

// CORREÇÃO: No open.mp, o primeiro parâmetro de OnPlayerText deve ser 'Player:playerid'
public OnPlayerText(Player:playerid, const text[])
{
    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);
    
    // O iterador 'Player' do foreach já lida com a tag corretamente
    foreach(new Player:i : Player)
    {
        if(IsPlayerInRangeOfPoint(i, 20.0, x, y, z))
        {
            new msg[144];
            // %p é um especificador do open.mp para exibir o nome do jogador via ID
            format(msg, sizeof(msg), "%p diz: %s", playerid, text);
            SendClientMessage(i, -1, msg);
        }
    }
    return 0; // Retorna 0 para não mostrar a mensagem padrão no chat global
}
