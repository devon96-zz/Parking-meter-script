/*
*
*	Author: Konrad Dryja
*	-Displays the parking meter dialog with the information about remaining time
*		
*
*/
private["_sign","_display","_status","_meter","_previousTopUp","_secondsLeft","_topup","_minutesLeft"];
params[["_sign",objNull,[objNull]]];
disableSerialization;
createDialog "ParkingMeter";
_display = findDisplay 1;
_topup = _display displayCtrl 2;
_status = _display displayCtrl 3;
_meter = _display displayCtrl 4;
_status ctrlEnable true;
_topup ctrlEnable true;
_meter ctrlEnable true;

mySign = _sign;

_numer = 2;
[[_numer],{numerr = 2 + (_this select 0); 2 publicVariableClient 'numerr';}] remoteExecCall ["BIS_fnc_call", 0];
hint str numerr;

//{mySign setVariable ["topUpExpire",7];} remoteExec ["BIS_fnc_call", 0];

//_response ={hint str (mySign getVariable ["topUpExpire",4]);} remoteExec ["BIS_fnc_call", 0];
{numerr = 2 + numer; 2 publicVariableClient 'numerr';} remoteExec ["BIS_fnc_call", 0];
//hint str _response;
// _number = [[-33], {abs (_this select 0);}] call BIS_fnc_call;
// hint str _number; 
hint str numerr;

_previousTopUp = parseNumber ({mySign getVariable ["topUpExpire",0];} remoteExec ["BIS_fnc_call", owner player]);

_secondsLeft = floor (_previousTopUp - time);

if (_secondsLeft < 0) then{
	_meter ctrlSetText "Resources\expired.paa";
	_status ctrlSetText "EXPIRED";
	_status ctrlSetTextColor [1, 0, 0, 1];	
}
else{
	_status ctrlSetTextColor [0, 1, 0, 1];
	_meter ctrlSetText "Resources\valid.paa";
	_minutesLeft = floor (_secondsLeft / 60);
	_secondsLeft = _secondsLeft - (60 * _minutesLeft);
	_status ctrlSetText format ["%1 minutes\n%2 seconds", _minutesLeft, _secondsLeft];
};