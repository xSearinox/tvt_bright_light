
params ["_marker","_side","_hide"];
private _value = if (_hide) then {0} else {1};
if (side player == _side) then {_marker setMarkerAlphaLocal _value;};