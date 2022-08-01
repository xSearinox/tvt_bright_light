 params ["_msg"]; 

 hintC _msg;
 hintC_EH = findDisplay 57 displayAddEventHandler ["Unload", {
	_this spawn {
		_this select 0 displayRemoveEventHandler ["Unload", hintC_EH];
		hintSilent "";
	};
}];
