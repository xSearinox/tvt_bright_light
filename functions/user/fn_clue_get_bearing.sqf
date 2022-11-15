/*
	by nomisum
	takes exact number bearing and converts into rougher cardinal bearings
*/

params ["_object"];


private _dir = _object getVariable ["GRAD_trace_direction", 361];
private _return = "i dont know";

if (_dir >= 337.5 && _dir < 22.5) then {
	_return = "North";
} else {
	if (_dir >= 22.5 && _dir < 67.5) then {
		_return = "North-East";
	} else {
		if (_dir >= 67.5 && _dir < 112.5) then {
			_return = "East";
		} else {
			if (_dir >= 112.5 && _dir < 157.5) then {
				_return = "South-East";
			} else {
				if (_dir >= 157.5 && _dir < 202.5) then {
					_return = "South";
				} else {
					if (_dir >= 202.5 && _dir < 247.5) then {
						_return = "South-West";
					} else {
						if (_dir >= 247.5 && _dir < 292.5) then {
							_return = "West";
						} else {
							if (_dir >= 292.5 && _dir < 337.5) then {
								_return = "North-West";
							};
						};
					};
				};
			};
		};
	};
};

_return