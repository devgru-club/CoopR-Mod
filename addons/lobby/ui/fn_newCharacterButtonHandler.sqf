#include "script_component.hpp"

params ["_ctrl"];
private _slot = _ctrl getVariable ["_slot", -1];
closeDialog 1;
createDialog "coopr_NewProfile_Dialog";
[_slot] spawn coopr_fnc_showNewCharacterDialog;