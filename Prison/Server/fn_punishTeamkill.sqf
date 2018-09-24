#include "..\..\globals.hpp"
#include "..\constants.hpp"

params ["_renegade"];

[playerSide, "HQ"] commandChat "Du hast einen Kameraden auf den Gewissen. Ab ins Cafe Viereck!";

private _oldPosition =  getPos _renegade;
private _currentServerTime = serverTime;
private _clientOwnerId = owner _renegade;

["mark player as 'renegade'", DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;
_renegade setVariable [KEY_IS_RENEGADE, true];
_renegade setVariable [KEY_PRISON_START, _currentServerTime];
_renegade setVariable [KEY_PRISON_FREE_POSITION, _oldPosition];

[-30] remoteExec ["X11_fnc_updateReputation", _clientOwnerId];

_renegade call X11_fnc_syncPlayerToServer;

[{call X11_fnc_checkFreedom}, 3, [_renegade, _oldPosition]] call CBA_fnc_addPerFrameHandler;

_renegade call X11_fnc_makePrisoner;

[format ["player %1 has been arrested at %2", name _renegade, _currentServerTime], DEBUG_CTX, DEBUG_CFG] call CBA_fnc_debug;


