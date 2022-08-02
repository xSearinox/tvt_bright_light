// get random spawn position
private _pos = ["start_"] call spawner_fnc_get_random_spawn_point; 

// Port Spike team to position
{ 
 [_pos,_x,30] call spawner_fnc_random_spike_spawn; 
} foreach units independent;

[_pos,20,false] call custom_fnc_unhide_crashsite;

// Port Opfor Car on road near spike spawn
private _opfor_distance = ["OpforSpawnDist", nil] call BIS_fnc_getParamValue;
[_pos,opfor_mobile,_opfor_distance] call custom_fnc_put_on_road;

{
 	_x action ["Eject", vehicle _x];	
} forEach (crew opfor_mobile);


// Add Opfor hint position
opfor_pos_marker = ["opfor_pos","Eigene Position",getPos opfor_mobile,4,nil,"hd_objective"] call custom_fnc_create_map_marker;
[opfor_pos_marker,west,true] remoteExec ["custom_fnc_hide_map_marker"];
[opfor_pos_marker,independent,true] remoteExec ["custom_fnc_hide_map_marker"];



// add opfor hint 
private _precision_loss = ["OpforHintPrecision", nil] call BIS_fnc_getParamValue;
private _unprecise_spike_pos = [[[_pos,_precision_loss]]] call BIS_fnc_randomPos;
spike_pos_marker = ["spike_pos","Spike Team",_unprecise_spike_pos,4,nil,"selector_selectedMission"] call custom_fnc_create_map_marker;
[spike_pos_marker,west,true] remoteExec ["custom_fnc_hide_map_marker"];
[spike_pos_marker,independent,true] remoteExec ["custom_fnc_hide_map_marker"];