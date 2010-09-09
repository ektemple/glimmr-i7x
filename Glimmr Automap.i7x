Version 1/100904 of Glimmr Automap (for Glulx only) by Erik Temple begins here.

"Provides a plug-and-play graphical automapping solution built on top of Mark Tilford's Automap extension. Can fall back to text-based map on interpreters that don't support graphics."

[Documentation: For terps that don't support graphics, we provide a global variable to use to specify the depth of the map in the status line.]
[Documentation: Explain why we're using a new automap graphlinking rules, rather than use the graphlink processing rules. (It's because we want to be able to use rooms as graphlink targets as well.)]
[Documentation: If no font is included, must employ the no query use option or run-time errors will result.]

Include version 3 of Automap by Mark Tilford.
Include Glimmr Drawing Commands by Erik Temple.
Include Glimmr Canvas-Based Drawing by Erik Temple.
Include Glimmr Graphic Hyperlinks by Erik Temple.


Chapter - Use options

Use no query functionality translates as (- Constant NO_QUERY; -).
Use no post-processing translates as (- Constant N_POST_PROCESS; -).

Use MAX_ARRAYS of 3000.

Use automap hyperlinks. [This use option is provided by the Automap extension. It must be invoked to avoid compiler errors.]
Use automap static allocation. [Prevents Spatterlight from crashing when the window is resized.]


Chapter - Console settings
[This is a "macro" that allows the extension to identify itself in the Glimmr console window with fewer keystrokes on my part.]

To say GLAM:
	say "[bracket]Glimmr Automap[close bracket]: ".


Chapter - ASCII map

