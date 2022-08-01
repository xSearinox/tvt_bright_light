GRAD_introCam_playOnStart = false;							//Ob das das intro bei Spielstart automatisch abgespielt werden soll
GRAD_introCam_allowForJIP = false;							//Ob JIP Spieler das Intro sehen sollen

/*
	SHOT TYPES:
	["CAMERA", duration, pos, target, fov (optional), showBorders (optional), fade (optional), fadeTime (optional), fadeText (optional), effectCam (optional), effectCamType (optional)],
	["MOVE", duration, pos, target, fov (optional), offset (optional), commitTime (optional)],
	["ATTACH", duration, object, target, fov (optional), offset (optional)],
	["ROTATE", duration, target, height (optional), radius (optional), startingAngle (optional), endAngle (optional), clockwise (optional), rise (optional)]
    ["BLEND",  duration, textType (optional), blendOut (optional), blendIn (optional), extension]

* CAM PARAMETERS:
* Duration <NUMBER>
* Positions <OBJECT / POSITION>
* Target <OBJECT / POSITION>
* Zoom Factor <NUMBER> (default: 1)
* Show Borders <BOOLEAN> (default: true)
* Fade <NOOLEAN> (default: true)
* Fade Time <NUMBER> (default: 1)
* Fade Text <STRING> (default: "")
* Camera Effect <STRING> (default: "internal")
* Camera Effect Type <STRING> (default: "BACK")
* 166 
*/

GRAD_introCam_shotDefinitions = [
	["CAMERA",3,[15271.5,2437.29,40.948],[15398.452,2365.654,44.129],0.75,true,true,2],
	["MOVE", 55.78,  [13658,3281.92,7.922]],
	["MOVE", 25.79,  [13126.7,3565.39,8.274]], 
	["MOVE", 45.58,  [11600.5,4395.240,9.003]],
	["MOVE", 30.85,  [11257.991,4574.095,247.907]],
	["BLEND", 5, [], 0, 3, 4]
];