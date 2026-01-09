#include <open.mp>

public OnPlayerSpawn(playerid)
{
    // Define o spawn na Escola de Bicicletas (Coordenadas de Rua para não cair do céu)
    SetPlayerInterior(playerid, 0); // Mundo aberto
    SetPlayerPos(playerid, 1494.3, -1305.6, 13.5); 
    SetPlayerFacingAngle(playerid, 0.0);

    // --- NOVIDADE: Skin e Dinheiro ---

    // Define a Skin Inicial (CJ - Skin ID 0, a mais comum para iniciantes)
    // Você pode trocar '0' por outro ID de skin se quiser (ex: 200, 210)
    SetPlayerSkin(playerid, 0); 

    // Define o Dinheiro Inicial (R$ 500 para começar a economia)
    GivePlayerMoney(playerid, 500);

    // Remove armas indesejadas
    ResetPlayerWeapons(playerid);
    
    SendClientMessage(playerid, -1, "{FFFF00}[Cidade Real] {FFFFFF}Bem-vindo à Escola de Bicicletas! Você recebeu R$ 500,00.");
    return 1;
}
