#include <open.mp>

new Text:LogoCidadeReal;

public OnFilterScriptInit()
{
    // Criando a TextDraw da Logo (Aparece no centro da tela)
    LogoCidadeReal = TextDrawCreate(320.0, 150.0, "CIDADE_REAL_RP");
    TextDrawAlignment(LogoCidadeReal, TEXT_DRAW_ALIGN_CENTER);
    TextDrawBackgroundColor(LogoCidadeReal, 255);
    TextDrawFont(LogoCidadeReal, TEXT_DRAW_FONT_1); // Fonte estilizada
    TextDrawLetterSize(LogoCidadeReal, 0.6, 2.5);
    TextDrawColor(LogoCidadeReal, 0xFFFF00FF); // Amarelo vibrante
    TextDrawSetOutline(LogoCidadeReal, 2);
    TextDrawSetProportional(LogoCidadeReal, true);
    TextDrawSetShadow(LogoCidadeReal, 0);
    return 1;
}

public OnPlayerConnect(playerid)
{
    // Mostra a Logo assim que o jogador conectar
    TextDrawShowForPlayer(playerid, LogoCidadeReal);

    // Câmera Cinematográfica (Movimento suave sobre Los Santos)
    InterpolateCameraPos(playerid, 1558.0, -1710.0, 70.0, 1481.0, -1747.0, 50.0, 15000, CAMERA_MOVE);
    InterpolateCameraLookAt(playerid, 1481.2, -1747.5, 13.5, 1481.2, -1747.5, 13.5, 15000, CAMERA_MOVE);

    // Caixa de Login
    ShowPlayerDialog(playerid, 1, DIALOG_STYLE_PASSWORD, 
        "{FFFF00}AUTENTICAÇÃO", 
        "{FFFFFF}Seja bem-vindo à nossa comunidade!\n\n{777777}Para garantir sua segurança, digite sua senha:", 
        "Entrar", "Sair");
    
    return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == 1)
    {
        // Esconde a Logo quando o jogador terminar o login
        TextDrawHideForPlayer(playerid, LogoCidadeReal);

        if(response)
        {
            SendClientMessage(playerid, 0x00FF00FF, "[SUCESSO]: Login realizado. Bom jogo!");
            SetCameraBehindPlayer(playerid);
            SpawnPlayer(playerid); 
        }
        else
        {
            Kick(playerid);
        }
        return 1;
    }
    return 0;
}
