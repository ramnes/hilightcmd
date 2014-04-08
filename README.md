hilightcmd
==========

Call a system command when hilighted.

Originally based on `hiligthwin.pl` by Timo Sirainen, and djcraven5's idea for
making remote computer beep through ssh.


Uses
----

Assuming you got a ssh and beep on your remote computer:
`/set hilightcmd_systemcmd ssh user@host beep &`

Or, with notify-send:
`/set hilightcmd_systemcmd notify-send 'hilighted @irc'


License
-------

GNU GPL v3
