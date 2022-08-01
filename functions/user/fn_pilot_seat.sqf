 params ["_vehicle", "_role", "_unit", "_turret"]; 

if (_role == "driver") then {
	if (!(_unit getVariable ["isPilot",false])) then {
		_unit action ["Eject", _vehicle];
		["Nur Piloten können hier sitzen!"] remoteExec ["custom_fnc_show_hint", _unit];
	}
};