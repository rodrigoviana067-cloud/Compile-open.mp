#include <open.mp>
#include <foreach>

main()
{
    print("Cidade Real RP - open.mp iniciado");
}

public OnGameModeInit()
{
    SetGameModeText("Cidade Real RP v1.0");
    ShowPlayerMarkers(1);
    ShowNameTags(1);
    return 1;
}

public OnPlayerConnect(playerid)
{
    SendClientMessage(playerid, -1, "Bem-vindo à Cidade Real RP!");
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
    GetPlayerPos(playerid, x, y, z);

    foreach (new i : Player)
    {
        if (IsPlayerInRangeOfPoint(i, 20.0, x, y, z))
        {
            new msg[144];
            format(msg, sizeof msg, "%d diz: %s", playerid, text);
            SendClientMessage(i, -1, msg);
        }
    }
    return 0;
}
