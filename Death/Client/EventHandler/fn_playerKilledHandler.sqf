#include "..\..\constants.hpp"

LSTART("PLAYER KILLED");
if(player getVariable [KEY_STATE, STATE_OK] isEqualTo STATE_OK) then {
    //TODO: no saving until db is ready
    //SLOG("saving character before respawn to lobby...");
    //SLOG("...saved");
    call X11_fnc_death;
    private _hqPos = getPos GLOB(DPL_HQ);
    DEBUG(_hqPos);
    _state = player call X11_fnc_createCharacterStateFromPlayer;
    [_state, KEY_POSITION, _hqPos] call CBA_fnc_hashSet;
    _slot = player getVariable [KEY_SLOT, -1];
    [SERVER, "X11_fnc_updateCharacter", [getPlayerUID player, _state, _slot], //request-related
        [], {
        sleep 5;
        call X11_fnc_spawnInLobby;
        createDialog "X11_Login_Dialog";
        call X11_fnc_initLoginDialog;
        LEND("PLAYER KILLED");
        }
    ] call Promise_Create;
}