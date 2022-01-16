;-------------------------------------------------------------------------------------
; dm me for help Shnappster#1718
; 
; Feel free to update the script however don't hand out the script under your name.
;-------------------------------------------------------------------------------------

IniRead, Omsg1, bin\save.ini, LastMessage, Start	; check .ini
	IniRead, Omsg2, bin\save.ini, LastMessage, Start2
		IniRead, Omsg3, bin\save.ini, LastMessage, Start3

Gui, Hide
Gui, 3:New,, Game Spam
Gui, 3:Show, W500 H600
Gui, 3:Add, Text,, Game Spam Setup
Gui, 3:Add, Text,, Choose Your Game:
Gui, 3:Add, ComboBox, vGames, CSGO|Warthunder|WoW|Arma3				; Game selection
Gui, 3:Add, CheckBox, checked x140 y55 vmsgrand, Random Messages
Gui, 3:Add, Edit, x10 r9 vmsggame w400, %Omsg1%						; 1 message box
Gui, 3:Add, Button, x265 y53 w80 ggapply, Apply
Gui, 3:Add, Button, x15 y565 w80 gback, Back
Gui, 3:Add, Button, x400 y565 w80 gGsave, save
Gui, 3:Add, Button, x15 y255 w80 gbackH hidden, Back
Gui, 3:Add, Button, x400 y255 w80 gGsaveH hidden, save
Gui, 3:Add, Text,x10 y210 vgmsgb2, Message Box 2:					; 2 message box
Gui, 3:Add, Edit, x10 y225 r9 vmsggame2 w400, %Omsg2%
Gui, 3:Add, Text,x10 y360 vgmsgb3, Message Box 3: 					; 3 message box
Gui, 3:Add, Edit, x10 y375 r9 vmsggame3 w400, %Omsg3%
return

gapply:
	GuiControlGet, checked,, msgrand
	if(checked = 1){
		GuiControl, 3:show, gmsgb2
		GuiControl, 3:show, msggame2
		GuiControl, 3:show, gmsgb3
		GuiControl, 3:show, msggame3
		Gui, 3:Show, W500 H600
		GuiControl, 3:show, back
		GuiControl, 3:show, Gsave
		GuiControl, Hide, backH
		GuiControl, Hide, GsaveH
	}
	else{
		GuiControl, 3:Hide, gmsgb2
		GuiControl, 3:Hide, msggame2
		GuiControl, 3:Hide, gmsgb3
		GuiControl, 3:Hide, msggame3
		Gui, 3:Show, W500 H280
		GuiControl, 3:hide, back
		GuiControl, 3:hide, Gsave
	}
return

Gsave: ; Function
	
; saving last info

	GuiControlGet, msg1,, msggame
		GuiControlGet, msg2,, msggame2
			GuiControlGet, msg3,, msggame3
			
	IniWrite, %msg1%, bin\save.ini, LastMessage, Start
		IniWrite, %msg2%, bin\save.ini, LastMessage, Start2
			IniWrite, %msg3%, bin\save.ini, LastMessage, Start3
	
; Grabbing GUI Var
	Gui, 3:hide
	GuiControlGet, gamestate,, vGames
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
			checksum = 0
			random, msgcall, 1, 3
			
			GuiControlGet, message1,, msggame
				GuiControlGet, message2,, msggame2
					GuiControlGet, message3,, msggame3
			
			IniWrite, %msgcall%, bin\save.ini, RNG, RandomNum
				IniRead, RNG, bin\save.ini, RNG, RandomNum
			
			if(RNG = 1){
				if(checksum = 1){
					msgcall = 2
				}
				;send, %key%
				Clipboard := message1
				Send ^V
				send, {enter}
				checksum = 1
			}
			if(RNG = 2){
				if(checksum = 2){
					msgcall = 3
					break
				}
				;send, %key%
				Clipboard := message2
				Send ^V
				send, {enter}
				checksum = 2
			}
			if(RNG = 3){
				if(checksum = 3){
					msgcall = 1
					break
				}
				;send, %key%
				Clipboard := message3
				Send ^V
				send, {enter}
				checksum = 3
			}
			sleep, 1400
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
	run bin\MessageSpam.ahk
	ExitApp
return

F2::
	ExitApp
return