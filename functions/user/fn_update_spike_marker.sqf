params ["_unprecise_spike_pos"]; 

if (playerSide == east || playerSide == civilian) then {
	private _opfor_marker = "opfor_pos"; 
	private _spike_marker = "spike_pos"; 
	
	if (_opfor_marker in allMapMarkers) then {deleteMarkerLocal _opfor_marker}; 
	["TaskAssigned", ["Intel", "The Spike Team was spotted!"]] call BIS_fnc_showNotification;	 
	_spike_marker setMarkerPosLocal _unprecise_spike_pos;
	
};
