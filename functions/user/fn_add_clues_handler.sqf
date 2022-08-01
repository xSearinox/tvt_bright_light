params ["_unit"];

_unit addEventHandler ["GetInMan", { 
 params ["_unit", "_role", "_vehicle", "_turret"]; 
    { 
  [_x,true] remoteExec ["hideObject",_unit]; 
   
 } forEach (allMissionObjects "Sign_Sphere10cm_F"); 
}];

_unit addEventHandler ["GetOutMan", { 
 params ["_unit", "_role", "_vehicle", "_turret"]; 
    { 
  [_x,false] remoteExec ["hideObject",_unit]; 
   
 } forEach (allMissionObjects "Sign_Sphere10cm_F"); 
}];