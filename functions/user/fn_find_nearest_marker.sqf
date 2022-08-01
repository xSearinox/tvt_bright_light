params ["_center_pos","_target_marker_prefix"];

[allMapMarkers select {_target_marker_prefix in _x},_center_pos] call BIS_fnc_nearestPosition;
