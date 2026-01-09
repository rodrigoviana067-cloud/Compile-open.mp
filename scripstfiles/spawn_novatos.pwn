#include <open.mp>

public OnPlayerSpawn(playerid)
{
    // Limpa a faca e a arma que o CJ estava pegando
    ResetPlayerWeapons(playerid);
    
    // Define a posição na Escola de Bicicletas
    // Nota: Em programação usamos PONTO (.) em vez de vírgula
    SetPlayerPos(playerid, 1494.3350, 1305.6510, 1093.2890);
    SetPlayerFacingAngle(playerid, 0.0);
    
    SendClientMessage(playerid, -1, "{FFFF00}[Cidade Real] {FFFFFF}Bem-vindo à Escola de Bicicletas! Pegue uma para começar.");
    return 1;
}
