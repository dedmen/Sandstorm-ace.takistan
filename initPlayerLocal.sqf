//Support Requester By RCANTEC(RyanD) 2018
_this select 0 synchronizeObjectsAdd [SupportRequester];
SupportRequester synchronizeObjectsAdd [_this select 0];
BIS_supp_refresh = TRUE;
publicVariable "BIS_supp_refresh";
if (typeOf (_this select 0) isEqualTo "B_T_Sniper_F") then {
[_this select 0, SupportRequester, ArtilleryProvider] call BIS_fnc_addSupportLink;
[_this select 0, SupportRequester, CasProvider] call BIS_fnc_addSupportLink;
[_this select 0, SupportRequester, TransportProvider] call BIS_fnc_addSupportLink;
[_this select 0, SupportRequester, AmmoProvider] call BIS_fnc_addSupportLink;
[_this select 0, SupportRequester, HelicasProvider] call BIS_fnc_addSupportLink;
};
if (typeOf (_this select 0) isEqualTo "B_T_Recon_TL_F") then {
[_this select 0, SupportRequester, ArtilleryProvider] call BIS_fnc_addSupportLink;
[_this select 0, SupportRequester, CasProvider] call BIS_fnc_addSupportLink;
[_this select 0, SupportRequester, TransportProvider] call BIS_fnc_addSupportLink;
[_this select 0, SupportRequester, AmmoProvider] call BIS_fnc_addSupportLink;
[_this select 0, SupportRequester, HelicasProvider] call BIS_fnc_addSupportLink;
};
if (typeOf (_this select 0) isEqualTo "B_T_Soldier_TL_F") then {
[_this select 0, SupportRequester, ArtilleryProvider] call BIS_fnc_addSupportLink;
[_this select 0, SupportRequester, CasProvider] call BIS_fnc_addSupportLink;
[_this select 0, SupportRequester, TransportProvider] call BIS_fnc_addSupportLink;
[_this select 0, SupportRequester, AmmoProvider] call BIS_fnc_addSupportLink;
[_this select 0, SupportRequester, HelicasProvider] call BIS_fnc_addSupportLink;
};
if (typeOf (_this select 0) isEqualTo "B_T_Soldier_SL_F") then {
[_this select 0, SupportRequester, ArtilleryProvider] call BIS_fnc_addSupportLink;
[_this select 0, SupportRequester, CasProvider] call BIS_fnc_addSupportLink;
[_this select 0, SupportRequester, TransportProvider] call BIS_fnc_addSupportLink;
[_this select 0, SupportRequester, AmmoProvider] call BIS_fnc_addSupportLink;
[_this select 0, SupportRequester, HelicasProvider] call BIS_fnc_addSupportLink;
};
if (typeOf (_this select 0) isEqualTo "B_T_Medic_F") then {
[_this select 0, SupportRequester, TransportProvider] call BIS_fnc_addSupportLink;
[_this select 0, SupportRequester, AmmoProvider] call BIS_fnc_addSupportLink;
};
//[str("Malden Insurgency") , str(date select 1) + "." + str(date select 2) + "." + str(date select 0), str("By Doctor Vanilla")] spawn BIS_fnc_infoText;
["<t color='#2be22e' size = '.8'>Sandstorm<br />By Doctor Vanilla</t>",-1,-1,4,1,0,789] spawn BIS_fnc_dynamicText;