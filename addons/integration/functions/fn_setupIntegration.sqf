#include "script_component.hpp"

params [["_logic", objNull]];

private _loggingLevel = _logic getVariable ["Logging", -1];
[_loggingLevel, DEBUG_CTX] call coopr_fnc_setLogLevel;
[_loggingLevel, DEBUG_CTX] remoteExec ["coopr_fnc_setLogLevel", EXEC_GLOBAL];

INTEGRATE_ACE3 = _logic getVariable ["ACE3", false] && call coopr_fnc_isACE3Active;
//TODO: add func like isALIVEactive
INTEGRATE_ALIVE = _logic getVariable ["ALIVE", false];

publicVariable "INTEGRATE_ACE3";
publicVariable "INTEGRATE_ALIVE";

DEBUG2("integrate ACE3: %1", INTEGRATE_ACE3);
DEBUG2("integrate ALiVE: %1", INTEGRATE_ALIVE);
