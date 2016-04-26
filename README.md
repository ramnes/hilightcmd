hilightcmd
==========

Call a custom system command when receiving a hilight.

Originally based on `hiligthwin.pl` by Timo Sirainen, and djcraven5's idea for
making remote computer beep through ssh.


Usage
-----

Example of use, assuming you have ssh and beep on your remote:
```
/set hilightcmd_systemcmd ssh user@host beep &
```

The hilighted text may be passed as a quoted string:
```
/set hilightcmd_systemcmd printf "%s\n" %(message)s >> ~/hilights
```


License
-------

GNU GPLv3
