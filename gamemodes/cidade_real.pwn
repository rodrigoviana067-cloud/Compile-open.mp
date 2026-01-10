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

    // Correção: Em open.mp/Pawn moderno, usa-se tags específicas ou booleanos
    ShowPlayerMarkers(PLAYER_MARKERS_MODE_GLOBAL); 
    ShowNameTags(true); 

    // Adicionado um veículo de teste para facilitar o spawn
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
    // Local de spawn definido
    SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
    SetPlayerFacingAngle(playerid, 90.0);
    return 1;
}

public OnPlayerText(playerid, text[])
{
    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);

    // Chat Local (Raio de 20 metros)
    foreach (new i : Player)
    {
        if (IsPlayerInRangeOfPoint(i, 20.0, x, y, z))
        {
            new msg[144];
            new name[MAX_PLAYER_NAME];
            GetPlayerName(playerid, name, sizeof(name));
            
            format(msg, sizeof(msg), "%s(%d) diz: %s", name, playerid, text);
            SendClientMessage(i, -1, msg);
        }
    }

    // Retornamos 0 para o servidor não enviar a mensagem global padrão
    return 0;
}
