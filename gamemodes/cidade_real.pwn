#define SAMP_COMPAT
#include <open.mp>
#include <foreach>

main()
{
    print("Cidade Real RP - Iniciado");
}

public OnGameModeInit()
{
    SetGameModeText("Cidade Real v1.0");
    return 1;
}

public OnPlayerConnect(Player:playerid)
{
    SendClientMessage(playerid, -1, "Bem-vindo à Cidade Real!");
    return 1;
}

public OnPlayerText(Player:playerid, const text[])
{
    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);

    foreach (new Player:i)
    {
        if (IsPlayerInRangeOfPoint(i, 20.0, x, y, z))
        {
            new msg[144];
            format(msg, sizeof msg, "ID %d diz: %s", _:playerid, text);
            SendClientMessage(i, -1, msg);
        }
    }
    return 0;
}
