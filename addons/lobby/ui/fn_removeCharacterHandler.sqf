#include "script_component.hpp"

params ["_ctrl"];
private _slot = _ctrl getVariable ["_slot", -1];
private _uid = getPlayerUID player;

DEBUG("removing character for player id %1", _uid);

//TODO: add remove Character function
[EXEC_SERVER, "coopr_fnc_removeCharacter", [_uid, _slot], //request-related
    [], {
        params ["_args", "_result"];
        closeDialog 1;
    }
] call Promise_Create;
