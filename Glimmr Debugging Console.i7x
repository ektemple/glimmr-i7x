Version 1/091028 of Glimmr Debugging Console (for Glulx only) by Erik Temple begins here.

[Allow the g-console output to be rerouted, including to the main window. Need to add two globals--one for the main window, one for the debugging output.]

Use authorial modesty.


Section - Window definition

The console-window is a text-buffer g-window spawned by the main-window.
The console-window object translates into I6 as "console_window".
 

Section - Window positioning

The position of the console-window is g-placebelow.


[Section - Window background color

[It is not necessary to set a background color, but doing so helps ensure that we can easily distinguish the console window at a glance. To change the background color, replace this section or use a When Play Begins rule.]

The back-colour of the console-window is g-lavender.]


Section - Open console

To initiate Glimmr console:
	unless console-window is g-present:
		open up the console-window;
		if console-window is g-present:
			move focus to console-window;
			say "[bracket]Glimmr Console[close bracket]: Console initiated by source code directive.[unless the Glimmr debugging option is active][bracket]Glimmr Console[close bracket]: Automated logging is disabled. To enable, activate the Glimmr debugging use option.[end if]";	
			return to main screen;
		otherwise:
			say "*** An unknown error prevented the Glimmr console window from opening.";

To cease logging to Glimmr console:
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
		say "[bracket]Glimmr Console[close bracket]: Console initiated by command-line input.[unless the Glimmr debugging option is active][bracket]Glimmr Console[close bracket]: Automated logging is disabled. To enable, activate the Glimmr debugging use option.[end if]";	
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

[We preface console log messages with ">console" (the > is used to be sure that "console" doesn't conflict with any object named console. The [>console] *must* be balanced with [<] at the end, which transfers the focus back to the main window from the console.]

To say >console:
	(- if ( console_window has g_present) { glk_set_window( console_window.ref_number); -)
 
To say <:
	(-  glk_set_window( gg_mainwin ); } RunParagraphOn(); -)

To only if utilizing Glimmr debugging:
	(- #ifdef Glimmr_DEBUG; -)
	
To end only if:
	(- #endif; -)


Section - Make it possible to refer to graphic elements in commands (for use with Glimmr Canvas-Based Drawing by Erik Temple)

A g-element is publically-named.


Section - Drawing rule

[This is not strictly necessary, but does make clear that the console is written to outside of Flexible Windows' window-drawing rulebook.]

Window-drawing rule for the console-window:
	do nothing.

[The drawing rule of the console-window is the console-window drawing rule.

This is the console-window drawing rule:
	do nothing.]

Glimmr Debugging Console ends here.
