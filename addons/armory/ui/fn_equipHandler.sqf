#include "script_component.hpp"

private _ctrl = _this select 0;

private _itemsHash = _ctrl getVariable ["_itemsHash", []];
private _currentReputation = _ctrl getVariable ["_currentReputation", 0];
private _textboxInfos = _ctrl getVariable ["_textboxInfos", objNull];
private _listBox = _ctrl getVariable ["_listBox", objNull];
private _index = lbCurSel _listBox;

if (_index != -1) then {
private _selectedItem = _listBox lbData _index;
private _values = [_itemsHash, _selectedItem] call CBA_fnc_hashGet;
private _repNeeded = _values select 0;

if (_repNeeded > _currentReputation) exitWith {
    DEBUG2("not enough rep pts for item: %1", _selectedItem);
    _textboxInfos ctrlSetStructuredText composeText [localize "str.coopr.armory.vendor.norep"];
};

player addWeapon _selectedItem;
};
