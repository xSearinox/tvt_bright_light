params ["_object", "_dir"];

_object setVariable ["GRAD_trace_timestamp", CBA_missionTime];
_object setVariable ["GRAD_trace_direction", _dir];

[_object] call custom_fnc_clue_add_action;