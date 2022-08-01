 
private _opfor_marker = "opfor_pos"; 
private _spike_marker = "spike_pos"; 
 
if (_opfor_marker in allMapMarkers) then {deleteMarker _opfor_marker}; 
 
 
// update 
deleteMarker _spike_marker; 
 
private _precision_loss = ["OpforHintPrecision", nil] call BIS_fnc_getParamValue; 
private _unprecise_spike_pos = [[[getPos tracee,_precision_loss]]] call BIS_fnc_randomPos; 
spike_pos_marker = ["spike_pos","Spike Team",_unprecise_spike_pos,4,nil,"selector_selectedMission"] call custom_fnc_create_map_marker; 
//[spike_pos_marker,west,true] remoteExec ["custom_fnc_hide_map_marker"]; 
[spike_pos_marker,independent,true] remoteExec ["custom_fnc_hide_map_marker"];