/*
*   Hier können eigene Missionsparameter eingebunden werden.
*   Ist in missionConfig >> Params included.
*/
class skipIntro
	{
		title = "Skip Intro";
		texts[] = {"yes","no"};
		values[] = {1,0};
		default = 1;
	};
class TimeOnStation
	{
		title = "Time on station for Helis";
		texts[] = {"30 sek","60 sek","30 Min","40 Min","1 Std","1.5 Std","2 Std"};
		values[] = {30,60,1800,2400,3600,5400,7200};
		default = 2400;
	};
class OpforSpawnDist
	{
		title = "Min distance between opfor and spike team";
		texts[] = {"200 m","400 m","600 m","800 m","1000 m","1200 m","1400 m","1600 m","1800 m","2000 m","2200 m"};
		values[] = {200,400,600,800,1000,1200,1400,1600,1800,2000,2200};
		default = 2000;
	};	
class OpforHintPrecision
	{
		title = "Precision Loss of Opfor Hints";
		texts[] = {"0 m","100 m","200 m","300 m","400 m","500 m","600 m","700 m"};
		values[] = {0,100,200,300,400,500,600,700};
		default = 300;
	};	
class FireInit
	{
		title = "Time to build a fire or upgrade it";
		texts[] = {"15 sek","30 sek","1 Min","1.5 Min","2 Min"};
		values[] = {15,30,60,90,120};
		default = 30;
	};	
class FireExtent
	{
		title = "Time to add leaves";
		texts[] = {"15 sek","30 sek","1 Min","1.5 Min","2 Min"};
		values[] = {15,30,60,90,120};
		default = 15;
	};	
// class BurnTime
// 	{
// 		title = "Burn time of a small fire";
// 		texts[] = {"5 sek","10 sek","15 sek","30 sek","1 Min","1.5 Min","2 Min"};
// 		values[] = {5,10,15,30,60,90,120};
// 		default = 120;
// 	};		