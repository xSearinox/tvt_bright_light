params ["_object", "_cardinalDirection"];

private _string = "Cant read this shit.";
player action ["TakeFlag", objNull];

private _delta = CBA_missionTime - (_object getVariable ["GRAD_trace_timestamp", CBA_missionTime]);

if (_delta > 30*60) then {
    _string = format ["Really old. More than 30 mins. It leads %1.", _cardinalDirection];
} else {
  if (_delta <= 30*60 && _delta > 20*60) then {
      _string = format ["Between 20 and 30 mins old. It leads %1.", _cardinalDirection];
  } else {
    if (_delta <= 20*60 && _delta > 15*60) then {
        _string = format ["Between 15 and 20 mins old. It leads %1.", _cardinalDirection];
    } else {
      if (_delta <= 15*60 && _delta > 10*60) then {
          _string = format ["Between 10 and 15 mins old. It leads %1.", _cardinalDirection];
      } else {
        if (_delta <= 10*60 && _delta > 5*60) then {
            _string = format ["Between 5 and 10 mins old. It leads %1.", _cardinalDirection];
        } else {
          if (_delta <= 5*60 && _delta > 2*60) then {
              _string = format ["Between 2 and 5 mins old. It leads %1.", _cardinalDirection];
          } else {
              _string = format ["Really fresh, less than 2 mins. It leads %1.", _cardinalDirection];
          };
        };
      };
    };
  };
};

_string