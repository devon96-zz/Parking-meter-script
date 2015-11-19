/*
*
*	Author: Konrad Dryja
*	Gui config
*	
*
*/
#define true 1
#define false 0
class ParkingMeter {
	idd = 1; 
	controlsBackground[] = { }; 
	objects[] = { };      
	enableSimulation = true;
	controls[] = {  Meter, TopUp, Status };

	class TopUp {
		idc = 2;
		type = CT_STATIC;
		style = 528;    
		text = "Insert\nCoin";				//Insert coin button
		sizeEx = 0.035;
		font = TahomaB;
		colorBackground[] = {0,0.576,0,0};
		colorText[] = { 0, 0, 0, 1 };
		x = 0.38;
		y = 0.6;
		w = 0.2;
		h = 0.1;
		onMouseButtonClick = "_this call Core_fnc_parkingmetertopup";
		lineSpacing = 1;
	};
	class Status {
		idc = 3;
		type = CT_STATIC;
		style = 528;    
		text = "";
		sizeEx = 0.05;
		font = TahomaB;						//Remaining time indicator
		colorBackground[] = {0,0.576,0,0};
		colorText[] = { 0, 0, 0, 1 };
		x = 0.42;
		y = 0.22;
		w = 0.5;
		h = 0.4;
		lineSpacing = 1;
	};
	class Meter {
		idc = 4;
		type = CT_STATIC;
		style = 2096;    
		text = "Resources\expired.paa";			//Parking meter image itself
		sizeEx = 0.05;
		font = TahomaB;
		colorBackground[] = {1,1,1,1};
		colorText[] = {1,1,1,1};
		x = 0;
		y = 0;
		w = 1;
		h = 1;
	};
};