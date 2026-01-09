#include <open.mp>

main() {
    print("----------------------------------");
    print(" CIDADE REAL RP 2026 CARREGADA    ");
    print("----------------------------------");
}

public OnGameModeInit() {
    SetGameModeText("Cidade Real RP v1.0");
    
    // Padrão 2026: Usando WEAPON_FIST em vez de tags antigas
    AddPlayerClass(0, 1154.22, -1769.34, 13.95, 0.0, WEAPON_FIST, 0, WEAPON_FIST, 0, WEAPON_FIST, 0);
    return 1;
}

public OnPlayerConnect(playerid) {
    SendClientMessage(playerid, 0x00FF00FF, "Bem-vindo à Cidade Real! Use Nome_Sobrenome.");
    return 1;
}

public OnPlayerText(playerid, const text[]) {
    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);
    
    // Iterador moderno compatível com open.mp
    foreach(new i : Player) {
        if(IsPlayerInRangeOfPoint(i, 20.0, x, y, z)) {
            SendPlayerMessageToPlayer(i, playerid, text);
        }
    }
    return 0; 
}
