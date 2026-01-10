#include <YSI_Core/y_core>
#include <YSI_Storage/y_ini>
#include <a_samp>
#include <open.mp>

// =====================
// ENUMS E VARIÁVEIS
// =====================
enum pInfo {
    pDinheiro,
    pSkin,
    pPosX,
    pPosY,
    pPosZ
}

new PlayerData[MAX_PLAYERS][pInfo];

// =====================
// FUNÇÃO PARA CARREGAR DADOS DO JOGADOR
// =====================
forward LoadUser_Data(playerid, name[], value[]);
public LoadUser_Data(playerid, name[], value[]) {
    // Monta o caminho do arquivo .ini
    new path[64];
    format(path, sizeof(path), "contas/%s.ini", name);

    if (fexist(path)) {
        new INI:file = INI_Open(path);

        INI_ReadInt(file, "Dinheiro", PlayerData[playerid][pDinheiro], 0);
        INI_ReadInt(file, "Skin", PlayerData[playerid][pSkin], 0);
        INI_ReadFloat(file, "PosX", PlayerData[playerid][pPosX], 0.0);
        INI_ReadFloat(file, "PosY", PlayerData[playerid][pPosY], 0.0);
        INI_ReadFloat(file, "PosZ", PlayerData[playerid][pPosZ], 0.0);

        INI_Close(file);
        return 1;
    }
    return 0; // arquivo não existe
}

// =====================
// FUNÇÃO PARA SALVAR DADOS AO DESCONECTAR
// =====================
public OnPlayerDisconnect(playerid, reason) {
    new name[MAX_PLAYER_NAME];
    GetPlayerName(playerid, name, sizeof(name));

    // Monta o caminho do arquivo .ini
    new path[64];
    format(path, sizeof(path), "contas/%s.ini", name);

    // Cria pasta "contas" se não existir
    if (!fexist("contas")) mkdir("contas");

    // Pega posição do jogador
    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);

    // Salva dados no arquivo
    new INI:file = INI_Open(path);

    INI_WriteInt(file, "Dinheiro", GetPlayerMoney(playerid));
    INI_WriteInt(file, "Skin", GetPlayerSkin(playerid));
    INI_WriteFloat(file, "PosX", x);
    INI_WriteFloat(file, "PosY", y);
    INI_WriteFloat(file, "PosZ", z);

    INI_Close(file);

    return 1;
}
