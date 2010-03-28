Glimmr Graphic Hyperlinks by Erik Temple begins here.

"An adaptation of Jeff Sheets' Graphic Links extension to the Flexible Windows framework. Adds the ability to define hyperlinked areas in multiple windows, as well as the ability to conceal commands triggered by mouse input from the player (intended for use in graphical user interfaces)."

"based on Graphic Links by Jeff Sheets"


[Look at getting rid of the requirement that each entry have only one link in the table; this would also mean getting rid of the "ignoring duplicates" option for adding a link to the table, so that the ignoring duplicates option is the only option.]
[Get rid of the silent commands option?]
[Use Dynamic Tables, at least optionally.]
[Fix debugging commands--are they correct?]
[It would be good if the coordinate reporting command reported the canvas coordinates. That section is commented out.]
[Documentation and revision of extensions: Has now been expanded from g-elements to objects--be sure to fill things in.]
[Documentation: Phrase for turning off hyperlinks manually; not likely to be needed.]
[Documentation: Remember that, for g-elements, we can now use the graphlink processing rules and get around silent or pasted commands if desired.]
[Documentation: New kind: hyperlinked graphics window, which would automatically trigger the g-graphlinked property.]
[Documentation: Silent replacement commands are deprecated; use stored actions or references instead.]

Include version 9 of Flexible Windows v9 by Jon Ingold.

Part 1 - Glulx Gestalts

To decide whether glulx graphic-window hyperlinks are supported:
	(- ( glk_gestalt(gestalt_MouseInput, winType_Graphics) ) -)


Part 2 - Basic Input
	
A g-window can be g-graphlinked or g-ungraphlinked. A g-window is usually g-ungraphlinked.

A graphlink g-window is a kind of graphics g-window. A graphlink g-window is g-graphlinked.

After constructing a g-window (called the window-in-question):
	if the window-in-question is g-graphlinked and the type of the window-in-question is g-graphics:
		start looking for graphlinks in the window-in-question.

To start looking for graphlinks in (g - a g-window):
	(- SetGraphLink({g}); -)

To stop looking for graphlinks in (g - a g-window):
	(- IgnoreLinks({g}); -)

To cancel input in main window:
	(- CancelMainEvents(); -)

To decide which number is the clicked window reference:
	(- (gg_event-->1) -)
	
The first glulx mouse input rule (this is the identify window rule):
	change glulx replacement command to "";
	Repeat with item running through g-graphlinked g-windows:
		if the ref-number of item is the clicked window reference:
			change the current graphlink window to item.
			
A glulx mouse input rule (this is the default graphlink setting rule):
	perform glulx graphlink request in current graphlink window.
	
To perform glulx graphlink request in (g - a graphics g-window):
	(-  if (glk_gestalt(gestalt_MouseInput, winType_Graphics)) DoGraphLink({g}); -)
	
Include (-

[ DoGraphLink g;
	SetGraphLink(g); 
	PlayGraphlink(gg_event-->2, gg_event-->3);
 ]; 

[ PlayGraphlink x y;
	(+ current graphlink x +) = x;
	(+ current graphlink y +) = y;
	FollowRulebook( (+ clicking graphlink rules +) );
];

[CancelMainEvents ;
	glk_cancel_line_event(gg_mainwin, GLK_NULL);
	glk_cancel_char_event(gg_mainwin);
];

[ SetGraphLink g;
	if (g.ref_number) {
	            if (glk_gestalt(gestalt_MouseInput, winType_Graphics)) glk_request_mouse_event(g.ref_number);
	}
];

[ IgnoreLinks g;
	if (g.ref_number) {
	            if (glk_gestalt(gestalt_MouseInput, winType_Graphics)) glk_cancel_mouse_event(g.ref_number);
	}
];

-)

Part 3a - Clicking Graphlink Rules (for use without Glimmr Canvas-Based Drawing by Erik Temple)

Current graphlink is text that varies. [The current graphlink is either text or g-element, depending on whether Glimmr Canvas-Based Drawing is also in use]
Current graphlink x is a number that varies.
Current graphlink y is a number that varies.
Current graphlink window is a g-window that varies.

The clicking graphlink rules are a rulebook.

