#define SAMP_COMPAT 0
#include <open.mp>
#include <foreach>

main()
{
    print("====================================");
    print("  Cidade Real RP - open.mp iniciado ");
    print("====================================");
}

public OnGameModeInit()
{
    SetGameModeText("Cidade Real RP v1.0");
    ShowPlayerMarkers(PLAYER_MARKERS_MODE_GLOBAL);
    ShowNameTags(true);
    return 1;
}

public OnPlayerConnect(Player:player)
{
    SendClientMessage(player, 0x00FF00FF, "Bem-vindo à Cidade Real RP!");
    SendClientMessage(player, -1, "Servidor rodando em open.mp nativo.");
    return 1;
}

public OnPlayerSpawn(Player:player)
{
    SetPlayerPos(player, 1958.3783, 1343.1572, 15.3746);
    SetPlayerFacingAngle(player, 270.0);
    SetPlayerInterior(player, 0);
    SetPlayerVirtualWorld(player, 0);
    return 1;
}

public OnPlayerText(Player:player, text[])
{
    new Float:x, Float:y, Float:z;
    GetPlayerPos(player, x, y, z);

    foreach (new Player:i)
    {
        if (IsPlayerInRangeOfPoint(i, 20.0, x, y, z))
        {
            new msg[144];
            format(msg, sizeof msg, "%p diz: %s", player, text);
            SendClientMessage(i, -1, msg);
        }
    }
    return 0;
}