[If the player's interpreter does not support graphics, the Automap text-based map (ASCII or Unicode) will be shown instead. This map is shown by expanding the number of lines in the status window. We can set the number of lines in the text map by using this variable. The default is 12 rows.]

The text-map depth is a number variable. The text-map depth is usually 12.

[To preview what the text-only map will look like to those using an interpreter without graphics support, paste the following into your story code:

First for constructing the status line:
	shut down the map-window;
	reserve automap memory of (text-map depth) rows;
	fill status bar with table of ordinary status and map;
	rule succeeds.]


Chapter - Configuration

When play begins:
	if glulx graphics is supported:
		now the current zoom is map zoomed in;[refers to Automap's zoom, which must always be set to zoomed in.]
		if the current zoom level of the map-renderer is 0:
			change the current zoom level of the map-renderer to the initial zoom level of the associated tileset of the map-renderer;
		if the map viewport is not a map-display window:
			now the map viewport is a random map-display window;
		if the display-layer of the UI-frame is 0:
			change the display-layer of the UI-frame to UI-layer minus 1;
		if the display-layer of the UI-query-explanation is 0:
			change the display-layer of the UI-query-explanation to UI-layer; 
		repeat with item running through the list of UI-buttons:
			change the display-layer of item to UI-layer;
		if the horizontal margin of the UI-frame is 999:
			change the horizontal margin of the UI-frame to 5;
		if the vertical margin of the UI-frame is 999:
			change the vertical margin of the UI-frame to 5;
		if the vertical margin of the UI-query-explanation is 999:
			change the vertical margin of the UI-query-explanation to 38;
		if the horizontal margin of the UI-query-explanation is 999:
			change the horizontal margin of the UI-query-explanation to 0;
		if the number of entries of the list of display-active UI-buttons is 2:
			change the image-ID of the UI-frame to Figure of UI-frame-short.


Section - Default tileset (for use with Glimmr Automap Tileset by Erik Temple)

The associated tileset of the map-renderer is usually the Glimmr Automap Tileset.
	

Chapter - Hacking Automap

First for constructing the status line (this is the bypass status line map rule):
	if glulx graphics is supported:
		fill status bar with table of ordinary status;
		rule succeeds;
	otherwise:
		reserve automap memory of (text-map depth) rows;
		continue the action.

[If you prefer that the MAP command toggle the ASCII version of the map rather than close the map window entirely, you can copy the following into your story file:

Chapter - Deciding (in place of Chapter - Hacking Automap in Glimmr Automap by Erik Temple)

First for constructing the status line (this is the bypass status line map rule):
	if glulx graphics is supported and the map-window is g-present:
		fill status bar with table of ordinary status;
		rule succeeds;
	otherwise:
		now current zoom is map zoomed in;
		reserve automap memory of 12 rows;
		fill status bar with table of ordinary status and map.]
	

Chapter - The map-display window kind
[We need to change Glimmr Canvas-Based Drawing's basic window-drawing behavior for the automap window. One of the most straightforward ways to do this is with a kind. A property would work as well, but we don't really want to be able to change this during play—map display would break entirely.]

A map-display window is a kind of graphlink g-window.

The map viewport is a g-window that varies. [If the author doesn't explicitly name the map viewport, we will automatically select a map-display window to be the viewport when play begins. In most cases, this will be the only existing map-display window.]

[The author may provide a maximum map size to use. This refers to the number of *tiles* to be displayed, not the maximum number of pixels, and can be used to restrict the size of the map for either performance or aesthetic reasons. For example, a fixed map size combined with a restricted number of available zoom levels can make it easier to predict the output size of the map.]
A map-display window has a number called the maximum map width. The maximum map width of a map-display window is usually 0.
A map-display window has a number called the maximum map height. The maximum map height of a map-display window is usually 0.


Chapter - Map window management

After constructing the status line (this is the graphic automap updating rule):
	follow the refresh windows rule;
	continue the action.


Chapter - Rules for opening and closing the map window

[We provide these as rules, so that players interested in a more complex system of windows can hook into them more easily. (For example, we might want two map windows on screen at once, one window at a different level of zoom than the other, or we might want to use Automap to display a map of the overall world, while using something like the Room and Dimension extension to render a map of the room itself in another window.)]

Section - Opening the map window

The opening up the map window rules are a rulebook.

Last opening up the map window:
	open up the map viewport.
	

Section - Closing the map window

The shutting down the map window rules are a rulebook.

Last shutting down the map window:
	shut down the map viewport.


Chapter - Extension of the tileset kind
[The tileset kind is defined in Glimmr Drawing Commands. We extend the kind here to allow for zooming.]

A tileset has a list of real numbers called the zoom-level set. The zoom-level set of a tileset is usually {1.0000}.

A tileset has a number called the initial zoom level. The initial zoom level of a tileset is usually 1.


Chapter - The map-renderer object

The map-renderer is a g-element. The map-renderer has a glulx color value called the background tint. The background tint of the map-renderer is usually g-placenullcol. The graphlink status of the map-renderer is usually g-active.

The scaling factor of the map-renderer is 1.0000. The x-scaling factor is 1.0000. The y-scaling factor is 1.0000.

The origin of the map-renderer is {0, 0}. The display-layer is 1.

The map-renderer has a tileset called the associated tileset. 

The map-renderer has a number called the current zoom level. The current zoom level is usually 0.

[The map-width and map-height are set automatically by the extension. Authors will not need to set them directly unless replacing the resize canvas to map rule with one of their own devising.]
The map-renderer has a number called the map-width. The map-width is 0.
The map-renderer has a number called the map-height. The map-height is 0.


Chapter - New window scaling rule for the map window

For scaling a map-display window (called the viewport) (this is the select appropriate zoom level rule):
	[say "Applying zoom level...";
	say "Background color: [background tint of map-renderer].";]
	change the arbitrary scaling factor of the viewport to entry (current zoom level of the map-renderer) of the zoom-level set of the associated tileset of the map-renderer;
	#if utilizing Glimmr debugging;
	say "[>console][GLAM]Window [i][viewport][/i] is a map-display window. Arbitrary scaling factor set to [arbitrary scaling factor of the viewport], based on entry [current zoom level of the map-renderer] of the zoom-level set of the tileset [i][associated tileset of the map-renderer][/i].[<]";
	#end if;
	continue the action.
	
For scaling a map-display window (called the viewport) (this is the resize canvas to map rule):
	let scaled tile-width be (tile-width of associated tileset of the map-renderer * arbitrary scaling factor of the viewport) as an integer;
	let scaled tile-height be (tile-height of associated tileset of the map-renderer * arbitrary scaling factor of the viewport) as an integer;
	#if utilizing Glimmr debugging;
	say "[>console][GLAM]Scaled automap tile will measure [scaled tile-width] x [scaled tile-height] pixels, based on [i]map-window[/i] scaling factor.[<]";
	#end if;
	let x-win be the width of the viewport / scaled tile-width;
	let y-win be the height of the viewport / scaled tile-height;
	#if utilizing Glimmr debugging;
	say "[>console][GLAM]Window fits [x-win] tiles wide by [y-win] tiles high.[<]";
	#end if;
	if maximum map width of the viewport > 0:
		let x-win be MIN (x-win) or (maximum map width of the viewport);
	if maximum map height of the viewport > 0:
		let y-win be MIN (y-win) or (maximum map height of the viewport);
	#if utilizing Glimmr debugging;
	if maximum map height of viewport > 0 or maximum map width of viewport > 0:
		say "[>console][GLAM]Number of displayed automap tiles set at [x-win] tiles wide by [y-win] tiles high, taking into account author limits.[<]";
	#end if;
	reserve automap memory of y-win rows by x-win columns;
	if the map is drawn and the current zoom is not map absent:
		do nothing;[Automap's map is drawn by the phrase "if the map is drawn"; hence this odd instruction.]
	change the map-width of the map-renderer to (map width * tile-width of associated tileset of the map-renderer);
	change the map-height of the map-renderer to (map height * tile-height of associated tileset of the map-renderer);
	change the canvas-width of the associated canvas of the viewport to map-width of the map-renderer;
	change the canvas-height of the associated canvas of the viewport to map-height of the map-renderer;
	#if utilizing Glimmr debugging;
	say "[>console][GLAM]Automap data calculated ([y-win * x-win] total tiles).[<]";
	#end if;
	continue the action;
	

Chapter - Element display rule for the map-renderer

An element display rule for the map-renderer when the location is unmappable (this is the unmappable room rule):
	exit.

An element display rule for the map-renderer (this is the map-renderer display rule):
	let tilesetting be the associated tileset of map-renderer;
	let scan be 0;
	let row be the win-y of the map-renderer;
	let column be the win-x of the map-renderer;
	let xx be the tile-width of the tilesetting * scaling factor of the current window as an integer;
	let yy be the tile-height of the tilesetting * scaling factor of the current window as an integer;
	unless the background tint of the map-renderer is g-placenullcol:
		dimrectdraw (color background tint of the map-renderer) in (the current window) at (column) by (row) with dimensions (map-width of map-renderer * scaling factor of the current window as an integer) by (map-height of map-renderer * scaling factor of the current window as an integer);
		#if utilizing Glimmr debugging;
		say "[>console][GLAM]Drawing background rectangle (glulx color-value [background tint of map-renderer]) from ([win-x], [win-y]) to ([win-x + (map-width of map-renderer * scaling factor of the current window as an integer)], [win-y + (map-height of map-renderer * scaling factor of the current window as an integer)]) for element [i][map-renderer][/i] in [i][current window][/i].[<]";
		#end if;
	unless the no post-processing option is active:
		follow the automap post-processing rules;
	repeat with count running from 1 to (map height * map width):
		increase scan by 1;
		if scan > map width:
			increase row by yy;
			change column to the win-x of the map-renderer;
			let scan be 1;
		let V be the map glyph of count;
		if there is a char of V in the translation-table of the tilesetting:
			choose row with a char of V in the translation-table of the tilesetting;
			let the current tile be tile entry;
			drscimage (current tile) in (current window) at (column) by (row) with dimensions (xx) by (yy);
			if the graphlink status of the map-renderer is g-active:
				unless linked room-ID of count is 0:
					set a graphlink in the current window identified as map-renderer from column by row to (column + xx) by (row + yy) as linked room-ID of count, ignoring redundant links;
					#if utilizing the image-map graphlink preview option;
					boxdraw (color graphlink preview color) in (current window) from (column) by (row) to (column + xx) by (row + yy) with 1;
					#end if;
		increase column by xx;
	#if utilizing Glimmr debugging;
	say "[>console][GLAM]Drawing element [i]map-renderer[/i] in [i][current window][/i] at origin ([win-x of map-renderer], [win-y of map-renderer]), dimensions [map width * xx] x [map height * yy] pixels ([map width] x [map height] tiles)[if the graphlink status of the map-renderer is g-active][GLAM]Hyperlinks set for linked room-ID, as provided[end if].[<]"; 
	#end if.
		

Chapter - Post-processing of map data

[The automap post-processing rules are provided as a hook to any post-processing we may want to do of the map data. By default, we repair corner tiles here by filling in the gaps of diagonals with small tiles. If post-processing is not desired, we can compile using the no post-processing option to avoid checking the rulebook at all.]

The automap post-processing rules are a rulebook.

An automap post-processing rule (this is the fill diagonal corners rule):
	let scan be 0;
	repeat with N running from 1 to (map height * map width):
		increase scan by 1;
		if scan > map width:
			let scan be 1;
		if the map glyph of N is 53 or the map glyph of N is 70:
			if (scan + 1) < map width, place glyph 73 at (N + 1);
		if the map glyph of N is 36:
			if (scan - 1) > 0, place glyph 71 at (N - 1);
			if (scan + 1) < map width, place glyph 73 at (N + 1);
		if the map glyph of N is 51 or the map glyph of N is 68:
			if (scan - 1) > 0, place glyph 71 at (N - 1);
		if the map glyph of N is 52 or the map glyph of N is 69:
			if (scan + 1) < map width, place glyph 74 at (N + 1);
		if the map glyph of N is 35:
			if (scan + 1) < map width, place glyph 74 at (N + 1);
			if (scan - 1) > 0, place glyph 72 at (N - 1);
		if the map glyph of N is 50 or the map glyph of N is 67:
			if (scan - 1) > 0, place glyph 72 at (N - 1);
		if the map glyph of N is 90:
			if (N - map width) > 0, place glyph 11 at (N - map width) imperiously;
			if (scan + 1) < map width, place glyph 12 at (N + 1) imperiously;
			if (N + map width) < (map height * map width), place glyph 13 at (N + map width) imperiously;
			if (scan - 1) > 0, place glyph 14 at (N - 1) imperiously;
	#if utilizing Glimmr debugging;
	say "[>console][GLAM]Automap data post-processed to correctly render corner tiles.[<]"; 
	#end if.


Chapter - Reading and writing automap data
		
To decide what number is the map glyph of (N - a number):
	(- Automap_Chars->( {N} - 1 ) -)
	
To decide what number is the linked room-ID of (N - a number):
	(- Automap_Links-->( {N} - 1 ) -)
	
To place glyph (ch - number) at (x - a number):
	(- if  ( Automap_Chars -> ( {x} - 1 ) == 32 ) {	
	Automap_Chars -> ( {x} - 1 ) = {ch}; 
	} 
	-)

To place glyph (ch - number) at (x - a number) imperiously:
	(- Automap_Chars -> ( {x} - 1 ) = {ch}; -)
		

Chapter - Graphlinking the map

A clicking graphlink rule when the current graphlink window is a map-display window (this is the automap forward graphlinking rule):
	repeat through the Table of Graphlink Glulx Replacement Commands in reverse order:
		if the current graphlink window is g-win entry:
			if the current graphlink x >= p-left entry and the current graphlink x <= p-right entry and the current graphlink y >= p-top entry and the current graphlink y <= p-bottom entry:
				now glulx replacement command is "";
				change the current graphlink to linkid entry;
				if there is an alt entry:
					#if utilizing Glimmr debugging;
					say "[>console][GLAM]Mouse input received on graphlink '[current graphlink]' in window [italic type][current graphlink window][roman type]: ([current graphlink x], [current graphlink y]). Automap graphlink rules triggered for room [i][glulx equivalent of alt entry][/i].[<]";
					#end if;
					follow the automap graphlink rules for the glulx equivalent of alt entry;[the glulx equivalent is a type-casting routine. It returns a room.]
				otherwise:
					#if utilizing Glimmr debugging;
					say "[>console][GLAM]Mouse input received on graphlink '[current graphlink]' in window [italic type][current graphlink window][roman type]: ([current graphlink x], [current graphlink y]). Automap graphlink rules triggered.[<]";
					#end if;
					follow the automap graphlink rules for the current graphlink;
				rule succeeds;
				
A clicking graphlink rule when the current graphlink window is a map-display window (this is the automap background graphlinking rule):
	unless the no query functionality option is active:
		deactivate the current map label;
		change the image-ID of UI-query to the resting state of UI-query;
		deactivate UI-query-explanation;
		follow the refresh windows rule;
		#if utilizing Glimmr debugging;
		say "[>console][GLAM]Mouse input received in window [i][current graphlink window][/i] (no link triggered): ([current graphlink x], [current graphlink y]). Query canceled.[<]";
		#end if;
		rule succeeds;
	#if utilizing Glimmr debugging;
	say "[>console][GLAM]Mouse input received in window [i][current graphlink window][/i] (no link triggered): ([current graphlink x], [current graphlink y]).[<]";
	#end if;
	rule fails.
				

Chapter - The automap graphlink rulebook

The automap graphlink rules are an object-based rulebook.
The automap graphlink rules have outcomes exit (success - the default) and continue (no outcome).

The current map label is a g-element variable.

[The following phrase is defined in Mark Tilford's Automap. but in a section that only compiles when we're using Basic Hyperlinks. Basic Hyperlinks is not recommended for use with Flexible Windows, however, so we repeat the phrase here.]
To decide what room is the glulx equivalent of (n - a number):
	(- {n} -)



Section - Reorder report coordinates rule (not for release)

The report coordinates rule is listed first in the automap graphlink rules.


Section - Clicking a button

First automap graphlink rule for the UI-query (this is the query button management rule):
	if the image-ID of the UI-query is the depressed state of UI-query:
		change the image-ID of UI-query to the resting state;
		deactivate the UI-query-explanation;
	otherwise:
		change the image-ID of UI-query to the depressed state;
		if the maximum display-count of UI-query-explanation > 0 and (display-count of UI-query-explanation < maximum display-count of UI-query-explanation) or maximum display-count of UI-query-explanation is 999:
			activate the UI-query-explanation;
			increase the display-count of UI-query-explanation by 1;
	follow the refresh windows rule.

Automap graphlink rule for a UI-button (called the pressee) when the image-ID of the pressee is not the inactive state of the pressee (this is the activate non-modal UI button rule):
	now the image-ID of the current graphlink is the depressed state of the current graphlink;
	display (image-ID of pressee) in the current window at (origin of pressee);
	[set a graphlink in the current window identified as pressee from (entry 1 of the origin of pressee) by (entry 2 of the origin of the pressee) to (entry 1 of the origin of pressee plus the image-width of the image-ID of pressee) by (entry 2 of the origin of pressee plus the image-height of the image-ID of pressee) as the linked action of the pressee;]
	revert the button after 0.1500 seconds;
	silently try the linked action of the current graphlink.


Section - Querying a room

Automap graphlink rule for a room (called the target) when the no query functionality option is not active (this is the display queried room name rule):
	if UI-query is display-active and the image-ID of UI-query is not the depressed state of UI-query:[if we're using the query button, we only want the action to proceed when the button is in its depressed state. Otherwise, we drop through to the author's rule.]
		continue;
	if the current map label is a rendered string:
		change the text-string of the current map label to the printed name of the target;
		change the origin of the current map label to the canvas equivalent of the screen coordinates (current graphlink x) by (current graphlink y) of (current graphlink window);
	activate the current map label;
	if the UI-query-explanation is not g-persistent:
		deactivate the UI-query-explanation;
	follow the refresh windows rule;
	deactivate the current map label.[The map label will disappear from the map, but only after the next time the window is redrawn.]


Chapter - Popup room labels (for use with Glimmr Bitmap Font by Erik Temple)

The current map label is usually the bitmap automap label.

The bitmap automap label is a bitmap-rendered string. The tint is usually g-black. The background tint is usually g-yellow. The display-layer is usually 2. The display status is usually g-inactive. The associated font is usually Glimmr C&C.


Chapter - New functionality for Automap verbs

Understand "zoom in" or "zoom out" or "zoom" as a mistake ("[only-one-graphical-zoom-level]") when glulx graphics is supported and the number of entries of the zoom-level set of the associated tileset of the map-renderer is 1 and not the command is mouse-generated.


Section - Zooming in

Carry out zooming in when glulx graphics is supported:
	if the map viewport is g-unpresent:
		try opening the map window;
	if the map viewport is g-present:
		if current zoom level of the map-renderer < the number of entries of the zoom-level set of the associated tileset of the map-renderer:
			increase current zoom level of the map-renderer by 1;
	otherwise:
		say "[line break](Could not open the map window.)";
	rule succeeds.
	
Report zooming in when glulx graphics is supported:
	unless the command is mouse-generated:
		say "[zoomed-in]"
		

Section - Zooming out

Carry out zooming out when glulx graphics is supported:
	if the map viewport is g-unpresent:
		try opening the map window;
	if the map viewport is g-present:
		if current zoom level of the map-renderer > 1:
			decrease current zoom level of the map-renderer by 1;
	otherwise:
		say "[map-window-failed-to-open]";
	rule succeeds.
	
Report zooming out when glulx graphics is supported:
	unless the command is mouse-generated:
		say "[zoomed-out]"
		

Section - Toggling zoom

Graphic zoom toggling is an action out of world applying to nothing. Understand "zoom" as graphic zoom toggling when glulx graphics is supported.

Carry out graphic zoom toggling:
	if the map viewport is g-unpresent:
		try opening the map window;
	if the map viewport is g-present:
		if current zoom level of the map-renderer < the number of entries of the zoom-level set of the associated tileset of the map-renderer:
			increase current zoom level of the map-renderer by 1;
		otherwise:
			now current zoom level of the map-renderer is 1;
	otherwise:
		say "[map-window-failed-to-open]";
	rule succeeds.
		
Report graphic zoom toggling when glulx graphics is supported:
	unless the command is mouse-generated:
		say "[zoomed-in-or-out]"
		

Section - Opening the map window

Opening the map window is an action out of world applying to nothing. Understand "map" or "open map" or "open map window" as opening the map window when glulx graphics is supported and the map viewport is g-unpresent.

Understand "open map" or "open map window" as a mistake ("[Map-window-already-open]") when glulx graphics is supported and the map viewport is g-present.

Carry out opening the map window when glulx graphics is supported and the map viewport is g-unpresent:
	now current zoom is map zoomed in;
	follow the opening up the map window rules.

Report opening the map window when glulx graphics is supported and the map viewport is g-present:
	say "[Map-window-open]"
	

Section - Closing the map window

Understand "map" or "close map" or "close map window" as zooming away when glulx graphics is supported and the map viewport is g-present.

Carry out zooming away when glulx graphics is supported and the map viewport is g-present:
	now current zoom is map absent;
	follow the shutting down the map window rules;
	rule succeeds.

Report zooming away when glulx graphics is supported and the map viewport is g-unpresent:
	say "[Map-window-closed]"

Understand "close map" or "close map window" as a mistake ("[map-window-already-closed]") when glulx graphics is supported and the map viewport is g-unpresent.
	

Section - Error message for using unsupported Automap commands

Understand "map unicode" or "map fancy" or "map font 3" or "map beyond zork" or "map simple/ascii/plain" or "gargoyle bug workaround" or "map auto" or "map [text]" as a mistake ("[allowed-map-commands]") when glulx graphics is supported.


Chapter - Action messages

Section - Zooming
[The odd "run paragraph on" followed by "line break" is needed to avoid a double space after this line.]

To say only-one-graphical-zoom-level:
	say "Zooming the map is not allowed.[run paragraph on][line break]"


Section - Zooming in

To say zoomed-in:
	say "Zoomed in to level [current zoom level of the map-renderer] of [number of entries of the zoom-level set of the associated tileset of the map-renderer]."


Section - Zooming out

To say zoomed-out:
	say "Zoomed out to level [current zoom level of the map-renderer] of [number of entries of the zoom-level set of the associated tileset of the map-renderer]."


Section - Zooming either in or out

To say zoomed-in-or-out:
	say "Zoomed to level [current zoom level of the map-renderer] of [number of entries of the zoom-level set of the associated tileset of the map-renderer]."


Section - Map window open

To say map-window-open:
	say "Map window open."

To say map-window-already-open:
	say "The map window is already open."


Section - Map window failed to open

To say map-window-failed-to-open:
	say "[line break](Could not open the map window.)"


Section - Map window closed

To say map-window-closed:
	say "Map window closed."

To say map-window-already-closed:
	say "The map window is already closed."


Section - Allowed map commands

To say allowed-map-commands:
	say "(You can ZOOM IN, ZOOM OUT, or type MAP to toggle the map window.)"



Chapter - Debugging (not for release)

Dumping automap data is an action out of world applying to nothing. Understand "automap dump" or "dump map" or "dump automap" as dumping automap data. Understand "map dump" as dumping automap data when glulx graphics is supported.

Carry out dumping automap data:
	say "Map measures [map width] by [map height], totalling [map height * map width] tiles.[line break]Window measures [width of the assigned window of the map-renderer] x [height of the assigned window of the map-renderer] px.[line break]Scaled tile measures [tile-width of associated tileset of the map-renderer * arbitrary scaling factor of the assigned window of the map-renderer] x [tile-height of associated tileset of the map-renderer * arbitrary scaling factor of the assigned window of the map-renderer] px.[line break]Canvas measures [canvas-width of the associated canvas of the map-renderer] x [canvas-height of the associated canvas of the map-renderer] canvas units.";
	say "Dump of automap data:[paragraph break][fixed letter spacing]";
	let scan be 0;
	repeat with count running from 1 to (map width * map height):
		increase scan by 1;
		if scan > map width:
			say "[line break]";
			let scan be 1;
		if map glyph of count is 32:
			say "... ";
		otherwise if map glyph of count < 10:
			say " [map glyph of count]  ";
		otherwise if map glyph of count < 100:
			say " [map glyph of count] ";
		otherwise:
			say "[map glyph of count] ";
	say "[variable letter spacing][line break]".
	
Dumping automap links is an action out of world applying to nothing. Understand "automap link/links dump" or "dump links" or "dump map links"or "dump automap links" as dumping automap links. Understand "map link dump" as dumping automap links when glulx graphics is supported.

Carry out dumping automap links:
	say "Map measures [map width] by [map height], totalling [map height * map width] tiles.[line break]Window measures [width of the assigned window of the map-renderer] x [height of the assigned window of the map-renderer] px.[line break]Scaled tile measures [tile-width of associated tileset of the map-renderer * arbitrary scaling factor of the assigned window of the map-renderer] x [tile-height of associated tileset of the map-renderer * arbitrary scaling factor of the assigned window of the map-renderer] px.[line break]Canvas measures [canvas-width of the associated canvas of the map-renderer] x [canvas-height of the associated canvas of the map-renderer] canvas units.";
	say "Dump of automap hyperlink data:[paragraph break][fixed letter spacing]";
	let scan be 0;
	repeat with count running from 1 to (map width * map height):
		increase scan by 1;
		if scan > map width:
			say "[line break]";
			let scan be 1;
		if linked room-ID of count is 0:
			say ".. ";
		otherwise:
			say "[glulx equivalent of the linked room-ID of count] ";
	say "[variable letter spacing][line break]".


Chapter - Controls

Section - UI element figure declarations

Figure of UI-frame is the file "automapUI_frame.png".
Figure of UI-frame-short is the file "automapUI_frame_2button.png".
Figure of UI-query is the file "automapUI_query.png".
Figure of UI-zoom-in is the file "automapUI_zoomIn.png".
Figure of UI-zoom-out is the file "automapUI_zoomOut.png".
Figure of UI-query-depressed is the file "automapUI_query_depressed.png".
Figure of UI-zoomIn-disabled is the file "automapUI_zoomIn_disabled.png".
Figure of UI-zoomOut-disabled is the file "automapUI_zoomOut_disabled.png".
Figure of UI-zoomIn-depressed is the file "automapUI_zoomIn_depressed.png".
Figure of UI-zoomOut-depressed is the file "automapUI_zoomOut_depressed.png".
Figure of UI-query-explanation is the file "automapUI_explanation.png".


Section - UI element definition

[We do not want these images to be scaled by the canvas engine. The easiest way to ensure this is to assign them as direct descendants of the g-element kind, bypassing the sprite kind, which has its own scaling rules.]

A UI-element is a kind of g-element. 
A UI-element has a figure-name called the image-ID.
The display-layer of a UI-element is usually 0.

A UI-button is a kind of UI-element. The graphlink status of a UI-button is g-active.

A UI-button has a figure-name called the resting state.
A UI-button has a figure-name called the depressed state.
A UI-button has a figure-name called the inactive state.


Section - UI buttons

Some UI-buttons are defined by the Table of Map Buttons.

[The UI-layer is a global variable holding the layer number on which the buttons should be placed. It should generally be at least 2 layers higher than the map layer. If no display-layer is explicitly set for the UI-frame, it will be placed one level beneath the UI-layer.]

The UI-layer is a number that varies. The UI-layer is usually 4. 


Table of Map Buttons
g-element	image-ID	resting state	depressed state	inactive state
UI-zoom-in	Figure of UI-zoom-in	Figure of UI-zoom-in	Figure of UI-zoomIn-depressed	Figure of UI-zoomIn-disabled
UI-zoom-out	Figure of UI-zoom-out	Figure of UI-zoom-out	Figure of UI-zoomOut-depressed	Figure of UI-zoomOut-disabled

A UI-button has a stored action called the linked action.

The linked action of UI-zoom-in is the action of zooming in.
The linked action of UI-zoom-out is the action of zooming out.


Section - UI modal buttons

A UI-modal-button is a kind of UI-button. Some UI-modal-buttons are defined by the Table of Map Modal Buttons. The display status of a UI-modal-button is usually g-inactive.

Table of Map Modal Buttons
g-element	image-ID	resting state	depressed state	
UI-query	Figure of UI-query	Figure of UI-query	Figure of UI-query-depressed


Section - UI anchor elements

An anchor UI-element is a kind of UI-element.

An anchor UI-element has a number called the horizontal margin. The horizontal margin is usually 999.
An anchor UI-element has a number called the vertical margin. The vertical margin is usually 999.

An anchor UI-element can be center-positioned, right-positioned, or left-positioned (this is its horizontal-positioning property).
An anchor UI-element can be bottom-positioned, central-positioned, or top-positioned (this is its vertical-positioning property).


Section - The UI frame

[The UI-frame is a framing element for the buttons that do the actual work. However, we use it as a hook on which to hang spacing and other information, and we also use it as a means to calculate the width and height of the UI elements taken together. It must be represented by a PNG file from which the width and height can be read.] 

The UI-frame is an anchor UI-element.
The image-ID is usually Figure of UI-frame.


Section - The query explanatory text object

The UI-query-explanation is an anchor UI-element.
The image-ID is usually Figure of UI-query-explanation. The display status is usually g-inactive.

The UI-query-explanation has a number called the maximum display-count. The maximum display-count is usually 999.
The UI-query-explanation has a number called the display-count. The display-count is 0.

The UI-query-explanation can be g-persistent.


Section - UI-frame offsets

[The UI-frame offsets are pairs of numbers that give the left and top offsets from the frame or previous element for each of the UI buttons that will displayed within it.]

The UI-frame has a list of numbers called the UI-frame offsets. The UI-frame offsets are {
4, 4,[zoom in]
23, 4,[zoom out]
43, 6[query]
}


Section - UI logic

[The UI logic rules are used to decide which state should be shown for each button, and whether it should be clickable.]

The UI logic rules are an object-based rulebook.

UI logic rule for UI-zoom-in:
	if current zoom level of the map-renderer < the number of entries of the zoom-level set of the associated tileset of the map-renderer:
		activate graphlink for UI-zoom-in;
		change the image-ID of UI-zoom-in to the resting state of UI-zoom-in;
	otherwise:
		deactivate graphlink for UI-zoom-in;
		change the image-ID of UI-zoom-in to the inactive state of UI-zoom-in.
	
UI logic rule for UI-zoom-out:
	if current zoom level of the map-renderer > 1:
		activate graphlink for UI-zoom-out;
		change the image-ID of UI-zoom-out to the resting state of UI-zoom-out;
	otherwise:
		deactivate graphlink for UI-zoom-out;
		change the image-ID of UI-zoom-out to the inactive state of UI-zoom-out.

[UI logic rule for UI-query:
	if the current map label is display-active:
		change the image-ID of UI-query to the depressed state of UI-query;
	otherwise:
		change the image-ID of UI-query to the resting state of UI-query.]
	

Section - Element scaling for UI elements

[The first rule bypasses the standard g-element scaling rule, which automatically scales the origin of an element to the window. Because we are calculating the origins of UI-elements based on the window itself, we have no need to scale. The second rule rule provides a handy place to do these calculations. The third rule arranges the buttons on the frame, based on the position of the frame as calculated by the second rule.]
	
An element scaling rule for an anchor UI-element (called the current-element) (this is the anchor placement rule):
	if the current-element is right-positioned:
		change entry 1 of the origin of the current-element to the width of the current window - (image-width of image-ID of current-element + horizontal margin of current-element);
		[say "Calculated: [entry 1 of the origin of the current-element].";]
	if the current-element is left-positioned:
		change entry 1 of the origin of the current-element to horizontal margin of current-element;
	if the current-element is center-positioned:
		change entry 1 of the origin of the current-element to the (width of the current window - image-width of image-ID of current-element) / 2;
		[say "[current-element]: Width of window: [width of current window]; image: [image-width of image-ID of current-element]; horizontal margin: [horizontal margin of current-element].";]
	if the current-element is top-positioned:
		change entry 2 of the origin of the current-element to vertical margin of current-element;
	if the current-element is bottom-positioned:
		change entry 2 of the origin of the current-element to the height of the current window - (image-height of image-ID of current-element + vertical margin of current-element);
		[say "[current-element]: Height of window: [height of current window]; image: [image-height of image-ID of current-element]; vertical margin: [vertical margin of current-element].";]
	if the current-element is central-positioned:
		change entry 2 of the origin of the current-element to the (height of the current window - image-height of image-ID of current-element) / 2;
	[say "[current-element] is placed at [origin of current-element].";]
	continue.

Last element scaling rule for the UI-frame (this is the UI-frame arranging rule):
	let instance be 0;
	repeat with current-element running through display-active UI-buttons:
		increase instance by 1;
		change entry 1 of the origin of current-element to (entry 1 of the origin of the UI-frame) + (entry instance of the UI-frame offsets of the UI-frame);
		increase instance by 1;
		change entry 2 of the origin of current-element to (entry 2 of the origin of the UI-frame) + (entry instance of the UI-frame offsets of the UI-frame);
	exit.
	
Last element scaling rule for a UI-element (this is the UI element scaling rule):
	do nothing;
	exit.
	

Section - Element drawing rules for UI elements

An element display rule for an anchor UI-element (called the current-element):
	display (image-ID of current-element) in the current window at (origin of current-element);
	#if utilizing Glimmr debugging;
	say "[>console][GLAM]Drawing anchor UI-element [i][current-element][/i] ([image-ID of current-element]) at origin ([entry 1 of the origin of current-element],[entry 2 of the origin of the current-element]).[<]";
	#end if;
	
An element display rule for a UI-button (called the pressee):
	follow the UI logic rules for the pressee;
	display (image-ID of pressee) in the current window at (origin of pressee);
	set a graphlink in the current window identified as pressee from (entry 1 of the origin of pressee) by (entry 2 of the origin of the pressee) to (entry 1 of the origin of pressee plus the image-width of the image-ID of pressee) by (entry 2 of the origin of pressee plus the image-height of the image-ID of pressee) as the linked action of the pressee;
	#if utilizing Glimmr debugging;
	say "[>console][GLAM]Drawing UI-button [i][pressee][/i] ([image-ID of pressee]) at origin ([entry 1 of the origin of pressee],[entry 2 of the origin of the pressee]). Graphlink set from ([entry 1 of the origin of pressee],[entry 2 of the origin of the pressee]) to ([entry 1 of the origin of pressee plus the image-width of the image-ID of pressee],[entry 2 of the origin of pressee plus the image-height of the image-ID of pressee])[if the linked action of the pressee is a stored action]: [i][linked action of the pressee][/i][end if].[<]";
	#end if;
	

Section - Animations for button response

A glulx timed activity rule (this is the redraw button from timer rule):
	stop the timer;
	follow the window-drawing rules for the assigned window of the current graphlink.
	
To revert the/-- button/-- after (T - a real number) second/seconds:
	(- glk_request_timer_events({T}/10);  -)
	
To stop the/-- timer:
	(- glk_request_timer_events(0); -)


[Section - Optional undo control (for use with Undo Output Control by Erik Temple)

[This section can be uncommented should you wish to add buttons to your game that actually cause a turn to pass—none of the buttons as defined by default result in that.]

[The timer introduces a certain wild-card element. The upshot is that, when we undo, the events that happen after the timer fires are not "remembered"--so, the state of the button will still be active after we undo, and the timer event will not fire. The after undoing an action rule here requests the timer event immediately after undoing, so that the button will return to its initial state as needed. This has the added benefit of indicating to the player exactly what is being reconstructed after UNDO, the pressing of the button. This is rather primitive, in that the timer event is requested no matter the situation (i.e, regardless of whether the last turn involved a button press; however, things are structured so that this is harmless.]

After undoing an action:
	revert the button after 0.1500 seconds;]


Glimmr Automap ends here.

---- DOCUMENTATION ----

Chapter: About Glimmr Automap

Glimmr Automap is, unlike most other Glimmr extensions, a solution rather than a framework. It provides a graphical map that draws a flowchart-style map to a graphics window, adding rooms dynamically to the map as the player discovers the world. Glimmr Automap (GLAM) is a graphical frontend for Mark Tilford's Automap extension, displaying the map data generated by that extension using a graphical tileset, supplied as the Glimmr Automap Tileset extension. Users may also supply their own tilesets.

Glimmr Automap also provides easily configured user-interface elements for interacting with the map, including to zoom in and out using onscreen buttons, to click on rooms on the map to identify them onscreen, and more.

Glimmr Automap is primarily designed for use with Glulx interpreters that support graphics windows, but it will fall back to an ASCII (or Unicode) map on text-only interpreters, using the interface provided by Mark Tilford's Automap.

The extension requires most of the other Glimmr extensions in order to function, including Glimmr Canvas-Based Drawing, Glimmr Drawing Commands, and Glimmr Graphic Hyperlinks. Also required are Glimmr's dependencies, including Flexible Windows by Jon Ingold and Fixed Point Maths by Michael Callaghan.


Section: A note on terminology

Through the course of this documentation, Glimmr Automap will be referred to either using its full name, or the abbreviation "GLAM". Mark Tilford's Automap extension—the engine that actually supplies the map data—will be referred to as "Automap" or "Mark Tilford's Automap".


Chapter: Including Glimmr Automap in a project

Inform remains fairly unsophisticated in its mechanisms for organizing included extensions. When we are dealing with a complex system of modular extensions such as Glimmr, it is very easy to trip it up, and the result is usually a list of unhelpful errors. For this reason, each Glimmr extension includes a section--such as this one--about how to include it, particularly in relation to other extensions.

Glimmr Automap should be included before any font or tileset extensions, e.g.:

	Include Glimmr Automap by Erik Temple.
	Include Glimmr Automap Tileset by Erik Temple.

You should not include Flexible Windows, Fixed Point Maths, Glimmr Drawing Commands, or Glimmr Canvas-Based Drawing in your project; these are included automatically, as is Mark Tilford's Automap.


Chapter: Basic usage

Glimmr Automap renders the map data generated by Automap using a set of images defined by a "tileset." Tilesets are packaged as extensions, and Glimmr Automap Tileset is provided as part of Glimmr. Note that GLAM will not run without a tileset extension! 

At its most basic, adding Glimmr Automap to your story involves just two steps:

	1. Include the extension and a tileset extension.
	2. Create a "map-display window" and an accompanying canvas.

The first step is simple. Unless we are using an alternate tileset, we can include this at the top of our story file:

	*: Include Glimmr Automap by Erik Temple.
	Include Glimmr Automap Tileset by Erik Temple.

We must copy the image files for the Glimmr Automap user interface into the Materials->Figures folder of our Inform project, as well as the images for our tileset. See Chapter 22 of Writing with Inform for more information on using images.

We may easily incorporate the "querying" functionality—which allows the player to click on a room in the map to reveal the room name in a tooltip—by including Glimmr Bitmap Font:

	*: Include Glimmr Bitmap Font by Erik Temple.

Glimmr Automap defines a new kind of graphics g-window, the "map-display window". The automap will only appear in a map-display window. You will need to create your own map-display window and define its basic characteristics (see the Flexible Windows extension for more on windows). This code will open a window with a black background above the main text window:

	*: The map-window is a map-display window spawned by the main-window. The position is g-placeabove.

We also need to associate a canvas with our window (see the docs for Glimmr Canvas-Based Drawing for more on canvases):

	*: The map-canvas is a g-canvas. The associated canvas of the map-window is the map-canvas.

If we have no other graphics windows or graphic elements, this will be enough. If we do have our own g-elements, however, we will need to specify which ones belong on our automap canvas:

	*: The associated canvas of the map-renderer is the map-canvas. The associated canvas of a UI-element is the map-canvas.

This is all that is required to get a fully functioning graphical automap into our game, including a set of zoom buttons. The following sections will dive into options for customizing and configuring GLAM.


Chapter: The query functionality

As mentioned above, GLAM can print the name of a room to the graphics window in the style of a tooltip when the player clicks said room on the map. This is known as the "query" function. 


Section: Querying the room name

As mentioned above, the easiest way to enable the room-querying functionality is to include the Glimmr Bitmap Font extension. This will render the room name using the Glimmr Bitmap Font. We can, however, display the name in any font we like by changing the "current map label" variable. For example, if we wanted to use Glimmr Image Font to render the map label instead, we would do something like this:

	*: Include Glimmr Image Font by Erik Temple.

	The current map label is the image automap label.

	The image automap label is an image-rendered string. The background tint is g-Yellow. The display-layer is 2. The display status is usually g-inactive. The associated font is Glimmr Lucidex. The scaling factor is 0.4000.

It is also possible to change the look of the tooltip even when we are using Glimmr Bitmap Font. To change the text and tooltip colors, for example, we might set the tint and background tint properties of the "bitmap automap label" g-element:

	The background tint of the bitmap automap label is g-Blue. The tint of the bitmap automap label is g-White.


Section: The query explanation

The existence of the query functionality will not be obvious to players unless we tell them about it. We can do this in our source text, but GLAM also includes a means for us to display this information to the player within the graphics window, via the g-element known as the "UI-query-explanation". This element is not displayed by default. To turn it on, we paste the following into our source text:

	*: The display status of the UI-query-explanation is g-active.

A text will appear above the UI frame that says "Click to identify a room". This text is completely hardcoded—to change the text or the color, we need to create a new PNG image for it. (The reason for this is speed—rendered strings may be slow on some machines/interpreters, and it is best to limit their use.)

By default, the UI-query-explanation element will be shown only until the player clicks on a room. If we prefer to show the explanation through the entire course of the game, we can add the following to our source text:

	*: The UI-query-explanation is g-persistent.

We can move the query explanation text around the screen in the same way as we do the UI frame (see below).



Section: Disabling query functionality

It may be that we don't want to offer the ability to query the map. To disable the feature completely, employ a use option:

	*: Use no query functionality.


Chapter: Customizing the user interface

By default, Glimmr Automap places a small toolbar at the bottom of the window, containing + and - buttons for zooming in and out. This toolbar can be easily moved or removed. (We can also add your own buttons or remove the + and - buttons, but this is beyond the scope of this documentation; you should be able to figure out how to make the changes you need by studying the source code. You may need to familiarize yourself with the workings of Glimmr Canvas-Based Drawing first, however.) 

GLAM also provides a few commands for the player, such as zooming and opening/closing the map window. The game's responses to these commands can also be customized.


Section: Changing the zoom levels of the map

Any tileset that is intended for use with Glimmr Automap should provide a list of the zoom levels at which the author believes the tileset looks best. This is the tileset's "zoom-level set." Each zoom level is represented by a ratio (given as a fixed-point decimal fraction, always written to the fourth decimal place). Here is the zoom-level set for the Glimmr Automap Tileset:

	{0.3600, 0.5600, 0.8000, 1.0000}

If we don't like these zoom levels, however, we are free to change them. Glimmr Automap will deal intelligently with whatever we provide, but we must always have at least one level in the list. So, for example, if we want just two levels, we might cut the list down:

	The zoom-level set of the Glimmr Automap Tileset is {0.5600, 1.0000}.

Zoom levels should increase from left to right. In-game, pressing the + button really means "move one step to the right in the zoom-level set," while the - button means "move one step to the left".

We can specify which zoom level the game should start out at by setting the "initial zoom level" of the tileset. This is a number that represents the entry of the zoom-level set that we want to begin the game at. By default Glimmr Automap Tileset begins at zoom level 2 (0.5600, or 56% of full size). To change this, we can add something like this to our story file:

	The initial zoom level of the Glimmr Automap Tileset is 1.



Section: Customizing the position of the UI frame and the query explanation

The toolbar that surrounds the zoom buttons is called the "UI-frame." It is a special g-element (of the kind "anchor UI-element," which is also the kind of the UI-query-explanation; see above). The UI-frame is positioned by default in the bottom center of the map window, but there are nine possible positions, defined by the "horizontal-positioning" and "vertical-positioning" properties. We can move either the query explanation or the UI frame around the window by changing these positionings, as well as tweaking margins (see below).

The positionings are:

	horizontally: left-positioned / center-positioned / right-positioned
	vertically: top-positioned / central-positioned / bottom-positioned

So, if we wanted to move the frame to the upper left of the map window, we'd type something like this:

	The UI-frame is top-positioned and left-positioned.


We can further tweak the positioning by setting the margins. The margin is the horizontal or vertical distance (in pixels) between the nearest edge of the window and the UI frame. So, if we want to move the UI frame farther from the bottom of the screen, we might type:

	The vertical margin of the UI-frame is 50.

This will place the UI-frame so that 50 pixels separate it from the bottom of the map window, rather than the default 5.

Note that there will be no effect is we try to change the horizontal margin of a center-positioned anchor element, or the vertical margin of a central-positioned one: the element must be anchored to an edge of the window for the margin value to be meaningful.


Section: Removing the frame altogether

Removing the frame altogether is simple. Declare the UI-frame object to be display-inactive, and neither it nor the buttons it contains will be shown:

	*: The display status of the UI-frame is g-inactive.


Section: Changing action messages

GLAM includes a number of actions (most of them actually reimplementations of actions defined in Automap), all of which may print both success and failure messages. These messages can be changed by writing new "to say" phrases for them. For example, to change the message that is printed when the map window is opened, write this:

	To say map-window-open:
		say "You give some thought to the lay of the land, calling up a mental image of all you have seen so far."

Note that any such phrases you include in your story file must be placed *after* the line that includes Glimmr Automap.

Here is a list of all of the message names and their default texts:

	only-one-graphical-zoom-level
		"Zooming the map is not allowed.[run paragraph on][line break]"
	zoomed-in
		"Zoomed in to level [current zoom level of the map-renderer] of [number of entries of the zoom-level set of the associated tileset of the map-renderer]."
	zoomed-out
		"Zoomed out to level [current zoom level of the map-renderer] of [number of entries of the zoom-level set of the associated tileset of the map-renderer]."
	zoomed-in-or-out
		"Zoomed to level [current zoom level of the map-renderer] of [number of entries of the zoom-level set of the associated tileset of the map-renderer]."
	map-window-open
		"Map window open."
	map-window-already-open
		"The map window is already open."
	map-window-failed-to-open
		"[line break](Could not open the map window.)"
	map-window-closed
		"Map window closed."
	map-window-already-closed
		"The map window is already closed."



Chapter: Customizing the interface to work with new functionality

We may want to add new functionality to GLAM. For example, rather than showing the name of a room when the player clicks on it, we might want to move the player to that room.

If we do this, though, we may still want to retain the ability to query the map. GLAM provides a feature to allow this. We can add a ? (query) button in the toolbar: when this button is depressed, clicking on a room in the map will display the name of the room. Release the button, and clicking on a room will (say) move the player to it. We can also show the query explanation (see above) when the query button is pressed.

To add the query button to the toolbar, just activate the "UI-query" g-element:

	*: The display status of the UI-query is g-active.

By default, the query explanation text (see above) will be shown every time the query button is pressed, disappearing after the player clicks on a room but reappearing when the query button is pressed again. This is intended to serve as a reminder to the player of the button's function. If we prefer to show the explanation only once, we can change the "maximum display-count" of the query explanation element:

	The maximum display-count of the UI-query-explanation is 1.

The default is the special value 999, which indicates that the text will always be displayed. If we were to use 3, however, the text would disappear for good after the player has queried the map for the third time. A value of 0 means that the explanation will never appear, so to disable the explanation entirely, we can do this:

	*: The maximum display-count of the UI-query-explanation is 0.





Chapter: Notes on the interface with Mark Tilford's Automap



INCORPORATE:
All of the map size setting in Glimmr Automap is done   
"manually" by the extension, for a couple of reasons. Not specifying the   
"use static allocation" option can cause crashes in both Spatterlight and   
Zoom, and because of this, Glimmr Automap sets "use static allocation" by   
default--authors don't have a choice in whether or not they set this   
option. Also, the screen model is a bit more complicated in Glimmr   
Automap, since both tiles and window size can vary: Each time the map is   
updated, Glimmr Automap uses your "reserve automap memory of X rows by Y   
columns" command to resize the map to the available screen-space (up to   
the maximum set by "use automap reserved area"), taking into account both   
the zoomed size of the tiles and the window dimensions. When the zoom   
level changes (changing the displayed size of the tile), or the window is   
resized, the map dimensions are automatically recalculated before the map   
is drawn again. 

INCORPORATE:

Setting the "use automap reserved area" to higher numbers will move the text map (only on text-only interpreters) toward the center of the window; the lower the number, the more toward the right side of the screen it will display.


Section: Zoom levels

Automap provides two zoom levels that actually change the way map data is reported. These are "map zoomed in" and "map zoomed out". Glimmr Automap always uses the "map zoomed in" zoom level. For displaying large maps on screen, however, "map zoomed out" may be faster: Map zoomed in requires 9 tiles to draw each room, whereas map zoomed out uses only 1 tile per room, a significant difference. 

You can use "map zoomed out" in Glimmr Automap with the addition of only a single line:

	*: Last opening up the map window:
		now current zoom is map zoomed out.

However, Automap reuses tile numbers in ways that make the design of the Glimmr Automap Tileset look distinctly subpar when "map zoomed out" is the current zoom. The tile graphics could be modified relatively easily to work the map zoomed out view, if you want to go that route (or you can design your own tiles from scratch). The first step is to explore your map to reveal most of the tiles, then use the DUMP MAP debugging command (see below) to see what the tile numbers are.



Chapter: Debugging

The map-renderer g-element is not an image-map (it reads a different data structure, a flat I6 array rather than an I7 list), but it is very similar in the way it renders a grid of images. For that reason, we provide debugging commands and capabilities analogous to those that Glimmr Canvas-Based Drawing provides for image-maps... 


Section: Contact info

If you have comments about the extension, please feel free to contact me directly at ek.temple@gmail.com.

Please report bugs on the Google Code project page, at http://code.google.com/p/glimmr-i7x/issues/list.

For questions about Glimmr, please consider posting to either the rec.arts.int-fiction newsgroup or at the infiction forum (http://www.intfiction.org/forum/). This allows questions to be public, where the answers can also benefit others. If you prefer not to use either of these forums, you may contact me directly via email (ek.temple@gmail.com).


.........................

If you prefer that the MAP command toggle the ASCII version of the map rather than close the map window entirely, you can paste the following into your story file:

	*: Chapter - Deciding (in place of Chapter - Hacking Automap in Glimmr Automap by Erik Temple)

	First for constructing the status line (this is the bypass status line map rule):
		if glulx graphics is supported and the map-window is g-present:
			fill status bar with table of ordinary status;
			rule succeeds;
		otherwise:
			now current zoom is map zoomed in;
			reserve automap memory of (text-map depth) rows;
			fill status bar with table of ordinary status and map.

You will probaby want to change the default messages for the "map" command as well, since it refers to opening and closing the map window.


Example: * Minimal Automap. This example shows the simplest possible setup for using Glimmr Automap. Basically, this means including the extension and a tileset extension, and then defining and opening up a map-window.

Be sure to use the "opening up the map window rules" or to otherwise protect the phrase for opening your graphics window; if you don't, your game will not open in text-only interpreters.

To see how the map will look on text-only interpreters, add the line:

	Release along with the "Quixe" interpreter.

to the source code and press the "Browse" button in the results panel after compilation. Check out Mark Tilford's Automap extension for settings and commands that apply only in text interpreters.

	*: "Minimal Automap"

	Include Glimmr Automap by Erik Temple.
	Include Glimmr Automap Tileset by Erik Temple.

	Cavern is a room. North of Cavern is Cave. South of Cavern is Deep Tunnel. Down from Deep Tunnel is Pit. Southeast of Deep Tunnel is Underground Lake.

	Outside from Cave is Cliffside. East of Cliffside is Foothills.

	The player is in Foothills.


	Chapter - Map window

	The map-window is a map-display window spawned by the main-window. The position is g-placeabove. The measurement of the map-window is 50. The associated canvas of the map-window is the map-canvas.

	The map-canvas is a g-canvas. [The associated canvas of a g-element is the map-canvas.]

	When play begins:
		follow the opening up the map window rules.[ [or:]
		open up the map viewport; [or:]
		if glulx graphics is supported, open up the map-window]


Example: *** Automap with Localized Compass Rose. This example shows how we can add new graphlinking functionality to the map. We may want to take advantage of the fact that the map indicates exits from the player's location to use them as a kind of compass rose, allowing us to click on the paths out of the room to go in the indicated direction (thanks to Jon Ingold for suggesting this idea.)

We do this by setting a special graphic hyperlink over the tiles that depict exits from the room occupied by the player. We use a table (the Table of Directional Correspondences) to match the appropriate direction to the tile number. We will set a graphic hyperlink using the name of the direction itself as the link identifier, and then convert this direction into a replacement command after the link has been clicked.

We begin by altering the map-renderer element itself, substituting a new rule for the extension's map-renderer display rule. This rule is essentially a copy of the map-renderer display rule. We change only the last few lines, where the graphlink is set. If the current tile number is found in the Table of Directional Correspondences, we set a directional hyperlink. If the current tile number is not in the table, then we either set no link or, if the tile number corresponds to part of a room, we set a hyperlink to the room.

The Table of Directional Correspondences includes only directional links from the player's current location, in other words, those referred to be the Automap extension as "full".

	*: "Automap with Localized Compass Rose"

	The map-renderer plus internal compass rule is listed before the map-renderer display rule in the element display rules.

	An element display rule for the map-renderer (this is the map-renderer plus internal compass rule):
		let tilesetting be the associated tileset of map-renderer;
		let scan be 0;
		let row be the win-y of the map-renderer;
		let column be the win-x of the map-renderer;
		let xx be the tile-width of the tilesetting * scaling factor of the current window as an integer;
		let yy be the tile-height of the tilesetting * scaling factor of the current window as an integer;
		[say "Scaling: [xx] by [yy].";]
		unless the background tint of the map-renderer is g-placenullcol:
			dimrectdraw (color background tint of the map-renderer) in (the current window) at (column) by (row) with dimensions (map-width of map-renderer * scaling factor of the current window as an integer) by (map-height of map-renderer * scaling factor of the current window as an integer);
		unless using the no post-processing option:
			follow the automap post-processing rules;
		repeat with count running from 1 to (map height * map width):
			increase scan by 1;
			if scan > map width:
				increase row by yy;
				change column to the win-x of the map-renderer;
				let scan be 1;
			let V be the map glyph of count;
			if there is a char of V in the translation-table of the tilesetting:
				choose row with a char of V in the translation-table of the tilesetting;
				let the current tile be tile entry;
				drscimage (current tile) in (current window) at (column) by (row) with dimensions (xx) by (yy);
				if the graphlink status of the map-renderer is g-active:
					if there is a char of V in the Table of Directional Correspondences:
						choose row with a char of V in the Table of Directional Correspondences;
						set a graphlink in the current window identified as dir entry from column by row to (column + xx) by (row + yy) as "", ignoring redundant links;
						#if utilizing the image-map graphlink preview option;
						boxdraw (color graphlink preview color) in (current window) from (column) by (row) to (column + xx) by (row + yy) with 1;
						#end if;
					otherwise if linked room-ID of count > 0:
						set a graphlink in the current window identified as map-renderer from column by row to (column + xx) by (row + yy) as linked room-ID of count, ignoring redundant links;
						#if utilizing the image-map graphlink preview option;
						boxdraw (color graphlink preview color) in (current window) from (column) by (row) to (column + xx) by (row + yy) with 1;
						#end if;
			increase column by xx;
	
	An automap graphlink rule for a direction (called the way):
		let current-direction be indexed text;
		let current-direction be "[way]";
		let current-direction be "[current-direction in upper case]";
		now glulx replacement command is "[current-direction]";
		exit.


	Table of Directional Correspondences
	Char	Dir
	59	north
	60	south
	61	east
	62	west
	67	southwest
	68	northwest
	69	northeast
	70	southeast
