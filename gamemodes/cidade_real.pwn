// Em 2026, a include open.mp já carrega float, string e core automaticamente.
#include <open.mp>

main() {
    print("----------------------------------");
    print(" CIDADE REAL RP 2026 CARREGADA    ");
    print("----------------------------------");
}

public OnGameModeInit() {
    SetGameModeText("Cidade Real RP v1.0");
    
    // Corrigido para o padrão open.mp (usando as tags de arma corretas)
    AddPlayerClass(0, 1154.22, -1769.34, 13.95, 0.0, WEAPON_FIST, 0, WEAPON_FIST, 0, WEAPON_FIST, 0);
    
    return 1;
}

public OnPlayerConnect(playerid) {
    // Cores em formato HEX para mensagens
    SendClientMessage(playerid, 0x00FF00FF, "Bem-vindo à Cidade Real! Use Nome_Sobrenome.");
    return 1;
}

public OnPlayerText(playerid, const text[]) {
    // Chat de Proximidade Realista
    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);
    
    foreach(new i : Player) { // Usando o iterador moderno do open.mp (mais leve que MAX_PLAYERS)
        if(IsPlayerInRangeOfPoint(i, 20.0, x, y, z)) {
            SendPlayerMessageToPlayer(i, playerid, text);
        }
    }
    return 0; // Retorna 0 para não duplicar a mensagem no chat global
}
