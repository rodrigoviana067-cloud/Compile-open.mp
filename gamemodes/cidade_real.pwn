#include <open.mp>

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
    new Float:x, Float:y, Float:z;
    new msg[144];
    new name[MAX_PLAYER_NAME];
    new i;

    GetPlayerPos(playerid, x, y, z);
    GetPlayerName(playerid, name, sizeof(name));

    format(msg, sizeof(msg), "%s(%d) diz: %s", name, playerid, text);

    for (i = 0; i < MAX_PLAYERS; i++)
    {
        if (!IsPlayerConnected(i)) continue;

        if (IsPlayerInRangeOfPoint(i, 20.0, x, y, z))
        {
            SendClientMessage(i, -1, msg);
        }
    }

    return 0;
}
