if (CHVD_keyDown) exitWith {};
CHVD_keyDown = true;

params [["_updateType", 0, []]];// 0 - decrease VD, 1 - increase VD
private _updateValue = if (_updateType isEqualTo 0) then {-500} else {500};

if (!isNull (findDisplay 2900)) then {call CHVD_fnc_openDialog};

private _vehTypeString = ["foot", "car", "air"] param [CHVD_vehType, "foot"];

private _updateMode = missionNamespace getVariable ("CHVD_" + _vehTypeString + "SyncMode");
private _viewDistVar = "CHVD_" + _vehTypeString;
private _viewDist = missionNamespace getVariable _viewDistVar;
private _objViewDistVar = "CHVD_" + _vehTypeString + "Obj";
private _objViewDist = missionNamespace getVariable _objViewDistVar;
private _vdDiff = _viewDist - _objViewDist;

switch (_updateMode) do {
	case 1: {
		private _viewDistValue = _viewDist + _updateValue min CHVD_maxView max 500;		
		
		private _percentVar = "CHVD_" + _vehTypeString + "SyncPercentage";
		private _percentValue = missionNamespace getVariable _percentVar;
		
		private _objViewDistValue = _viewDistValue * _percentValue min CHVD_maxObj;
		
		if (_objViewDistValue >= 500) then {
			missionNamespace setVariable [_viewDistVar, _viewDistValue];
			profileNamespace setVariable [str _viewDistVar, _viewDistVar];

			missionNamespace setVariable [_objViewDistVar, _objViewDistValue];
			profileNamespace setVariable [str _objViewDistVar, _objViewDistVar];
			
			[3] call CHVD_fnc_updateSettings;
		};
	};
	case 2: {		
		private _objViewDistValue = _objViewDist + _updateValue min _viewDist min CHVD_maxObj max 500;
		missionNamespace setVariable [_objViewDistVar, _objViewDistValue];
		profileNamespace setVariable [str _objViewDistVar, _objViewDistVar];
		
		[4] call CHVD_fnc_updateSettings;
	};
	default {
		private _viewDistValue = _viewDist + _updateValue min CHVD_maxView max (500 + _vdDiff);
		private _objViewDistValue = _objViewDist + _updateValue min (_viewDistValue - _vdDiff) min CHVD_maxObj max 500;
		missionNamespace setVariable [_viewDistVar, _viewDistValue];
		profileNamespace setVariable [str _viewDistVar, _viewDistVar];
		
		missionNamespace setVariable [_objViewDistVar, _objViewDistValue];
		profileNamespace setVariable [str _objViewDistVar, _objViewDistVar];
				
		[3] call CHVD_fnc_updateSettings;	
	};
};

private _vdString = "";
for "_i" from 1 to (35) step 1 do {
	if ((call compile _viewDistVar) < CHVD_maxView / 35 * _i) then {
		_vdString = _vdString + "·";
	} else {	
		_vdString = _vdString + "I";
	};
};

private _ovdString = "";
for "_i" from 1 to (35) step 1 do {
	if ((call compile _objViewDistVar) < CHVD_maxObj / 35 * _i) then {
		_ovdString = _ovdString + "·";
	} else {	
		_ovdString = _ovdString + "I";
	};
};

private _textViewDistance = if (isLocalized "STR_chvd_viewDistance") then {localize "STR_chvd_viewDistance"} else {"View Distance"};
private _textObjViewDistance = if (isLocalized "STR_chvd_objViewDistance") then {localize "STR_chvd_objViewDistance"} else {"View Distance"};

hintSilent parseText format ["<t align='left' size='1.33'>
%2:	<t align='right'>%3</t>
<br /> 
<t size='2' shadow='0' color='%1'>%4</t>
<br /> 
%5: <t align='right'>%6</t>
<br /> 
<t size='2' shadow='0' color='%1'>%7</t>
</t>", 
[profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843], profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019], profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862], profilenamespace getvariable ['GUI_BCG_RGB_A',0.7]] call BIS_fnc_colorRGBAtoHTML,
_textViewDistance,
call compile _viewDistVar, 
_vdString, 
_textObjViewDistance,
call compile _objViewDistVar, 
_ovdString
];

terminate (missionNamespace getVariable ["CHVD_hintHandle", scriptNull]);
CHVD_hintHandle = [] spawn {
	uiSleep 2;
	hintSilent "";
};

[] spawn {
	uiSleep 0.05;
	CHVD_keyDown = false;
};