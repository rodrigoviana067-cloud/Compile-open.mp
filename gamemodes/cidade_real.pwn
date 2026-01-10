#include <open.mp>
#include <foreach>

main()
{
    print("----------------------------------");
    print(" Cidade Real RP - open.mp iniciado ");
    print("----------------------------------");
}

public OnGameModeInit()
{
    SetGameModeText("Cidade Real RP v1.0");

    // Correção de Tags para open.mp
    ShowPlayerMarkers(PLAYER_MARKERS_MODE_GLOBAL); 
    ShowNameTags(true); 

    // Veículo de teste no spawn
    AddStaticVehicle(411, 1958.3783, 1343.1572, 15.3746, 0.0, 1, 1); 
    
    return 1;
}

public OnPlayerConnect(playerid)
{
    SendClientMessage(playerid, -1, "{00FF00}Bem-vindo à Cidade Real RP!");
    return 1;
}

public OnPlayerSpawn(playerid)
{
    SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
    SetPlayerFacingAngle(playerid, 90.0);
    return 1;
}

public OnPlayerText(playerid, text[])
{
    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);

    // Variáveis para o chat
    new msg[144]; // CORREÇÃO: msg deve ter um tamanho definido, ex: 144
    new name[MAX_PLAYER_NAME];
    GetPlayerName(playerid, name, sizeof(name));
    
    // Formata a mensagem fora do loop para economizar processamento
    format(msg, sizeof(msg), "%s(%d) diz: %s", name, playerid, text);

    // Loop de chat local usando foreach
    foreach (new i : Player)
    {
        if (IsPlayerInRangeOfPoint(i, 20.0, x, y, z))
        {
            SendClientMessage(i, -1, msg);
        }
    }

    // Retorna 0 para desativar o chat global padrão do SA-MP/open.mp
    return 0; 
}
