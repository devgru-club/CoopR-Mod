#include "script_component.hpp"

params ["_characterInfos", "_characterOverlays", "_characterButtons", "_characterPictures"];

_loginDisplay displayRemoveAllEventHandlers "Unload";
_loginDisplay displayAddEventHandler ["Unload", {call coopr_fnc_loginDialogUnloadHandler}];

{ _x ctrlSetText localize "str.coopr.characters.fetch" } forEach _characterInfos;

[EXEC_SERVER, "coopr_fnc_getCharacters", [getPlayerUID player], //request-related
    [_characterInfos, _characterOverlays, _characterButtons, _characterPictures], {
        params ["_args", "_result"];
        _args params ["_characterInfos", "_characterOverlays", "_characterButtons", "_characterPictures"];

        private _characterSlots = _result;
        {
            private _isNotEmptySlot = [_x] call coopr_fnc_isCharacterSlot;
            private _overlay = _characterOverlays select _forEachIndex;
            private _picture = _characterPictures select _forEachIndex;
            private _info = _characterInfos select _forEachIndex;
            private _removeButton = _characterButtons select _forEachIndex;

            _info ctrlSetText localize "str.coopr.characters.nocharacter";

            // set data to controls
            _overlay setVariable ["_slot", _forEachIndex];
            private _handlerId = _overlay ctrlAddEventHandler ["MouseButtonDown", {call coopr_fnc_newCharacterButtonHandler}];
            _overlay setVariable ["_registerHandlerId", _handlerId];

            if (_isNotEmptySlot) then {
                [_x, _info] call coopr_fnc_setCharacterInfo;
                [_x, _overlay, _forEachIndex] call coopr_fnc_setOverlayHandler;
                [_x, _picture] call coopr_fnc_updateCharacterPicture;
                // add logic to delete character
                _removeButton setVariable ["_slot", _forEachIndex];
                _removeButton ctrlAddEventHandler ["MouseButtonDown",  {call coopr_fnc_removeCharacterHandler}];
            } else {
                [nil, _picture] call coopr_fnc_updateCharacterPicture;
            };

        } forEach _characterSlots;
    }
] call Promise_Create;
