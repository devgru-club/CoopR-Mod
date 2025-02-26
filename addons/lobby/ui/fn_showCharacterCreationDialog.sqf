#include "script_component.hpp"

params ["_slot"];

disableSerialization;

DEBUG("initialising character creation ui");

waitUntil {!isNull findDisplay GUI_ID_CHARACTER_CREATION_DIALOG};

private _newCharacterDisplay = findDisplay GUI_ID_CHARACTER_CREATION_DIALOG;

private _nameTextEdit = _newCharacterDisplay displayCtrl GUI_ID_CHARACTER_EDIT_NAME;
private _infoText = _newCharacterDisplay displayCtrl GUI_ID_CHARACTER_LABEL_SPECIALISATION;
private _roleSelectBox = _newCharacterDisplay displayCtrl GUI_ID_CHARACTER_COMBO_ROLE;
private _createButton = _newCharacterDisplay displayCtrl GUI_ID_CHARACTER_BUTTON_CREATE;
private _picture = _newCharacterDisplay displayCtrl GUI_ID_CHARACTER_CLASSPICTURE;

private _rolesHash = [COOPR_CHARACTER_ROLES, []] call CBA_fnc_hashCreate;
private _roleNames = [_rolesHash] call CBA_fnc_hashKeys;

_createButton setVariable ["_nameTextEdit", _nameTextEdit];
_createButton setVariable ["_infoText", _infoText];
_createButton setVariable ["_roleSelectBox", _roleSelectBox];
_createButton setVariable ["_rolesHash", _rolesHash];
_createButton setVariable ["_slot", _slot];

{_roleSelectBox lbAdd _x} forEach _roleNames;
_roleSelectBox setVariable ["_rolesHash", _rolesHash];

// set default selection to first item
_roleSelectBox lbSetCurSel 0;

_roleSelectBox ctrlAddEventHandler ["LBSelChanged", { call coopr_fnc_roleSelectionEH}];
_createButton ctrlAddEventHandler ["MouseButtonDown", { call coopr_fnc_createCharacterHandler}];

DEBUG("character creation ui initialized");