A clicking graphlink rule (this is the default command replacement by graphlinks rule):
	repeat through the Table of Graphlink Glulx Replacement Commands in reverse order:
		if the current graphlink window is g-win entry:
			if the current graphlink x >= p-left entry and the current graphlink x <= p-right entry and the current graphlink y >= p-top entry and the current graphlink y <= p-bottom entry:
				cancel input in main window;
				change the current graphlink to linkid entry;
				change the glulx replacement command to replacement entry;
				rule succeeds;
	now glulx replacement command is "".

The default command replacement by graphlinks rule is listed last in the clicking graphlink rules.


Part 3b - Clicking Graphlink Rules (for use with Glimmr Canvas-Based Drawing by Erik Temple)

Current graphlink is an object that varies. [The current graphlink is either text or g-element, depending on whether Glimmr Canvas-Based Drawing is also in use]
Current graphlink x is a number that varies.
Current graphlink y is a number that varies.
Current graphlink window is a g-window that varies.
Candidate replacement command is indexed text that varies. [The candidate replacement command is set in the clicking graphlink rules. If the default graphlink processing rule is fired, this will be converted into the glulx replacement command, to be processed by Glulx Entry Points.]

The clicking graphlink rules are a rulebook.

A clicking graphlink rule (this is the default command replacement by graphlinks rule):
	if the click hit a hot link:
		cancel input in main window;
		follow the graphlink processing rules for the current graphlink;
		rule succeeds;
	now glulx replacement command is "".

The default command replacement by graphlinks rule is listed last in the clicking graphlink rules.

To decide if the click hit a hot link:
	repeat through the Table of Graphlink Glulx Replacement Commands in reverse order:
		if the current graphlink window is g-win entry:
			if the current graphlink x >= p-left entry and the current graphlink x <= p-right entry and the current graphlink y >= p-top entry and the current graphlink y <= p-bottom entry:
				change the current graphlink to linkid entry;
				change the candidate replacement command to replacement entry;
				decide yes;
	decide no;


Part 4 - Graphlink processing rules (for use with Glimmr Canvas-Based Drawing by Erik Temple)

The graphlink processing rules are an object-based rulebook.

A graphlink processing rule for a g-element (called the link) (this is the default graphlink processing rule):
	change the glulx replacement command to the candidate replacement command;
	change the candidate replacement command to "";
	rule succeeds. 


Part 4 - Graphlink processing rules stub (for use without Glimmr Canvas-Based Drawing by Erik Temple)

The graphlink processing rules are an object-based rulebook.


Part 5 - Identifying whether a command was generated by the mouse

The mouse-generated flag is a truth state that varies. The mouse-generated flag is false.

A command-pasting rule (this is the flag generated commands rule): 
	now the mouse-generated flag is true;
	
Every turn:
	now the mouse-generated flag is false;
	
To decide whether the command is mouse-generated:
	decide on the mouse-generated flag.
	
The flag generated commands rule is listed before the glue replacement command into parse buffer rule in the command-pasting rules.


Part 6a - Link Management (for use without Glimmr Canvas-Based Drawing by Erik Temple)

To set a graphlink in (g - a g-window) identified as (newlinkid - some text) from (gleft - a number) by (gtop - a number) to (gright - a number) by (gbottom - a number) as (linkaction - some text), ignoring redundant links:
	if not ignoring redundant links and there is a linkid of newlinkid in the Table of Graphlink Glulx Replacement Commands:
		choose row with linkid of newlinkid in the Table of Graphlink Glulx Replacement Commands;
		change g-win entry to g;
		change p-top entry to gtop;
		change p-bottom entry to gbottom;
		change p-left entry to gleft;
		change p-right entry to gright;
		change replacement entry to linkaction;
	otherwise if the number of blank rows in the Table of Graphlink Glulx Replacement Commands is greater than 0:
		choose a blank row in the Table of Graphlink Glulx Replacement Commands;
		change linkid entry to newlinkid;
		change g-win entry to g;
		change p-top entry to gtop;
		change p-bottom entry to gbottom;
		change p-left entry to gleft;
		change p-right entry to gright;
		change replacement entry to linkaction.

