﻿;-------------------------------------------------------------------------------------
; dm me for help Shnappster#1718
; 
; Feel free to update the script however don't hand out the script under your name.
;-------------------------------------------------------------------------------------

Gui, 2:New
Gui, 2:Show, W500 H500
Gui, 2:Add, Text,, Discord Spam Setup
Gui, 2:Add, Text,, Username:
Gui, 2:Add, ComboBox, vDiscUserN
Gui, 2:Add, Text,, Message:
Gui, 2:Add, Edit, r9 vdiscmesg w400, write here
Gui, 2:Add, Text, Time(ms):
Gui, 2:Add, Edit
Gui, 2:Add, UpDown, vtime Range10-10000, 1400
Gui, 2:Add, Button, x400 y465 w80 gdsave, save
Gui, 2:Add, Button, X15 y465 w80 gback, Back
return

dsave: ; Discord Functionality
	Gui Cancel

	Loop{
		if breakvar = 1
		break
		Gui, Submit
		send, %DiscUserN%
		send, {enter}
		Gui, Submit
		send, %discmesg%
		send, {Enter}
		send, {Enter}
		Gui, Submit
		sleep %time%	

		if breakvar = 1
		break
	} 
	
	breakvar = 0
return

back:
	run MessageSpam.ahk
	ExitApp
return

F2::
	ExitApp
Return