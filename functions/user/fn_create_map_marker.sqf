params ["_name","_text","_pos","_channel","_creator","_type"];
_marker = createMarkerLocal [_name,_pos,_channel,_creator];
_marker setMarkerTypeLocal _type;
_marker setMarkerTextLocal _text;
