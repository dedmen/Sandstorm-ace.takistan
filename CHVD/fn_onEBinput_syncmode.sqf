params [
	["_textBoxCtrl", controlNull, [0, controlNull]],
	["_varString", "", [""]],// type of variable to use: foot/car/air
	["_sliderCtrl", controlNull, [0, controlNull]],
	["_sliderTextboxCtrl", controlNull, [0, controlNull]]
];

private _inputValue = [ctrlText _textBoxCtrl, "0123456789"] call BIS_fnc_filterString;
_inputValue = if (_inputValue == "") then {1} else {call compile _inputValue min 100 max 1};

ctrlSetText [_textBoxCtrl, (str _inputValue + "%")];

private _percentageVar = "CHVD_" + _varString + "SyncPercentage";
private _percentage = _inputValue / 100;

missionNamespace setVariable [_percentageVar, _percentage];
profileNamespace setVariable [str _percentageVar, _percentageVar];

_viewDistVar = "CHVD_" + _varString;
_viewDist = missionNamespace getVariable _viewDistVar;
_objVDVar = "CHVD_" + _varString + "Obj";
_objVD = _viewDist * _percentage min CHVD_maxObj;

sliderSetPosition [_sliderCtrl, _objVD];
ctrlSetText [_sliderTextboxCtrl, str round _objVD];
		

missionNamespace setVariable [_objVDVar, _objVD];
profileNamespace setVariable [str _objVDVar, _objVDVar];

[2] call CHVD_fnc_updateSettings;