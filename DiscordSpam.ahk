﻿F1::
Msgbox, input spam message
InputBox, message
Msgbox, Will spam %message%
Msgbox, Input time it will spam it at (ms)
InputBox, time
Msgbox, Will send message at %time%ms press f2 to stop the script

Loop{
	if breakvar = 1
	break

	send, %message%
	send, {Enter}
	send, {Enter}
	sleep %time%	

	if breakvar = 1
	break
} 
breakvar = 0
return

F2::
breakvar = 1
return

F11::
Suspend
return