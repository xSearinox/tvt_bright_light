params ["_name","_text","_pos","_channel","_creator","_type"];
_marker = createMarker [_name,_pos,_channel,_creator];
_marker setMarkerType _type;
_marker setMarkerText _text;
_marker;