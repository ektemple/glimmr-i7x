Version 1/100206 of Glimmr Automap (for Glulx only) by Erik Temple begins here.

[Bug: It seems as though the zoom and query buttons can stop working--ran into this running the example in the prerelease OS X build of Gargoyle.]
[Documentation and perhaps code: For terps that don't support graphics, provide a global variable to use to specify the depth of the map in the status line.]
[Documentation: If used, Glimmr Text-Painting Elements and Glimmr Bitmap Font must be included before Glimmr Automap and the Glimmr Automap Tileset.]
[Documentation: Explain why we're using a new automap graphlinking rules, rather than use the graphlink processing rules. (It's because we want to be able to use rooms as graphlink targets as well.)]

Include version 3 of Automap by Mark Tilford.
Include Glimmr Drawing Commands by Erik Temple.
Include Glimmr Canvas-Based Drawing by Erik Temple.
Include Basic Hyperlinks by Emily Short.
Include Glimmr Graphic Hyperlinks by Erik Temple.


Chapter - Use options

Use no query functionality translates as (- Constant NO_QUERY; -).
Use query explanation translates as (- Constant Q_EXPLAIN; -).
Use no post-processing translates as (- Constant N_POST_PROCESS; -).

Use automap hyperlinks.
Use automap static allocation. [Prevents Spatterlight from crashing when the window is resized.]


Chapter - ASCII map

