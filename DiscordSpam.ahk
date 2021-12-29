;-------------------------------------------------------------------------------------
; dm me for help Shnappster#1718
; 
; Feel free to update the script however don't hand out the script under your name.
;-------------------------------------------------------------------------------------

Gui, New
Gui, Show, W500 H500
Gui, Add, Text,, Welcome To Shnappsters Spam Script
Gui, Add, Text,, Options:
Gui, Add, CheckBox, gdiscord, Discord 
Gui, Add, Button, x15 y465 w80 gcancel, Cancel
return

discord:
Gui Cancel
Gui, New
Gui, Show, W500 H500
Gui, Add, Text,, Discord Spam Setup
Gui, Add, Text,, Username:
Gui, Add, ComboBox, vDiscUserN
Gui, Add, Text,, Message:
Gui, Add, Edit, r9 vdiscmesg w400, write here
Gui, Add, Text, Time(ms):
Gui, Add, Edit
Gui, Add, UpDown, vtime Range10-10000, 1400
Gui, Add, Button, x400 y465 w80 gdsave, save
Gui, Add, Button, x15 y465 w80 gcancel, Cancel
return

cancel: 
	GuiClose:
	ExitApp
return

dsave:
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



F2::
ExitApp
Return
