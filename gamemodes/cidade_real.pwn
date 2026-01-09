#define _INC_a_samp
#define _samp_included
#include <open.mp>

// --- Definições da Cidade ---
#define DIALOG_REGISTRO 1
#define DIALOG_LOGIN    2
#define COR_METRO       0xFFD700FF // Dourado para a Linha 1

// --- Variáveis Globais ---
new MetroLinha1;
enum pInfo {
    pSenha[64],
    pDinheiro,
    pNivel,
    bool:pLogado
}
new PlayerData[MAX_PLAYERS][pInfo];

main() {
    print("------------------------------------------");
    print(" CIDADE REAL RP 2026 - INICIALIZADA       ");
    print(" SISTEMA DE METRÔ E ECONOMIA ATIVOS       ");
    print("------------------------------------------");
}

public OnGameModeInit() {
    SetGameModeText("Cidade Real v1.0 - 2026");
    
    // --- Infraestrutura: Linha 1 do Metrô (Pershing Square) ---
    // Criando o trem físico que os jogadores verão passar
    MetroLinha1 = AddStaticVehicle(537, 1481.0, -1750.0, 13.5, 0.0, 1, 1); 
    
    // --- Mapeamento da Estação Central (Exemplos de Objetos) ---
    CreateDynamicObject(2942, 1485.0, -1745.0, 13.5, 0, 0, 0); // Máquina de Tickets
    CreateDynamic3DTextLabel("{FFD700}ESTAÇÃO CENTRAL\n{FFFFFF}Linha 1 - Metrô", -1, 1481.0, -1750.0, 14.5, 30.0);

    AddPlayerClass(0, 1154.22, -1769.34, 13.95, 0.0, WEAPON_FIST, 0, WEAPON_FIST, 0, WEAPON_FIST, 0);
    return 1;
}

public OnPlayerConnect(playerid) {
    PlayerData[playerid][pLogado] = false;
    
    // Sistema de Boas-Vindas Realista
    new str[128];
    format(str, sizeof(str), "{00FF00}Bem-vindo à Cidade Real, %p! {FFFFFF}Por favor, identifique-se.", playerid);
    SendClientMessage(playerid, -1, str);
    
    // Mostra o Registro (Simulação de 2026)
    ShowPlayerDialog(playerid, DIALOG_REGISTRO, DIALOG_STYLE_PASSWORD, "Registro - Cidade Real", "Crie uma senha para sua nova vida:", "Registrar", "Sair");
    return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
    if(dialogid == DIALOG_REGISTRO) {
        if(!response) return Kick(playerid);
        if(strlen(inputtext) < 4) return ShowPlayerDialog(playerid, DIALOG_REGISTRO, DIALOG_STYLE_PASSWORD, "Erro", "Senha muito curta! Tente novamente:", "Registrar", "Sair");
        
        // Simulação de salvamento de conta
        strmid(PlayerData[playerid][pSenha], inputtext, 0, strlen(inputtext));
        PlayerData[playerid][pDinheiro] = 500; // Salário inicial de cidadão
        PlayerData[playerid][pLogado] = true;
        
        GivePlayerMoney(playerid, PlayerData[playerid][pDinheiro]);
        SendClientMessage(playerid, 0xFFFF00FF, "[INFO]: Você recebeu R$ 500 de auxílio cidadão.");
        return 1;
    }
    return 1;
}

public OnPlayerText(playerid, const text[]) {
    // Chat de Proximidade (Apenas quem está perto ouve)
    new Float:pos[3];
    GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
    
    foreach(new i : Player) {
        if(IsPlayerInRangeOfPoint(i, 20.0, pos[0], pos[1], pos[2])) {
            new msg[144];
            format(msg, sizeof(msg), "%p diz: %s", playerid, text);
            SendClientMessage(i, -1, msg);
        }
    }
    return 0; // Bloqueia o chat global para manter o realismo
}

public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ) {
    // Sistema de GPS para a Cidade Real
    SetPlayerCheckpoint(playerid, fX, fY, fZ, 3.0);
    SendClientMessage(playerid, 0x00FFFFFF, "[GPS]: Destino marcado no seu mapa.");
    return 1;
}
