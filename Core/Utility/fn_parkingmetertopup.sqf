/*
*
*	Author: Konrad Dryja
*	-Executed when clicked on Insert Coin
*	
*	TO DOs: make the click actually check for player's money and deduct it from his pocket
*
*/
private["_display","_status","_meter","_previousTopUp","_secondsLeft"];
disableSerialization;
_display = findDisplay 1;
_status = _display displayCtrl 3;
_meter = _display displayCtrl 4;

_previousTopUp = parseNumber ({mySign getVariable ["topUpExpire",0];} remoteExec ["BIS_fnc_call", owner player]);

_secondsLeft = floor ( _previousTopUp - time);

if(_secondsLeft < 0) then {
	_secondsLeft = 0;
};
if(_previousTopUp == 0) then {
	_previousTopUp=time;
};

_meter ctrlSetText "Resources\valid.paa";
_status ctrlSetTextColor [0, 1, 0, 1];
playSound "coin1";
[[_previousTopUp], {mySign setVariable ["topUpExpire",_this select 0];}] remoteExec ["BIS_fnc_call", owner player];
_secondsLeft = _secondsLeft + 30;
_minutesLeft = floor (_secondsLeft / 60);
_secondsLeft = _secondsLeft - (60 * _minutesLeft);
_status ctrlSetText format ["%1 minutes\n%2 seconds", _minutesLeft, _secondsLeft];