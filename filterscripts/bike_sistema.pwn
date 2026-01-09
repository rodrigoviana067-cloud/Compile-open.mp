#include <open.mp>

new PickupBike;
new PlayerBike[MAX_PLAYERS] = {INVALID_VEHICLE_ID, ...};

public OnFilterScriptInit()
{
    // Cria um pickup de 'Informação' (ID 1239) na Escola de Bicicletas
    // Coordenadas: 1494.3, -1305.6, 13.5
    PickupBike = CreatePickup(1239, 1, 1494.3, -1305.6, 13.5, 0);
    return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
    if(pickupid == PickupBike)
    {
        // Se o jogador já tem uma bike, vamos remover a antiga antes de dar uma nova
        if(PlayerBike[playerid] != INVALID_VEHICLE_ID) {
            DestroyVehicle(PlayerBike[playerid]);
        }

        // Cria a bike (BMX - ID 481) e coloca o jogador dentro
        new Float:x, Float:y, Float:z;
        GetPlayerPos(playerid, x, y, z);
        
        PlayerBike[playerid] = CreateVehicle(481, x, y, z, 0.0, -1, -1, -1);
        PutPlayerInVehicle(playerid, PlayerBike[playerid], 0);
        
        SendClientMessage(playerid, 0x00FF00FF, "[CIDADE REAL] Você pegou uma bicicleta de novato. Ela sumirá se você descer!");
    }
    return 1;
}

public OnPlayerStateChange(playerid, PLAYER_STATE:newstate, PLAYER_STATE:oldstate)
{
    // Detecta quando o jogador DESCE da bicicleta (muda de motorista para a pé)
    if(oldstate == PLAYER_STATE_DRIVER && newstate == PLAYER_STATE_ONFOOT)
    {
        if(PlayerBike[playerid] != INVALID_VEHICLE_ID)
        {
            // Destrói a bicicleta imediatamente ao descer para não poluir a rua
            DestroyVehicle(PlayerBike[playerid]);
            PlayerBike[playerid] = INVALID_VEHICLE_ID;
            SendClientMessage(playerid, 0xFFFF00FF, "[CIDADE REAL] A bicicleta de novato foi recolhida.");
        }
    }
    return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    // Garante que a bike suma se o jogador cair ou sair do servidor
    if(PlayerBike[playerid] != INVALID_VEHICLE_ID) {
        DestroyVehicle(PlayerBike[playerid]);
        PlayerBike[playerid] = INVALID_VEHICLE_ID;
    }
    return 1;
}
