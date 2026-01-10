/*----------------------------------------------------------------------------*-
    foreach.inc - Versão Standalone para open.mp (Cidade Real RP)
    Data: 10 de Janeiro de 2026
-*----------------------------------------------------------------------------*/

#if defined _foreach_included
    #endinput
#endif
#define _foreach_included

#include <open.mp>

// Definição simplificada do iterador Player
#if !defined Player
    #define Player 0
#endif

/*
    Macro foreach: Traduz o comando foreach(new i : Player) 
    para um loop otimizado para o open.mp
*/
#define foreach(%0:%1) for(new %0 = 0; %0 < MAX_PLAYERS; %0++) if(IsPlayerConnected(%0))

// Compatibilidade extra para o compilador não reclamar do iterador
#if !defined iterinit
    #define iterinit(%0)
#endif

// Caso você use Bot/NPC futuramente
#if !defined NPC
    #define NPC 1
#endif

/* Fim do arquivo foreach.inc */
