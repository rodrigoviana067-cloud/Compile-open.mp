#define SAMP_COMPAT
#include <open.mp>
#include <foreach>

// --- Definições ---
#define DIALOG_REGISTRO 1

main() {
    print("------------------------------------------");
    print(" CIDADE REAL RP 2026 - OPEN.MP            ");
    print("------------------------------------------");
}

public OnGameModeInit() {
    SetGameModeText("Cidade Real v1.0");
    AddPlayerClass(0, 1481.0, -1750.0, 13.5, 0.0, 0, 0, 0, 0, 0, 0); 
    AddStaticVehicle(537, 1481.0, -1740.0, 13.5, 0.0, 1, 1);
    return 1;
}

public OnPlayerConnect(playerid) {
    SendClientMessage(playerid, 0x00FF00FF, "Bem-vindo à Cidade Real! Motor: open.mp");
    ShowPlayerDialog(playerid, DIALOG_REGISTRO, DIALOG_STYLE_MSGBOX, "Cidadania", "Deseja iniciar sua vida nesta cidade?", "Sim", "Sair");
    return 1;
}

// CORREÇÃO DEFINITIVA: const text[] e uso correto de chaves
public OnPlayerText(playerid, const text[]) {
    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);
    
    foreach(i : Player) {
        if(IsPlayerInRangeOfPoint(i, 20.0, x, y, z)) {
            new msg[144];
            // No open.mp, %p traduz para o nome do jogador
            format(msg, sizeof(msg), "%p diz: %s", playerid, text);
            SendClientMessage(i, -1, msg);
        }
    }
    return 0; // Retorna 0 para a mensagem não sair no chat global
}
