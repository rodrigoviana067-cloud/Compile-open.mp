#define SAMP_COMPAT
#include <open.mp>

main()
{
    print("Cidade Real RP - Iniciado");
}

public OnGameModeInit()
{
    SetGameModeText("Cidade Real v1.0");
    return 1;
}

public OnPlayerConnect(playerid)
{
    SendClientMessage(playerid, -1, "Bem-vindo à Cidade Real!");
    return 1;
}

public OnPlayerText(playerid, const text[])
{
    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);

    for (new i = 0; i < MAX_PLAYERS; i++)
    {
        if (!IsPlayerConnected(i)) continue;

        if (IsPlayerInRangeOfPoint(i, 20.0, x, y, z))
        {
            new msg[144];
            format(msg, sizeof msg, "%d diz: %s", playerid, text);
            SendClientMessage(i, -1, msg);
        }
    }
    return 0;
}
