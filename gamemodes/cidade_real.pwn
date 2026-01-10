#define SAMP_COMPAT          // Essencial para rodar funções clássicas no open.mp
#include <open.mp>           // Carrega a base do servidor
#include <foreach>           // Resolve o erro do "foreach" e "undefined symbol Player"

// O <core> já está dentro do <open.mp>, não precisa repetir.

// --- Definições do Servidor ---
#define DIALOG_REGISTRO 1

main() {
    print("------------------------------------------");
    print(" CIDADE REAL RP 2026 - COMPILADO COM SUCESSO ");
    print(" SISTEMA OPEN.MP PURO                     ");
    print("------------------------------------------");
}

public OnGameModeInit() {
    SetGameModeText("Cidade Real v1.0");
    
    // Posição Inicial: Pershing Square (Perto da Estação Central)
    AddPlayerClass(0, 1481.0, -1750.0, 13.5, 0.0, 0, 0, 0, 0, 0, 0); // Removed weapon definitions
    
    // Veículo de teste (Trem do Metrô)
    AddStaticVehicle(537, 1481.0, -1740.0, 13.5, 0.0, 1, 1);
    
    return 1;
}

public OnPlayerConnect(playerid) {
    SendClientMessage(playerid, 0x00FF00FF, "Bem-vindo à Cidade Real! Você está usando o motor open.mp.");
    
    // Exemplo de Dialog moderno
    ShowPlayerDialog(playerid, DIALOG_REGISTRO, DIALOG_STYLE_MSGBOX, "Cidadania", "Você deseja iniciar sua vida nesta cidade?", "Sim", "Sair");
    return 1;
}

public OnPlayerText(playerid, const text[]) {
    // Chat de proximidade simples para teste
    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);
    
    foreach(new i : Player) {
        if(IsPlayerInRangeOfPoint(i, 20.0, x, y, z)) {
            new msg[144];
            format(msg, sizeof(msg), "%p diz: %s", playerid, text);
            SendClientMessage(i, -1, msg);
        }
    }
    return 0; 
}
