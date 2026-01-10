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

// CORREÇÃO: A assinatura da função DEVE ter a tag Player: para open.mp
public OnPlayerConnect(Player:playerid)
{
    // Usamos o playerid normalmente aqui pois a tag já foi definida no cabeçalho
    SendClientMessage(playerid, -1, "Bem-vindo à Cidade Real!");
    return 1;
}

// CORREÇÃO: A assinatura da função DEVE ter a tag Player:
public OnPlayerText(Player:playerid, const text[])
{
    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);
    
    // CORREÇÃO: Iterador do foreach também usa a tag Player:
    foreach(new Player:i : Player)
    {
        if(IsPlayerInRangeOfPoint(i, 20.0, x, y, z))
        {
            new msg;
            // %p é o especificador do open.mp para formatar o nome do jogador
            format(msg, sizeof(msg), "%p diz: %s", playerid, text);
            SendClientMessage(i, -1, msg);
        }
    }
    return 0; // Retorna 0 para bloquear a mensagem padrão do servidor
}
