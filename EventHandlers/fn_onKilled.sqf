params ["_unit", "_killer", "_instigator", "_useEffects"];

// workaround to get the actual killer unit. Something is screwing up the 'killed' handler
_killer = _unit getVariable ["ace_medical_lastDamageSource", objNull];

private _isSuicide = _unit == _killer;
private _sideKiller = side group _killer;
private _sideUnit = side group _unit;
private _badSide = sideUnknown;
private _playerIsKiller = isPlayer _killer;
private _nameOfKiller = name _killer;
private _isBlueOnBlue = [group _killer, group _unit] call X11_fnc_sameSide;

// check if killer attacked same side
if (_isBlueOnBlue and not _isSuicide) then {
  if (_playerIsKiller) exitWith {
    [format ["%1 is being punished for friendly fire", _nameOfKiller], DEBUG_STR_EVENT, DEBUG_CFG] call CBA_fnc_debug;
    _killer call X11_fnc_punishRenegade;
  }
};

// determine which said is the bad one here
if(_sideKiller == west) then{
    _badSide = east;
};
if (_sideKiller == east) then {
    _badSide = west;
};

if (_sideUnit == _badSide and (_unit call CBA_fnc_isPerson)) then {
 if (_playerIsKiller) exitWith {
    private _currentReputation = profileNamespace getVariable ["Reputation", 0];
    profileNamespace setVariable ["Reputation", _currentReputation + 20];
    [format ["%1 is receiving %2 rep pts for kill", _nameOfKiller, 20], DEBUG_STR_EVENT, DEBUG_CFG] call CBA_fnc_debug;
 };
};




