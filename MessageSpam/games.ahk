;-------------------------------------------------------------------------------------
; dm me for help Shnappster#1718
; 
; Feel free to update the script however don't hand out the script under your name.
;-------------------------------------------------------------------------------------

Gui, Hide
Gui, 3:New,, Game Spam
Gui, 3:Show, W500 H600
Gui, 3:Add, Text,, Game Spam Setup
Gui, 3:Add, Text,, Choose Your Game:
Gui, 3:Add, ComboBox, vGames, CSGO|Warthunder|WoW|Arma3				; Game selection
Gui, 3:Add, CheckBox, checked x140 y55 vmsgrand, Random Messages
Gui, 3:Add, Edit, x10 r9 vmsggame w400, Message Here!				; 1 message box
Gui, 3:Add, Button, x265 y53 w80 ggapply, Apply
Gui, 3:Add, Button, x15 y565 w80 gback, Back
Gui, 3:Add, Button, x400 y565 w80 gGsave, save
Gui, 3:Add, Text,x10 y210 vgmsgb2, Message Box 2:					; 2 message box
Gui, 3:Add, Edit, x10 y225 r9 vmsggame2 w400, 2 Message Here!
Gui, 3:Add, Text,x10 y360 vgmsgb3, Message Box 3: 					; 3 message box
Gui, 3:Add, Edit, x10 y375 r9 vmsggame3 w400, 3 Message Here!
return

; setup multiple loops and the rng will call upon each one when needed

gapply:
	GuiControlGet, checked,, msgrand
	if(checked = 1){
		GuiControl, 3:show, gmsgb2
		GuiControl, 3:show, msggame2
		GuiControl, 3:show, gmsgb3
		GuiControl, 3:show, msggame3
	}
	if(checked = 0){
		GuiControl, 3:Hide, gmsgb2
		GuiControl, 3:Hide, msggame2
		GuiControl, 3:Hide, gmsgb3
		GuiControl, 3:Hide, msggame3
	}
return

Gsave: ; Game Functionality
	Gui, Cancel
	GuiControlGet, gamestate,, Games
	GuiControlGet, checked,, msgrand
	
; check game selected for key
	
	if(gamestate = Warthunder){
		key = {enter}
	}
	if(gamestate = CSGO){
		key = y
	}
	if(gamestate = WoW){
		key = {enter}
	}
	if(gamestate = Arma3){
		key = {,}
	}
	
; Function start
	
	if(checked = 1){
		loop{
			random, msgcall, 1, 3
			if(msgcall = 1){
				send, %key%
				send, %msggame%
				send, {enter}
			}
			if(msgcall = 2){
				send, %key%
				send, %msggame2%
				send, {enter}
			}
			if(msgcall = 3){
				send, %key%
				send, %msggame3%
				send, {enter}
			}	
		}
	}
	if(checked = 0){
		loop{
		
			send, %key%
			send, %msggame%
			send, {enter}
			
		}
	}
return

back:
	run MessageSpam.ahk
	ExitApp
return

F2::
	ExitApp
return