#include <open.mp>
#include <foreach>

main()
{
    print("Cidade Real RP - Iniciado");
}

public OnGameModeInit()
{
    SetGameModeText("Cidade Real RP v1.0");
    ShowPlayerMarkers(PLAYER_MARKERS_MODE_GLOBAL); 
    ShowNameTags(true); 
    return 1;
}

public OnPlayerConnect(playerid)
{
    SendClientMessage(playerid, -1, "Bem-vindo!");
    return 1;
}

public OnPlayerSpawn(playerid)
{
    SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
    return 1;
}

public OnPlayerText(playerid, text[])
{
    // 1. Declare todas as variáveis no topo da função
    new Float:x, Float:y, Float:z;
    new msg[144]; // O ERRO ESTAVA AQUI: Faltava o tamanho [144]
    new name[MAX_PLAYER_NAME];

    // 2. Execute a lógica
    GetPlayerPos(playerid, x, y, z);
    GetPlayerName(playerid, name, sizeof(name));
    
    format(msg, sizeof(msg), "%s(%d) diz: %s", name, playerid, text);

    // 3. O loop foreach
    foreach (new i : Player)
    {
        if (IsPlayerInRangeOfPoint(i, 20.0, x, y, z))
        {
            SendClientMessage(i, -1, msg);
        }
    }

    return 0; // Retorna 0 para evitar mensagem duplicada
}
