#
# CC-BY-SA 3.0 or later
# http://creativecommons.org/licenses/by-sa/3.0/
#
# Call a custom system command when receiving a hilight.
# Originally based on hilighwin.pl work and djcraven5's idea for making remote
# computer beep through ssh.
#
# Example of use, assuming you got a ssh and beep on your remote:
# /set hilightcmd_systemcmd ssh user@host beep &
#
# http://github.com/ramnes/hilightcmd
# contact@ramnes.eu
#

use Irssi;
use POSIX;
use vars qw($VERSION %IRSSI); 

$VERSION = "0.1";
%IRSSI = (authors     => "Guillaume \'ramnes\' Gelin",
	  contact     => "contact\@ramnes.eu", 
	  name        => "hilightcmd",
	  description => "Call a custom system command when receiving a hilight.",
	  license     => "CC-BY-SA 3.0",
	  url         => "http://irssi.org/");

sub sig_printtext
{
    my ($dest, $text, $stripped) = @_;
    my $opt = MSGLEVEL_HILIGHT;
    
    if (Irssi::settings_get_bool('hilightcmd_privmsg'))
    {
        $opt = MSGLEVEL_HILIGHT|MSGLEVEL_MSGS;
    }
    if (($dest->{level} & ($opt))
	&& ($dest->{level} & MSGLEVEL_NOHILIGHT) == 0
	&& (Irssi::active_win()->{refnum} != $dest->{window}->{refnum}
	|| Irssi::settings_get_bool('hilightcmd_currentwin')))
    {
	system(Irssi::settings_get_str('hilightcmd_systemcmd'));
    }
}

Irssi::settings_add_bool('hilightcmd', 'hilightcmd_privmsg', 1);
Irssi::settings_add_bool('hilightcmd', 'hilightcmd_currentwin', 1);
Irssi::settings_add_str('hilightcmd', 'hilightcmd_systemcmd', '');
Irssi::signal_add('print text', 'sig_printtext');
