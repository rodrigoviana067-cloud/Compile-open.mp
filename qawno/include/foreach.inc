#if defined _foreach_included
    #endinput
#endif
#define _foreach_included

// Macro simplificada e funcional para open.mp 2026
#define foreach(%0:%1) for(new %0 = 0; %0 < MAX_PLAYERS; %0++) if(IsPlayerConnected(%0))
