private ["_textValue","_updateType"];

params [
	["_varType1", "", [""]],
	["_slider1", controlNull, [0, controlNull]],
	["_text1", controlNull, [0, controlNull]],
	["_varType2", "", [""]],
	["_slider2", controlNull, [0, controlNull]],
	["_text2", controlNull, [0, controlNull]],
	["_modeVar", "", [""]],
	["_percentVar", "", [""]]
];

private _updateType = 2;
if (count _this >= 7) then {
	_modeVar = missionNamespace getVariable _modeVar;
	switch (_modeVar) do {
		case 1: {
			_updateType = 3;
		};
		default {
			_updateType = 1;		
		};	
	};
};


private _textValue = [ctrlText _text1, "0123456789"] call BIS_fnc_filterString;
_textValue = if (_textValue == "") then {1} else {call compile _textValue min 12000 max 0};

private _viewDistValue = _textValue min CHVD_maxView;
private _objViewDistValue = if (_modeVar isEqualTo 1) then {_textValue  * (call compile _percentVar) min CHVD_maxObj} else {_textValue min CHVD_maxObj};  // Check if percentage sync mode is used, if so use a percentage coefficient

switch (_updateType) do {  // 1 - VIEW, 2 - OBJ, 3 - BOTH, 0 - BOTH AND TERRAIN
	case 1: {
		sliderSetPosition [_slider1, _viewDistValue];
		sliderSetRange [_slider2, 0, _viewDistValue];
			
			
		missionNamespace setVariable [_varType1, _viewDistValue];
		profileNamespace setVariable [str _varType1, _varType1];
		
		if ((missionNamespace getVariable _varType2) > _viewDistValue) then { // Update object VD slider and text so it doesn't stay at higher value than VD slider
			sliderSetPosition [_slider2, _objViewDistValue];
			ctrlSetText [_text2, str round _objViewDistValue];


			missionNamespace setVariable [_varType2, _objViewDistValue];
			profileNamespace setVariable [str _varType2, _varType2];
		};
		
		[_updateType] call CHVD_fnc_updateSettings;
	};
	case 2: {
		sliderSetPosition [_slider1, _objViewDistValue];

		missionNamespace setVariable [_varType1, _objViewDistValue];
		profileNamespace setVariable [str _varType1, _varType1];
			
		[_updateType] call CHVD_fnc_updateSettings;
	};
	case 3: {
		sliderSetPosition [_slider1, _viewDistValue];
		sliderSetRange [_slider2, 0, _viewDistValue];
			
		missionNamespace setVariable [_varType1, _viewDistValue];
		profileNamespace setVariable [str _varType1, _varType1];
		
		if ((call compile _varType2) > _viewDistValue) then {  // Update object VD slider and text so it doesn't stay at higher value than VD slider
			sliderSetPosition [_slider2, _objViewDistValue];
			ctrlSetText [_text2, str round _objViewDistValue];

			missionNamespace setVariable [_varType2, _objViewDistValue];
			profileNamespace setVariable [str _varType2, _varType2];
		};
		
		sliderSetPosition [_slider2, _objViewDistValue];
		ctrlSetText [_text2, str round _objViewDistValue];	
		
		missionNamespace setVariable [_varType2, _objViewDistValue];
		profileNamespace setVariable [str _varType2, _varType2];
		
		[_updateType] call CHVD_fnc_updateSettings;
	};	
};