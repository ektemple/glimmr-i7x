Version 1/100701 of Glimmr Debugging Console (for Glulx only) by Erik Temple begins here.

[Allow the g-console output to be rerouted, including to the main window. Need to add two globals--one for the main window, one for the debugging output.]

Use authorial modesty.


Section - Window definition

The console-window is a text-buffer g-window spawned by the main-window.
 

Section - Window positioning

The position of the console-window is g-placebelow.


[Section - Window background color

[It is not necessary to set a background color, but doing so helps ensure that we can easily distinguish the console window at a glance. To change the background color, just write

	The back-colour of the console-window is g-White.]

The back-colour of the console-window is usually g-Lavender.]


Section - Open console

To initiate the/-- Glimmr console:
	open up the console-window.

After constructing the console-window:
	If the current action is opening the g-console:
		continue the action;[We don't want to follow this rule if we've already opened the console using an action.]
	if console-window is g-present:
		say "[>console][bracket]Glimmr Console[close bracket]: Console initiated by source code directive.[unless the Glimmr debugging option is active][bracket]Glimmr Console[close bracket]: Automated logging is disabled. To enable, activate the Glimmr debugging use option.[end if][<]";
	otherwise:
		say "*** An unknown error prevented the Glimmr console window from opening.";
	continue the action.

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
		say "[>console][bracket]Glimmr Console[close bracket]: Console initiated by command-line input.[unless the Glimmr debugging option is active][bracket]Glimmr Console[close bracket]: Automated logging is disabled. To enable, activate the Glimmr debugging use option.[end if][<]";
		say "";[This seemingly useless line lets Inform get its paragraphing back on track.]
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

The console output window is usually the console-window.


Section - Make it possible to refer to graphic elements in commands (for use with Glimmr Canvas-Based Drawing by Erik Temple)

A g-element is publically-named.


Section - Drawing rule

[This is not strictly necessary, but does make clear that the console is written to outside of Flexible Windows' window-drawing rulebook.]

Window-drawing rule for the console-window:
	do nothing.


Glimmr Debugging Console ends here.


---- DOCUMENTATION ----


