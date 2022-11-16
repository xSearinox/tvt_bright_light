if (!isServer) exitWith {};

params ["_unit"];

private _tracedUnits = missionNamespace getVariable ["GRAD_TRACED_UNITS", []];

_tracedUnits pushbackUnique _unit;
missionNamespace setVariable ["GRAD_TRACED_UNITS", _tracedUnits];