;-------------------------------------------------------------------------------------
; dm me for help Shnappster#1718
; 
; Feel free to update the script however don't hand out the script under your name.
;-------------------------------------------------------------------------------------

Gui, 1:New,, Options
Gui, 1:Show, W500 H500
Gui, 1:Add, Text,, Welcome To Shnappsters Spam Script
Gui, 1:Add, Text,, Options:
Gui, 1:Add, CheckBox, vdiscord, Discord 
Gui, 1:Add, CheckBox, vgames, Game
Gui, 1:Add, Button, x15 y465 w80 gcancel, Cancel
Gui, 1:Add, Button, x400 y465 w80 gok, OK
return

ok:
	GuiControlGet, confirmcheckd,, discord
	GuiControlGet, confirmcheckg,, games
	if(confirmcheckd = 1){
		run discord.ahk
		ExitApp
	}
	if(confirmcheckg = 1){
		run games.ahk
		ExitApp
	}

cancel: 
	GuiClose:
	ExitApp
return

F2::
	ExitApp
Return