To set a graphlink in (g - a g-window) identified as (newlinkid - some text) from (gleft - a number) by (gtop - a number) to (gright - a number) by (gbottom - a number) as (linkref - a number), ignoring redundant links:
	if not ignoring redundant links and there is a linkid of newlinkid in the Table of Graphlink Glulx Replacement Commands:
		choose row with linkid of newlinkid in the Table of Graphlink Glulx Replacement Commands;
		change g-win entry to g;
		change p-top entry to gtop;
		change p-bottom entry to gbottom;
		change p-left entry to gleft;
		change p-right entry to gright;
		change alt entry to linkref;
	otherwise if the number of blank rows in the Table of Graphlink Glulx Replacement Commands is greater than 0:
		choose a blank row in the Table of Graphlink Glulx Replacement Commands;
		change linkid entry to newlinkid;
		change g-win entry to g;
		change p-top entry to gtop;
		change p-bottom entry to gbottom;
		change p-left entry to gleft;
		change p-right entry to gright;
		change alt entry to linkref.

To set a graphlink in (g - a g-window) identified as (newlinkid - some text) from (gleft - a number) by (gtop - a number) to (gright - a number) by (gbottom - a number) as (linkref - a stored action), ignoring redundant links:
	if not ignoring redundant links and there is a linkid of newlinkid in the Table of Graphlink Glulx Replacement Commands:
		choose row with linkid of newlinkid in the Table of Graphlink Glulx Replacement Commands;
		change g-win entry to g;
		change p-top entry to gtop;
		change p-bottom entry to gbottom;
		change p-left entry to gleft;
		change p-right entry to gright;
		change action entry to linkref;
	otherwise if the number of blank rows in the Table of Graphlink Glulx Replacement Commands is greater than 0:
		choose a blank row in the Table of Graphlink Glulx Replacement Commands;
		change linkid entry to newlinkid;
		change g-win entry to g;
		change p-top entry to gtop;
		change p-bottom entry to gbottom;
		change p-left entry to gleft;
		change p-right entry to gright;
		change action entry to linkref.

To clear the graphlink identified as (dellinkid - some text):
	if there is a linkid of dellinkid in the Table of Graphlink Glulx Replacement Commands:
		choose row with linkid of dellinkid in the Table of Graphlink Glulx Replacement Commands;
		blank out the whole row.

	
Table of Graphlink Glulx Replacement Commands
linkid	g-win	p-top	p-bottom	p-left	p-right	replacement	alt	action
some text	a g-window	a number	a number	a number	a number	some text	number	stored action
with 120 blank rows


Part 6b - Link Management (for use with Glimmr Canvas-Based Drawing by Erik Temple)

To set a graphlink in (g - a g-window) identified as (newlinkid - an object) from (gleft - a number) by (gtop - a number) to (gright - a number) by (gbottom - a number) as (linkaction - some text), ignoring redundant links:
	if not ignoring redundant links and there is a linkid of newlinkid in the Table of Graphlink Glulx Replacement Commands:
		choose row with linkid of newlinkid in the Table of Graphlink Glulx Replacement Commands;
		change g-win entry to g;
		change p-top entry to gtop;
		change p-bottom entry to gbottom;
		change p-left entry to gleft;
		change p-right entry to gright;
		change replacement entry to linkaction;
	otherwise if the number of blank rows in the Table of Graphlink Glulx Replacement Commands is greater than 0:
		choose a blank row in the Table of Graphlink Glulx Replacement Commands;
		change linkid entry to newlinkid;
		change g-win entry to g;
		change p-top entry to gtop;
		change p-bottom entry to gbottom;
		change p-left entry to gleft;
		change p-right entry to gright;
		change replacement entry to linkaction.

To set a graphlink in (g - a g-window) identified as (newlinkid - an object) from (gleft - a number) by (gtop - a number) to (gright - a number) by (gbottom - a number) as (linkref - a number), ignoring redundant links:
	if not ignoring redundant links and there is a linkid of newlinkid in the Table of Graphlink Glulx Replacement Commands:
		choose row with linkid of newlinkid in the Table of Graphlink Glulx Replacement Commands;
		change g-win entry to g;
		change p-top entry to gtop;
		change p-bottom entry to gbottom;
		change p-left entry to gleft;
		change p-right entry to gright;
		change alt entry to linkref;
	otherwise if the number of blank rows in the Table of Graphlink Glulx Replacement Commands is greater than 0:
		choose a blank row in the Table of Graphlink Glulx Replacement Commands;
		change linkid entry to newlinkid;
		change g-win entry to g;
		change p-top entry to gtop;
		change p-bottom entry to gbottom;
		change p-left entry to gleft;
		change p-right entry to gright;
		change alt entry to linkref.