[If the player's interpreter does not support graphics, the Automap text-based map (ASCII or Unicode) will be shown instead. This map is shown by expanding the number of lines in the status window. We can set the number of lines in the text map by using this variable. The default is 12 rows.]

The text-map depth is a number variable.

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
		if the text-map depth is 0:
			change the text-map depth to 12;
		if the map viewport is the main-window:
			now the map viewport is a random map-display window;
		if using the automap hyperlinks option:
			now the the graphlink status of the map-renderer is g-active;
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
			change the image-ID of the UI-frame to Figure of UI-frame-short;
		if the maximum display-count of the UI-query-explanation is 0:
			change the maximum display-count of the UI-query-explanation to 1.
	

Chapter - Hacking Automap

First for constructing the status line (this is the bypass status line map rule):
	if glulx graphics is supported:
		fill status bar with table of ordinary status;
		rule succeeds;
	otherwise:
		reserve automap memory of (text-map depth) rows.

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

A map-display window is a kind of graphlink g-window.

The map viewport is a g-window that varies. [If the author doesn't explicitly name the map viewport, we will automatically select a map-display window to be the viewport when play begins.]

[The author may provide a maximum map size to use. This refers to the number of *tiles* to be displayed, not the maximum number of pixels, and can be used to restrict the size of the map for either performance or aesthetic reasons. For example, a fixed map size combined with a restricted number of available zoom levels can make it easier to predict the output size of the map.]
A map-display window has a number called the maximum map width. The maximum map width of a map-display window is usually 0.
A map-display window has a number called the maximum map height. The maximum map height of a map-display window is usually 0.


Chapter - Map window management

After constructing the status line (this is the graphic automap updating rule):
	follow the refresh windows rule;
	continue the action.


Chapter - Rules for opening and closing the map window

[We provide these as rules, so that players interested in a more complex system of windows can hook into them more easily. (For example, we might want two map windows on screen at once, one window at a different level of zoom than the other, or we might want to use Automap to display a map of the overall world, while using something like the Room and Dimension extension to render a map of the room itself in another window.]

Section - Opening the map window

The opening up the map window rules are a rulebook.

Last opening up the map window:
	open up the map viewport.
	

Section - Closing the map window

The shutting down the map window rules are a rulebook.

Last shutting down the map window:
	shut down the map viewport.


Chapter - Definition of the tileset kind

A tileset is a kind of thing.

A tileset has a number called the tile-width. The tile-width is usually 0.
A tileset has a number called the tile-height. The tile-height is usually 0.

A tileset has a table-name called the translation-table.

A tileset has a list of real numbers called the zoom-level set. The zoom-level set of a tileset is usually {}.

A tileset has a number called the initial zoom level. The initial zoom level of a tileset is usually 1.


Chapter - The map-renderer object

[The sole reason for the existence of the renderer kind is to hang the background color property on.]
A procedural renderer is a kind of g-element. A procedural renderer has a glulx color value called the background tint. The background tint of a procedural renderer is usually g-placenullcol.

The map-renderer is a procedural renderer. 

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
	continue the action.
	
For scaling a map-display window (called the viewport) (this is the resize canvas to map rule):
	let scaled tile-width be (tile-width of associated tileset of the map-renderer * arbitrary scaling factor of the viewport) as an integer;
	let scaled tile-height be (tile-height of associated tileset of the map-renderer * arbitrary scaling factor of the viewport) as an integer;
	[say "Window measures [width of the viewport] x [height of the viewport].";
	say "Scaled tile measures [scaled tile-width] x [scaled tile-height].";]
	let x-win be the width of the viewport / scaled tile-width;
	let y-win be the height of the viewport / scaled tile-height;
	if maximum map width of the viewport > 0:
		let x-win be MIN (x-win) or (maximum map width of the viewport);
	if maximum map height of the viewport > 0:
		let y-win be MIN (y-win) or (maximum map height of the viewport);
	[say "x-win: [x-win] (maximum: [maximum map width of the viewport]).";
	say "y-win: [y-win] (maximum: [maximum map height of the viewport]).";]
	reserve automap memory of y-win rows by x-win columns;
	if the map is drawn and the current zoom is not map absent:
		do nothing;[Automap's map is drawn by the phrase "if the map is drawn"; hence this odd instruction.]
	[say "Map measures [map width] x [map height] tiles.";]
	change the map-width of the map-renderer to (map width * tile-width of associated tileset of the map-renderer);
	change the map-height of the map-renderer to (map height * tile-height of associated tileset of the map-renderer);
	change the canvas-width of the associated canvas of the viewport to map-width of the map-renderer;
	change the canvas-height of the associated canvas of the viewport to map-height of the map-renderer;
	[say "Map measures [map width] x [map height] tiles.";
	say "Canvas measures [canvas-width of the associated canvas of the map-renderer] x [canvas-height of the associated canvas of the map-renderer].";]
	continue the action;
	

Chapter - Element display rule for the map-renderer

An element display rule for the map-renderer when the location is unmappable (this is the unmappable room rule):
	exit.

An element display rule for the map-renderer (this is the map-renderer display rule):
	[say "Drawing.";]
	let tilesetting be the associated tileset of map-renderer;
	let scan be 0;
	let row be the win-y of the map-renderer;
	let column be the win-x of the map-renderer;
	let xx be the tile-width of the tilesetting * scaling factor of the current window as an integer;
	let yy be the tile-height of the tilesetting * scaling factor of the current window as an integer;
	[say "Scaling: [xx] by [yy].";]
	unless the background tint of the map-renderer is g-placenullcol:
		draw a rectangle (color background tint of the map-renderer) in (the current window) at (column) by (row) with dimensions (map-width of map-renderer * scaling factor of the current window as an integer) by (map-height of map-renderer * scaling factor of the current window as an integer);
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
			[say "([column], [row]): [current tile].";]
			drscimage (current tile) in (current window) at (column) by (row) with dimensions (xx) by (yy);
			if using the automap hyperlinks option:
				unless linked room-ID of count is 0:
					set a graphlink in the current window identified as map-renderer from column by row to (column + xx) by (row + yy) as linked room-ID of count, ignoring redundant links;
		increase column by xx;
		

Chapter - Post-processing of map data

[The automap post-processing rules are provided as a hook to any post-processing we may want to do of the map data. By default, we repair corner tiles here by filling in the gaps of diagonals with small tiles. If post-processing is not desired, we can compile using the no post-processing option.]

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
	[say "Click: [current graphlink x], [current graphlink y].";]
	repeat through the Table of Graphlink Glulx Replacement Commands in reverse order:
		if the current graphlink window is g-win entry:
			if the current graphlink x >= p-left entry and the current graphlink x <= p-right entry and the current graphlink y >= p-top entry and the current graphlink y <= p-bottom entry:
				now glulx replacement command is "";
				change the current graphlink to linkid entry;
				if there is an alt entry:
					follow the automap graphlink rules for the glulx equivalent of alt entry;[the glulx equivalent is a type-casting routine provided by the Automap extension. It returns a room.]
				otherwise:
					follow the automap graphlink rules for the current graphlink;
				rule succeeds;
				
A clicking graphlink rule when the current graphlink window is a map-display window (this is the automap background graphlinking rule):
	unless using the no query functionality option:
		deactivate the current map label;
		change the image-ID of UI-query to the resting state of UI-query;
		deactivate UI-query-explanation;
		follow the refresh windows rule;
		rule succeeds;
	rule fails.
				

Chapter - The automap graphlink rulebook

The automap graphlink rules are an object-based rulebook.
The automap graphlink rules have outcomes exit (success - the default) and continue (no outcome).

The current map label is a g-element variable.


Section - Clicking a button

First automap graphlink rule for the UI-query (this is the query button management rule):
	if the image-ID of the UI-query is the depressed state of UI-query:
		change the image-ID of UI-query to the resting state;
		deactivate the UI-query-explanation;
	otherwise:
		change the image-ID of UI-query to the depressed state;
		if using the query explanation option and the display-count of UI-query-explanation < maximum display-count of UI-query-explanation:
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

Automap graphlink rule for a room (called the target) when not using the no query functionality option (this is the display queried room name rule):
	if UI-query is display-active and the image-ID of UI-query is not the depressed state of UI-query:[if we're using the query button, we only want the action to proceed when the button is in its depressed state. Otherwise, we drop through to the author's rule.]
		continue;
	change the text-string of the current map label to the printed name of the target;
	change the origin of the current map label to the grid equivalent of the screen coordinates (current graphlink x) by (current graphlink y) of (current graphlink window);
	activate the current map label;
	deactivate the UI-query-explanation;
	follow the refresh windows rule;
	deactivate the current map label.


Chapter - Popup room labels (for use with Glimmr Bitmap Font by Erik Temple)

The current map label is the bitmap automap label.

The bitmap automap label is a bitmap-rendered string. The tint is g-black. The background tint is g-yellow. The display-layer is 2. The display status is g-inactive. The associated font is Glimmr C&C.


Chapter - New functionality for Automap verbs

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
		say "Zoomed in to level [current zoom level of the map-renderer] of [number of entries of the zoom-level set of the associated tileset of the map-renderer]."
		

Section - Zooming out

Carry out zooming out when glulx graphics is supported:
	if the map viewport is g-unpresent:
		try opening the map window;
	if the map viewport is g-present:
		if current zoom level of the map-renderer > 1:
			decrease current zoom level of the map-renderer by 1;
	otherwise:
		say "[line break](Could not open the map window.)";
	rule succeeds.
	
Report zooming out when glulx graphics is supported:
	unless the command is mouse-generated:
		say "Zoomed out to level [current zoom level of the map-renderer] of [number of entries of the zoom-level set of the associated tileset of the map-renderer]."
		

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
		say "[line break](Could not open the map window.)";
	rule succeeds.
		
Report graphic zoom toggling when glulx graphics is supported:
	unless the command is mouse-generated:
		say "Zoomed to level [current zoom level of the map-renderer] of [number of entries of the zoom-level set of the associated tileset of the map-renderer]."
		

Section - Opening the map window

Opening the map window is an action out of world applying to nothing. Understand "map" or "open map" or "open map window" as opening the map window when glulx graphics is supported and when the map viewport is g-unpresent.

Understand "open map" or "open map window" as a mistake ("The map window is already open.") when glulx graphics is supported and when the map viewport is g-present.

Carry out opening the map window when glulx graphics is supported and when the map viewport is g-unpresent:
	say "Opening map window.";
	now current zoom is map zoomed in;
	follow the opening up the map window rules.
	

Section - Closing the map window

Understand "map" or "close map" or "close map window" as zooming away when glulx graphics is supported and when the map viewport is g-present.

Carry out zooming away when glulx graphics is supported and when the map viewport is g-present:
	say "Closing map window.";
	now current zoom is map absent;
	follow the shutting down the map window rules;
	rule succeeds.

Understand "close map" or "close map window" as a mistake ("The map window is already closed.") when glulx graphics is supported and when the map viewport is g-unpresent.
	

Section - Error message for using unsupported Automap commands

Understand "map unicode" or "map fancy" or "map font 3" or "map beyond zork" or "map simple/ascii/plain" or "gargoyle bug workaround" or "map auto" or "map [text]" as a mistake ("(You can ZOOM IN, ZOOM OUT, or type MAP to toggle the map window.)") when glulx graphics is supported.


Chapter - Debugging (not for release) (for use with Permanent Debugging by Erik Temple)

Dumping automap data is an action out of world applying to nothing. Understand "automap dump" or "dump map" or "dump automap" as dumping automap data. Understand "map dump" as dumping automap data when glulx graphics is supported.

Carry out dumping automap data:
	say "Map measures [map width] by [map height], totalling [map height * map width] tiles.[line break]Window measures [width of the assigned window of the map-renderer] x [height of the assigned window of the map-renderer].[line break]Scaled tile measures [tile-width of associated tileset of the map-renderer * arbitrary scaling factor of the assigned window of the map-renderer] x [tile-height of associated tileset of the map-renderer * arbitrary scaling factor of the assigned window of the map-renderer].[line break]Canvas measures [canvas-width of the associated canvas of the map-renderer] x [canvas-height of the associated canvas of the map-renderer].";
	say "Dump of automap data:[paragraph break]";
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
	
Dumping automap links is an action out of world applying to nothing. Understand "automap links dump" or "dump links" or "dump automap links" as dumping automap links. Understand "map link dump" as dumping automap links when glulx graphics is supported.

Carry out dumping automap links:
	say "Map measures [map width] by [map height], totalling [map height * map width] tiles.[line break]Window measures [width of the assigned window of the map-renderer] x [height of the assigned window of the map-renderer].[line break]Scaled tile measures [tile-width of associated tileset of the map-renderer * arbitrary scaling factor of the assigned window of the map-renderer] x [tile-height of associated tileset of the map-renderer * arbitrary scaling factor of the assigned window of the map-renderer].[line break]Canvas measures [canvas-width of the associated canvas of the map-renderer] x [canvas-height of the associated canvas of the map-renderer].";
	say "Dump of automap hyperlink data:[paragraph break]";
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

The UI-layer is a number that varies. The UI-layer is 4. 


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

[The UI-frame is just a framing element for the buttons that do the actual UI work. However, we use it as a hook on which to hang spacing and other information, and we also use it as a means to calculate the width and height of the UI elements taken together. It could be marked display-inactive and it would still do its duty; in other words, it can be invisible and still work. However, it does not to be represented by a PNG file from which the width and height can be read.] 

The UI-frame is an anchor UI-element.
The image-ID is Figure of UI-frame.


Section - The query explanatory text object

The UI-query-explanation is an anchor UI-element.
The image-ID is Figure of UI-query-explanation. The display status is g-inactive.

The UI-query-explanation has a number called the maximum display-count.
The UI-query-explanation has a number called the display-count. The display-count is 0.


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
	display (image-ID of current-element) in the current window at (origin of current-element).
	
An element display rule for a UI-button (called the pressee):
	[say "Displaying [pressee] at [origin of pressee].";]
	follow the UI logic rules for the pressee;
	display (image-ID of pressee) in the current window at (origin of pressee);
	set a graphlink in the current window identified as pressee from (entry 1 of the origin of pressee) by (entry 2 of the origin of the pressee) to (entry 1 of the origin of pressee plus the image-width of the image-ID of pressee) by (entry 2 of the origin of pressee plus the image-height of the image-ID of pressee) as the linked action of the pressee;
	

Section - Animations for button response

A glulx timed activity rule (this is the redraw button from timer rule):
	stop the timer;
	follow the window-drawing rules for the assigned window of the current graphlink.
	
To revert the/-- button/-- after (T - a real number) second/seconds:
	(- glk_request_timer_events({T}/10);  -)
	
To stop the/-- timer:
	(- glk_request_timer_events(0); -)


Section - Optional undo control (for use with Undo Output Control by Erik Temple)

[The timer introduces a certain wild-card element. The upshot is that, when we undo, the events that happen after the timer fires are not "remembered"--so, the state of the button will still be active after we undo, and the timer event will not fire. The after undoing an action rule here requests the timer event immediately after undoing, so that the button will return to its initial state as needed. This has the added benefit of indicating to the player exactly what is being reconstructed after UNDO, the pressing of the button. This is rather primitive, in that the timer event is requested no matter the situation (i.e, regardless of whether the last turn involved a button press; however, things are structured so that this is harmless.]

After undoing an action:
	revert the button after 0.1500 seconds;


Glimmr Automap ends here.

---- DOCUMENTATION ----

Example: *** Localized compass rose. This example shows how we can add new graphlinking functionality to the map. We may want to take advantage of the fact that the map indicates exits from the player's location to use them as a kind of compass rose, allowing us to click on the paths out of the room to go in the indicated direction (thanks to Jon Ingold for suggesting this idea.)

We do this by setting a special graphic hyperlink over the tiles that depict exits from the room occupied by the player. We use a table (the Table of Directional Correspondences) to match the appropriate direction to the tile number. We will set a graphic hyperlink using the name of the direction itself as the link identifier, and then convert this direction into a replacement command after the link has been clicked.

We begin by altering the map-renderer element itself, substituting a new rule for the extension's map-renderer display rule. This rule is essentially a copy of the map-renderer display rule. We change only the last few lines, where the graphlink is set. If the current tile number is found in the Table of Directional Correspondences, we set a directional hyperlink. If the current tile number is not in the table, then we either set no link or, if the tile number corresponds to part of a room, we set a hyperlink to the room.

The Table of Directional Correspondences includes only directional links from the player's current location, in other words, those referred to be the Automap extension as "full".

	*: "Localized compass rose"

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
			draw a rectangle (color background tint of the map-renderer) in (the current window) at (column) by (row) with dimensions (map-width of map-renderer * scaling factor of the current window as an integer) by (map-height of map-renderer * scaling factor of the current window as an integer);
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
				if using the automap hyperlinks option:
					if there is a char of V in the Table of Directional Correspondences:
						choose row with a char of V in the Table of Directional Correspondences;
						set a graphlink in the current window identified as dir entry from column by row to (column + xx) by (row + yy) as "", ignoring redundant links;
					otherwise if linked room-ID of count > 0:
						set a graphlink in the current window identified as map-renderer from column by row to (column + xx) by (row + yy) as linked room-ID of count, ignoring redundant links;
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
