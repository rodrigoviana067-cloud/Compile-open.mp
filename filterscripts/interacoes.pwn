#include <open.mp>

// Definição de Cores para o Chat Realista
#define COR_SUCESSO 0x00FF00FF
#define COR_ERRO    0xFF0000FF
#define COR_INFO    0xFFFF00FF

public OnPlayerKeyStateChange(playerid, KEY:newkeys, KEY:oldkeys)
{
    // Tecla Y (Interação Principal)
    if (newkeys & KEY_YES) 
    {
        // 1. ESCOLA DE BIKES (Spawn Novatos)
        if (IsPlayerInRangeOfPoint(playerid, 3.0, 1494.3, -1305.6, 13.5)) {
            new vehicleid = CreateVehicle(510, 1496.0, -1305.0, 13.5, 0.0, -1, -1, 60);
            PutPlayerInVehicle(playerid, vehicleid, 0);
            SendClientMessage(playerid, COR_SUCESSO, "[CIDADE REAL] Você pegou uma bicicleta de novato.");
            return 1;
        }

        // 2. CAIXA ELETRÔNICO (Exemplo: Praça Central)
        if (IsPlayerInRangeOfPoint(playerid, 2.0, 1481.0, -1741.0, 13.5)) {
            ShowPlayerDialog(playerid, 500, DIALOG_STYLE_MSGBOX, "{FFFF00}BANCO CENTRAL", "{FFFFFF}Saldo Atual: {00FF00}R$ 500,00\n\n{FFFFFF}Deseja sacar o auxílio diário?", "Sacar", "Sair");
            return 1;
        }

        // 3. HOSPITAL (Recuperar Vida)
        if (IsPlayerInRangeOfPoint(playerid, 3.0, 1172.0, -1323.0, 15.0)) {
            SetPlayerHealth(playerid, 100.0);
            ApplyAnimation(playerid, "HEAL_CURR", "HEAL_Loop", 4.1, 0, 0, 0, 0, 3000, 1);
            GameTextForPlayer(playerid, "~g~Tratado", 3000, 3);
            return 1;
        }

        // 4. MECÂNICA / REPARO (Dentro de um veículo)
        if (IsPlayerInAnyVehicle(playerid) && IsPlayerInRangeOfPoint(playerid, 5.0, 1024.0, -1024.0, 32.0)) {
            RepairVehicle(GetPlayerVehicleID(playerid));
            SendClientMessage(playerid, COR_SUCESSO, "[MECÂNICA] Seu veículo foi reparado!");
            return 1;
        }
    }
    return 1;
}

// Sistema de Avisos Flutuantes (Para o jogador saber que pode interagir)
public OnPlayerUpdate(playerid)
{
    // Verifica a cada segundo se o jogador está perto de um ponto de interação
    if(IsPlayerInRangeOfPoint(playerid, 3.0, 1494.3, -1305.6, 13.5)) 
        GameTextForPlayer(playerid, "~w~Aperte ~y~Y ~w~para Alugar Bike", 500, 3);
        
    else if(IsPlayerInRangeOfPoint(playerid, 2.0, 1481.0, -1741.0, 13.5))
        GameTextForPlayer(playerid, "~w~Aperte ~y~Y ~w~para usar o Caixa", 500, 3);

    else if(IsPlayerInRangeOfPoint(playerid, 3.0, 1172.0, -1323.0, 15.0))
        GameTextForPlayer(playerid, "~w~Aperte ~y~Y ~w~para se tratar", 500, 3);

    return 1;
}
