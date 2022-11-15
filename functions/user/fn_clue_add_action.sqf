params ["_object"];

private _mainAction = ["ACE_MainActions", "Read Trace", "",{
}, {true}] call ace_interact_menu_fnc_createAction;

private _readTrace = ["GRAD_interpretTrace", "Read Trace", "", {

    private _age = (_target getVariable ["GRAD_trace_timestamp", CBA_missionTime]);
   
    private _direction = [_target] call custom_fnc_clue_get_bearing;
    private _combinedString = [_target, _direction] call custom_fnc_clue_get_age;

    [_combinedString] call CBA_fnc_notify;

}, {true}] call ace_interact_menu_fnc_createAction;

[_object, 0, [], _mainAction] call ace_interact_menu_fnc_addActionToObject;
[_object, 0, ["ACE_MainActions"], _readTrace] call ace_interact_menu_fnc_addActionToObject;
