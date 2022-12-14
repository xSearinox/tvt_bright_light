/*
*   Legt Respawn-Einstellungen für die Mission fest.
*   Damit Spieler sterben können, muss die "Max. Revive Time" im "ACE Revive Settings" Modul reduziert werden.
*   Wenn Waverespawn ausgeschaltet ist, wird normaler Respawn verwendet.
*   Alle Zeitangaben in Sekunden.
*/


//WAVE RESPAWN =================================================================
waveRespawnEnabled = 0;                                                         //Wave Respawn ein-/ausschalten (1/0)

bluforWaveSize = -1;                                                            //Wellengröße Blufor
opforWaveSize = -1;                                                             //Wellengröße Opfor
indepWaveSize = -1;                                                             //Wellengröße Independent

waverespawntimePlayer = 30;                                                     //Spielerrespawnzeit, bevor er der Welle hinzugefügt wird
waverespawntimeBlu = 30;                                                        //Wellenrespawnzeit Blufor in Sekunden
waverespawntimeOpf = 30;                                                        //Wellenrespawnzeit Opfor in Sekunden
waverespawntimeInd = 30;                                                        //Wellenrespawnzeit Independent in Sekunden


//NORMALER RESPAWN =============================================================
respawntimeBlu = 999999999;                                                            //Respawnzeit Blufor in Sekunden
respawntimeOpf = 999999999;                                                            //Respawnzeit Opfor in Sekunden
respawntimeInd = 999999999;                                                            //Respawnzeit Independent in Sekunden