To set a graphlink in (g - a g-window) identified as (newlinkid - an object) from (gleft - a number) by (gtop - a number) to (gright - a number) by (gbottom - a number) as (linkref - a stored action), ignoring redundant links:
	if not ignoring redundant links and there is a linkid of newlinkid in the Table of Graphlink Glulx Replacement Commands:
		choose row with linkid of newlinkid in the Table of Graphlink Glulx Replacement Commands;
		change g-win entry to g;
		change p-top entry to gtop;
		change p-bottom entry to gbottom;
		change p-left entry to gleft;
		change p-right entry to gright;
		change action entry to linkref;
	otherwise if the number of blank rows in the Table of Graphlink Glulx Replacement Commands is greater than 0:
		choose a blank row in the Table of Graphlink Glulx Replacement Commands;
		change linkid entry to newlinkid;
		change g-win entry to g;
		change p-top entry to gtop;
		change p-bottom entry to gbottom;
		change p-left entry to gleft;
		change p-right entry to gright;
		change action entry to linkref.

To clear the graphlink identified as (dellinkid - an object):
	if there is a linkid of dellinkid in the Table of Graphlink Glulx Replacement Commands:
		choose row with linkid of dellinkid in the Table of Graphlink Glulx Replacement Commands;
		blank out the whole row.

	
Table of Graphlink Glulx Replacement Commands
linkid	g-win	p-top	p-bottom	p-left	p-right	replacement	alt	action
an object	a g-window	a number	a number	a number	a number	some text	number	stored action
with 120 blank rows


Part 6 - Silent Replacement-Commands

