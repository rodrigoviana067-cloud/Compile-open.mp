#include <core>
#include <float>
#include <string>
#include <open.mp>

main() {
    print("----------------------------------");
    print(" CIDADE REAL RP 2026 CARREGADA    ");
    print("----------------------------------");
}

public OnGameModeInit() {
    SetGameModeText("Cidade Real RP v1.0");
    AddPlayerClass(0, 1154.22, -1769.34, 13.95, 0.0, WEAPON_NONE, 0, WEAPON_NONE, 0, WEAPON_NONE, 0);
}

public OnPlayerConnect(playerid) {
    SendClientMessage(playerid, -1, "{00FF00}Bem-vindo à Cidade Real! Use Nome_Sobrenome.");
    return 1;
}

public OnPlayerText(playerid, text[]) {
    // Chat de Proximidade (Diferencial RP)
    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);
    for(new i = 0; i < MAX_PLAYERS; i++) {
        if(IsPlayerInRangeOfPoint(i, 20.0, x, y, z)) {
            SendPlayerMessageToPlayer(i, playerid, text);
        }
    }
    return 0; 
}
