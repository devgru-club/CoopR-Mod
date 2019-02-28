#include "script_component.hpp"
/*
 * Author: xetra11
 *
 * This will initialize a task tracker for a given unit
 *
 * Arguments:
 * 0: _unit <OBJECT> - unit this task is assigned to
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [_unit] call coopr_fnc_initTaskTracker;
 *
 * Public: No
 *
 * Scope: Server
 */

params [["_unit", objNull]];

if (_unit isEqualTo objNull) exitWith { ERROR("_unit was objNull") };

if (isServer) then {
    private _taskTracker = EMPTY_HASH;

    DEBUG("initialising task tracker");
    // init task tracker
    [_taskTracker, COOPR_KEY_TASK_TRACKER_LEAVE_BASE, -1] call CBA_fnc_hashSet;
    [_taskTracker, COOPR_KEY_TASK_TRACKER_ENTER_BASE, -1] call CBA_fnc_hashSet;
    [_taskTracker, COOPR_KEY_TASK_TRACKER_ENTER_TASK_AREA, -1] call CBA_fnc_hashSet;
    [_taskTracker, COOPR_KEY_TASK_TRACKER_LEAVE_TASK_AREA, -1] call CBA_fnc_hashSet;

    _unit setVariable [COOPR_KEY_TASK_TRACKER, _taskTracker, true];
    DEBUG2("assigned task tracker to %1", _unit);
} else {
    SERVER_ONLY_ERROR;
}