[This section revises (and replaces) the print text to the input prompt rule from Glulx Entry Points so that it checks for the $- prefix that indicates a silent command; i.e., one that we don't want to appear in the transcript. On locating it, the new rule deletes the prefix while rerouting around the code that writes the command to the input prompt.]


Silent-replacement is a truth state that varies. Silent-replacement is false.

A command-showing rule (this is the select text for printing to the input prompt rule):
	if glulx replacement command matches the regular expression "^\$-":
		replace the text "\$-" in glulx replacement command with "";
		now silent-replacement is true;
		rule succeeds;
	otherwise:
		say input-style-for-glulx;
		say glulx replacement command;
		say roman type;

The select text for printing to the input prompt rule is listed instead of the print text to the input prompt rule in the command-showing rules.

Buffered command-prompt is some text that varies.

The last when play begins rule:
	Change buffered command-prompt to the command prompt.

After reading a command  (this is the silent-replacement command-prompt rule):
	if the command prompt is "":
		change the command prompt to the buffered command-prompt;
	if silent-replacement is true:
		change the buffered command-prompt to the command prompt;
		change the command prompt to "";
	now silent-replacement is false.



[Part 7a - Debugging Commands (for use with Permanent Debugging by Erik Temple)

Section 7.1a - Debugging Graphlinks Table

Debugging graphlinks is an action out of world.	Understand "graphlinks" or "graphlinks table" as debugging graphlinks. 

Check debugging graphlinks:
	say "[line break][bold type]Table of Graphlink Glulx Replacement Commands[roman type] (presented in reverse order)[line break]There are [number of filled rows in the Table of Graphlink Glulx Replacement Commands] entries in the table.";
	repeat through the Table of Graphlink Glulx Replacement Commands in reverse order:
		say "[linkid entry] ([g-win entry]): ([p-left entry],[p-top entry]) - ([p-right entry],[p-bottom entry]): [replacement entry][line break]";
	say "[line break]Last window to be clicked: [current graphlink window][line break]".


Section 7.2a - Report Mouse Coordinates

Showing clicked coordinates is an action out of world. Understand "coordinates" as showing clicked coordinates. Coordinate-trace is a truth state that varies. Coordinate-trace is false.

Check showing clicked coordinates:
	If coordinate-trace is false:
		now coordinate-trace is true;
	otherwise:
		now coordinate-trace is false;
	say "Coordinate reporting now [if coordinate-trace is true]on[otherwise]off[end if].[line break]".

A clicking graphlink rule (this is the report coordinates rule):
	if coordinate-trace is true:
		[let graph-x be current graphlink x as a fixed point number;
		let graph-y be current graphlink y as a fixed point number;]
		say "Window coordinates of mouse input ([current graphlink window]): ([current graphlink x],[current graphlink y])[line break]".

[say "Screen coordinates of mouse input ([current graphlink window]): ([current graphlink x],[current graphlink y])[line break]Approximate background grid coordinates: ([(graph-x real minus window x-offset) real divided by the window-scaling factor as an integer],[(graph-y real minus window y-offset) real divided by the window-scaling factor as an integer])[line break]";]

The report coordinates rule is listed before the default command replacement by graphlinks rule in the clicking graphlink rules.]


Part 7b - Debugging Commands (for use without Permanent Debugging by Erik Temple)

Section 7.1b - Debugging Graphlinks Table (not for release)

Debugging graphlinks is an action out of world.	Understand "graphlinks" or "graphlinks table" as debugging graphlinks. 

Check debugging graphlinks:
	say "[line break][bold type]Table of Graphlink Glulx Replacement Commands[roman type] (presented in reverse order)[line break]There are [number of filled rows in the Table of Graphlink Glulx Replacement Commands] entries in the table.";
	repeat through the Table of Graphlink Glulx Replacement Commands in reverse order:
		say "[linkid entry] ([g-win entry]): ([p-left entry],[p-top entry]) - ([p-right entry],[p-bottom entry]):[if there is a replacement entry] [replacement entry][end if][if there is an alt entry] [alt entry][end if][if there is an action entry] [action entry][end if][line break]";
	say "[line break]Last window to be clicked: [current graphlink window][line break]".


Section 7.2b - Report Mouse Coordinates (not for release)

Showing clicked coordinates is an action out of world. Understand "coordinates" as showing clicked coordinates.

Coordinate-trace is a truth state that varies. Coordinate-trace is false.

Check showing clicked coordinates:
	If coordinate-trace is false:
		now coordinate-trace is true;
	otherwise:
		now coordinate-trace is false;
	say "Coordinate reporting now [if coordinate-trace is true]on[otherwise]off[end if].[line break]".

A clicking graphlink rule (this is the report coordinates rule):
	if coordinate-trace is true:
		say "[line break]Window coordinates of mouse input ([current graphlink window]): ([current graphlink x],[current graphlink y])[line break]";

The report coordinates rule is listed first in the clicking graphlink rules.


Glimmr Graphic Hyperlinks ends here.

---- DOCUMENTATION ---- 

Graphic Hyperlinks for Flexible Windows allows for the definition of "hotlinked" rectangular zones within Glulx graphics windows; when the player clicks within these zones, an action is returned which can either be printed at the command prompt, or fired silently. The extension requires Jon Ingold's Flexible Windows extension, which is used to define and manage the windowing system. Graphic links can be defined in any number of graphics windows simultaneously.

Graphic Hyperlinks for Flexible Windows is an adaptation of Jeff Sheets' Graphic Links extension to the framework provided by Jon Ingold's Flexible Windows. Like the original Graphic Links, it is not really intended to be complete in itself, but rather to be a relatively flexible template for more specific applications. The major limitation of both extensions is their reliance on the coordinate system of the window itself to define links; an image that has been scaled and centered in a window will move relative to the window coordinates any time the window is resized. For nearly all purposes, then, authors will want to provide a conversion from a more stable coordinate system to the window's system. For example, the Glimmr Canvas-Based Drawing extension does just this, while also providing completely automated updating of links by using sprite objects to define them.

While Graphic Hyperlinks for Flexible Windows is an adaptation of Graphic Links, it includes a number of new features, including the ability to issue actions silently, rather than printing them to the command prompt (intended for use in graphical window interfaces), and multiple debugging commands.


Section: Maintaining the Table of Graphic Hyperlinks

The active hyperlinks are stored in a table called the Table of Graphlink Glulx Replacement Commands.





