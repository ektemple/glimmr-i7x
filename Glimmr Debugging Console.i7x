Version 1/091028 of Glimmr Debugging Console (for Glulx only) by Erik Temple begins here.

[Allow the g-console output to be rerouted, including to the main window.]

Use authorial modesty.

Use Glimmr console translates as (- Constant Glimmr_CONSOLE; -).

Section - Window definition

The console-window is a text-buffer g-window spawned by the main-window.
The console-window object translates into I6 as "console_window".
 

Section - Window positioning

The position of the console-window is g-placebelow.


[Section - Window background color

[It is not necessary to set a background color, but doing so helps ensure that we can easily distinguish the console window at a glance. To change the background color, replace this section or use a When Play Begins rule.]

The back-colour of the console-window is g-lavender.]


Section - Open console

To initiate Glimmr/Glimmr console:
	unless console-window is g-present:
		open up the console-window;
		if console-window is g-present:
			move focus to console-window;
			say "[bracket]Glimmr Console[close bracket]: Console initiated by source code directive.[unless using the Glimmr console option][bracket]Glimmr Console[close bracket]: Automated logging is disabled. To enable, activate the Glimmr console use option.[end if]";	
			return to main screen;
		otherwise:
			say "*** An unknown error prevented the Glimmr console window from opening.";

To cease logging to Glina/Glimmr console:
	unless console-window is g-unpresent:
		shut down the console-window;
		unless console-window is g-unpresent:
			say "*** An unknown error prevented the Glimmr console window from closing.";


Section - Command to open the console

Opening the g-console is an action applying to nothing. Understand "open g-console" as opening the g-console.

Check opening the g-console:
	if console-window is g-present:
		say "The Glimmr console window is already open.";
		rule fails.

Carry out opening the g-console:
	say "Opening the Glimmr console window...";
	open up the console-window;
	if console-window is g-present:
		move focus to console-window;
		say "[bracket]Glimmr Console[close bracket]: Console initiated by command-line input.[unless using the Glimmr console option][bracket]Glimmr Console[close bracket]: Automated logging is disabled. To enable, activate the Glimmr console use option.[end if]";	
		return to main screen;
	otherwise:
		say "*** An unknown error prevented the Glimmr console window from opening.";


Section - Command to close the console

Closing the g-console is an action applying to nothing. Understand "close g-console" as closing the g-console.

Check closing the g-console:
	if console-window is g-unpresent:
		say "The Glimmr console is already closed.";
		rule fails.

Carry out closing the g-console:
	shut down the console-window;
	if console-window is g-unpresent:
		say "Glimmr console window closed.";
	otherwise:
		say "*** An unknown error prevented the Glimmr console window from closing.";


Section - Commands for logging messages

[We preface console log messages with ">console" (the > is used to be sure that "console" doesn't conflict with any object named console. The say statement should end with [/], which transfers the focus back to the main window from the console.]

To say >console:
	(- #ifdef Glimmr_CONSOLE; if ( console_window has g_present) { glk_set_window( console_window.ref_number); -)
 
To say /:
	(-  glk_set_window( gg_mainwin ); } #endif; RunParagraphOn(); -)


Section - Abbreviations
[These are HTML-inspired macros for some fairly keystroke-intensive I7 text substitutions.]

To say b:
	say "[bold type]";

To say /b:
	say "[roman type]";

To say i:
	say "[italic type]";

To say /i:
	say "[roman type]";


Section - Drawing rule

[This is not necessary, but does make clear that the console is written to outside of Flexible Windows' window-drawing rulebook.]

Window-drawing rule for the console-window:
	do nothing.

[The drawing rule of the console-window is the console-window drawing rule.

This is the console-window drawing rule:
	do nothing.]

Glimmr Debugging Console ends here.
