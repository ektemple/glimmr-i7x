Version 1/091205 of Glimmr Canvas-Based Drawing (for Glulx only) by Erik Temple begins here.
[Fix section numbering]
Part 0 - PreliminariesSection - Inclusions

Include version 9 of Flexible Windows v9 by Jon Ingold.
Include version 3 of Fixed Point Maths by Michael Callaghan.Include Glimmr Drawing Commands by Erik Temple.
Section - Use optionsUse asymmetrical scaling translates as (- Constant ASYM_SCALING; -).

Use MAX_STATIC_DATA of 1000000.Section - New kinds of valueA g-activity is a kind of value. The g-activities are g-active and g-inactive.

The specification of g-activity is "The g-activity is a simple binary value that is used to define whether a property of a g-element is active or inactive. A g-element can have an active display status, or an active graphlink status."[Section - Console settings[This is a macro that allows the extension to identify itself in the Glimmr console window with fewer keystrokes on my part.]To say CBD:	say "[bracket]Glimmr CBD[close bracket]: ".]Part - CanvasA g-canvas is a kind of thing.The specification of g-canvas is "A canvas (spelled g-canvas is I7 to avoid namespace clashes) is a construct that represents a surface on which images, graphic primitives, and other graphic elements can be displayed. The canvas is displayed in (framed by) a graphics window. At heart, it represents the coordinate system of a series of elements, which will be translated to the associated graphics window (g-window). The author can either specify the dimensions of a canvas directly, using the canvas-width and canvas-height properties, or can declare a 'background image' for the canvas. The dimensions of the background image will define the size of the canvas. (If we like, we can set the canvas-width and canvas-height properties after declaring the background image; this will cause the background image to be stretched to fit the new dimensions.) The precise display of a canvas is largely controlled by the window that frames it. By default, a canvas will be centered in the window and, if necessary, will be scaled down to fit in the window frame. However, it is possible to scale the canvas at an arbitrary ratio, as well as to change the framing by changing the origin point (in canvas coordinates) of the window frame."A g-canvas has a number called the canvas-width. The canvas-width of a g-canvas is usually 0.A g-canvas has a number called the canvas-height. The canvas-height of a g-canvas is usually 0.A g-canvas has a figure-name called the background image. The background image property translates into I6 as "background_img". Include (- with background_img 0 -) when defining a g-canvas.Section - Canvas properties related to the window[The scaled width and scaled height refer to the window coordinates of the canvas; that is, they represent the scaled dimensions. These values are supplied by the extension and will be overwritten if the author attempts to set them directly.]A g-canvas has a number called the scaled width. The scaled width property translates into I6 as "scaled_width". The scaled width of a g-canvas is usually 0.A g-canvas has a number called the scaled height. The scaled height property translates into I6 as "scaled_height". The scaled height of a g-canvas is usually 0.Section - Concealing canvas objects[Replace this section if the player needs to be able to see and refer to canvases in-game.]
A g-canvas is privately-named.
A g-canvas is scenery.Part 1 - Element DefinitionA g-element is a kind of thing.

The specification of g-element is "A g-element is an extensible class of things that represent particular instructions for drawing something to a graphics window (or, more precisely, to a canvas object that is then drawn to a window). Default classes of element include sprites (displays and image file), primitives (draw simple shapes, such as rectangles, boxes, lines, and points), bitmaps (the author specifies a grid of colored bits to be drawn to the screen), and rendered strings (arbitrary text 'painted' to the screen). It is also possible to create new classes of g-elements using commands from the Glimmr Drawing Commands extension. See the specifications for specific element types for more information. Elements need to be explicitly associated with a canvas, e.g. 'the associated canvas of Element A is the graphics-canvas.' (Elements are automatically associated with the graphics-canvas when Glimmr Simple Graphics Window is used.) All g-elements have a property called the origin, written as a list of numbers, e.g. {12, 21}, describing the x, y coordinate of (usually) the upper-left corner of the element. Elements are marked active or inactive, which determines whether they are displayed or not; this is done by setting the display status property to either g-active or g-inactive. If the extension Glimmr Graphic Hyperlinks is included, g-elements can also be hyperlinked. Usually a linked replacement-command is provided, which will paste a command to the input prompt on behalf of the player. However, there are other options available as well (see the Glimmr Graphic Hyperlinks extension)."Section - Display statusA g-element has a g-activity called the display status. The display status of a g-element is usually g-active.Definition: A g-element (called the item) is display-active if the display status of the item is g-active.Definition: A g-element (called the item) is display-inactive if the display status of the item is g-inactive.To mark (element - a g-element) for display:	now the display status of the element is g-active.To activate (element - a g-element):	now the display status of the element is g-active.To element/-- (element - a g-element) is no/not longer/-- marked for display:	now the display status of the element is g-inactive.To unmark element/-- (element - a g-element) for display:	now the display status of the element is g-inactive.To deactivate (element - a g-element):	now the display status of the element is g-inactive.Section - Concealing elements[Replace this section if the player needs to be able to refer to elements in-game.]A g-element is privately-named.
A g-element is scenery.


Section - Null element
[Inform requires that there always be at least one g-element in the world. We therefore provide this object, which is not associated with any canvas and is display-inactive, and so will never be shown; it can also serve as a null element if we need it.]

g-null-element is a g-element. The display status is g-inactive.Section - Element properties related to the canvasA g-element has a g-canvas called the associated canvas.[We can say that a given element "is displayed on" a canvas, or that a canvas "displays" an element.]Displayedness relates a g-element (called A) to a g-canvas (called B) when B is the associated canvas of A. The verb to be displayed on implies the displayedness relation.The verb to display (he displays, they display, he displayed) implies the reversed displayedness relation. [The origin, layer, alignment, and scaling factors are specified by the author and represent the positioning of the element in relation to the canvas.]A g-element has a list of numbers called the origin. The origin of a g-element is usually {0, 0}.A g-element has a number called the display-layer. The display-layer of a g-element is usually 1.A g-element has a real number called the scaling factor. The scaling factor of a g-element is usually 1.0000. The scaling factor property translates into I6 as "scaling_factor".[These are used only if asymmetrical scaling is enabled.]A g-element has a real number called the x-scaling factor. The x-scaling factor of a g-element is usually 1.0000. The x-scaling factor property translates into I6 as "x_factor". A g-element has a real number called the y-scaling factor. The y-scaling factor of a g-element is usually 1.0000. The y-scaling factor property translates into I6 as "y_factor".A g-element can be left-aligned, center-aligned, or right-aligned (this is its alignment property). A g-element is usually left-aligned.Section - Element properties related to the window[The win-x and win-y refer to the window coordinate system; that is, they represent the scaled coordinates of the element. These values are supplied by the extension and will be overwritten if the author attempts to set them directly.]A g-element has a number called the win-x. The win-x is usually 0. A g-element has a number called the win-y. The win-y is usually 0.Section - Element properties related to mouse inputA g-element has a g-activity called the graphlink status. The graphlink status of a g-element is usually g-inactive.Definition: A g-element (called the item) is graphlinked if the graphlink status of the item is g-active.A g-element has some text called the linked replacement-command. The linked replacement-command is usually "".To attach/add/activate graphlink to/for/of (element - a g-element):	now the graphlink status of the element is g-active.To remove/deactivate graphlink of/from/for (element - a g-element):	now the graphlink status of the element is g-inactive.Part - Extensions to g-windows

The specification of a graphics g-window is "Glimmr Canvas-Based Drawing extends graphics g-windows to enable them to work well with canvases. The associated canvas property links a canvas to the window. An origin can be specified for the window, e.g. {100, 100}, and this will place the upper left corner of the window at that canvas coordinate. (Note, however, that this placement will be changed by the centering calculations unless these are altered.) By default, Glimmr Canvas-Based Drawing will automatically scale a canvas to fit into the window dimensions available. However, if we don't want to relinquish scaling control, we can set the arbitrary scaling factor property to a ratio with four decimal places, such as 1.0000, which would always result in the canvas being displayed at full size, even if this would result in its not being fully pictured."A graphics g-window has a list of numbers called the origin. The origin is usually {0, 0}.A graphics g-window has a real number called the arbitrary scaling factor. The arbitrary scaling factor is usually 0.0000.A graphics g-window has a real number called the x-scaling factor. A graphics g-window has a real number called the y-scaling factor. The x-scaling factor of a graphics g-window is usually 0.0000. The y-scaling factor of a graphics g-window is usually 0.0000.A graphics g-window has a real number called the scaling factor. The scaling factor of a graphics g-window is usually 1.0000. [The scaling factor property translates into I6 as "scaling_factor". --Already included with the g-element kind.]A graphics g-window has a number called the x-offset. A graphics g-window has a number called the y-offset. The x-offset of a graphics g-window is usually 0. The y-offset of a graphics g-window is usually 0. The x-offset property translates into I6 as "x_offset". The y-offset property translates into I6 as "y_offset".Section - Graphics g-window properties related to the canvasA graphics g-window has a g-canvas called the associated canvas.[We can say that a g-window "frames" a canvas, or that a canvas "is shown in" a g-window.]Showedness relates a g-canvas (called B) to a g-window (called A) when B is the associated canvas of A. The verb to be shown in implies the showedness relation.The verb to frame (he frames, they frame, he framed, it is framed, he is framed) implies the reversed showedness relation.A g-window has a truth state called oversize scaling. The oversize scaling of a g-window is usually false.Section - Private naming[Replace this section if the player needs to be able to see and refer to g-windows in-game.]A g-window is privately-named.
A g-window is scenery.Chapter - Relating elements directly to windowsAssignedness relates a g-element (called A) to a g-window (called B) when the associated canvas of B is the associated canvas of A. The verb to be assigned to implies the assignedness relation.To assign (element - a g-element) to (win - a g-window):	change the associated canvas of the element to the associated canvas of win.To decide which g-window is the assigned window of (element - a g-element):	repeat with win running through graphics g-windows:		if element is assigned to win, decide on win.Part 4 - Default canvas-based drawing ruleA window-drawing rule for a graphics g-window (called the window) (this is the default canvas-based drawing rule):	if the window is g-present:		[*say "[>console][paragraph break][CBD]Following the default canvas-based drawing rule for the window [i][window][/i].[/]";*]		carry out the scaling activity with the window;		carry out the offset calculation activity with the window;		carry out the window-framing adjustment activity with the window;		clear the window;		carry out the drawing the canvas background activity with the window;		carry out the drawing the active elements activity with the window.The default canvas-based drawing rule is listed last in the window-drawing rules.The window-drawing rules have default success.Chapter 3.1 - Calculating the scaling factorsScaling something is an activity. Last for scaling a graphics g-window (called the window) (this is the default window-scaling rule):	[*say "[>console][CBD]Window [i][window][/i] is [width of the window] by [height of the window] pixels.[/]";*]	let panel be the associated canvas of the window;	if panel is nothing:		[*say "[>console][CBD]*** Scaling error: No canvas defined for [i][window][/i].[/]";*]		rule fails;	if the canvas-width of panel is 0 or the canvas-height of panel is 0:		if the background image of panel is no-picture:			[*say "[>console][CBD]*** Scaling error: Dimensions of canvas [i][panel][/i] not specified. Either define the canvas using a background image, or assign numerical dimensions.[/]";*]			rule fails;		[doubling up of variables necessary due to an apparent bug in Inform]		let canvas-x be the image-width of the background image of panel;		let canvas-y be the image-height of the background image of panel;		change the canvas-width of panel to canvas-x;		change the canvas-height of panel to canvas-y;		[*say "[>console][CBD]Canvas [i][panel][/i] is [canvas-width of panel] by [canvas-height of panel] pixels.[/]";*]	if the arbitrary scaling factor of the window is real greater than 0.0000:		change the scaling factor of the window to the arbitrary scaling factor of the window;		[*say "[>console][CBD]Scaling factor of [i][window][/i] set to [scaling factor of the window] based on arbitrary scaling factor.[/]";*]	otherwise:		let x-win be the width of the window as a fixed point number;		let y-win be the height of the window as a fixed point number;		change the x-scaling factor of the window to x-win real divided by the canvas-width of panel;		change the y-scaling factor of the window to y-win real divided by the canvas-height of panel;		if the x-scaling factor of the window is real greater than the y-scaling factor of the window:			change the scaling factor of the window to the y-scaling factor of the window;			[*say "[>console][CBD][i][window][/i] scaling factor set to the vertical scaling factor: [y-scaling factor of the window].[/]";*]		otherwise:			change the scaling factor of the window to the x-scaling factor of the window;			[*say "[>console][CBD][i][window][/i] scaling factor set to the horizontal scaling factor: [i][x-scaling factor of the window][/i].[/]";*]		if the scaling factor of the window is greater than 1.0000:			unless the oversize scaling of the window is true:				change the scaling factor of the window to 1.0000;				[*say "[>console][CBD][i][window][/i] scaling factor set to [scaling factor of the window]. To allow for a higher scaling factor, set the window's oversize scaling property to true.[/]";*]	change the scaled width of panel to the scaling factor of the window real times the canvas-width of panel as an integer;	change the scaled height of panel to the scaling factor of the window real times the canvas-height of panel as an integer;	[*say "[>console][CBD]Scaled size for canvas [i][panel][/i] is [scaled width of panel] by [scaled height of panel].[/]";*]Chapter 3.2 - Offset calculationOffset calculation of something is an activity.Last for offset calculation of a graphics g-window (called the window) (this is the default offset calculation rule):	let panel be the associated canvas of the window;	change the x-offset of the window to (the width of the window minus the scaled width of panel) divided by 2;	change the y-offset of the window to (the height of the window minus the scaled height of panel) divided by 2;	[*say "[>console][CBD][i][window][/i] x offset set at [x-offset of the window]; y offset set at [y-offset of the window].[/]";*]Section - Window-framing adjustmentWindow-framing adjustment of something is an activity.Last for window-framing adjustment of a graphics g-window (called the window) when the origin of the window is not {0, 0} (this is the default window-framing adjustment rule):		let xx be entry 1 of the origin of the window real times the scaling factor of the window as an integer;		let yy be entry 2 of the origin of the window real times the scaling factor of the window as an integer;		change the x-offset of the window to (0 - xx) + x-offset of the window;		change the y-offset of the window to (0 - yy) + y-offset of the window;		[*say "[>console][CBD]Offsets of [i][window][/i] adjusted using non-zero origin ([xx], [yy]): x offset set at [x-offset of the window]; y offset set at [y-offset of the window].[/]";*]Section - Drawing the canvas backgroundDrawing the canvas background of something is an activity.Last for drawing the canvas background of a graphics g-window (called the window) (this is the default canvas background drawing rule):	let panel be the associated canvas of the window;	if panel is not nothing:		if the background image of panel is not no-picture:			draw the background-image of panel in the window;			[*say "[>console][CBD]Drawing canvas background [i][background of panel][/i] in [i][window][/i].[/]";*]		[*otherwise:*]			[*say "[>console][CBD]Canvas [i][panel][/i] has no background image.[/]";*]	[*otherwise:*]		[*say "[>console][CBD]*** Error: No canvas defined for [i][window][/i].[/]";*]To draw the background-image of (panel - a g-canvas) in (win - a g-window):	(- DrawCanvas({panel}, {win}); -)	Include (-[ DrawCanvas c g;	if (g.ref_number) {		if (g.scaling_factor~= (+ Divisor +) ) {!internal representation of 1.0000			glk_image_draw_scaled(g.ref_number, c.background_img, g.x_offset, g.y_offset, c.scaled_width, c.scaled_height);		}		else {			glk_image_draw(g.ref_number, c.background_img, g.x_offset, g.y_offset);		}	}]; -)Section 3.4 - A command to resize the canvas to the window[This phrase should be used in a before scaling rule, e.g.:	A before scaling rule for the graphics-window:		resize the canvas of the graphics-window to the window;The main use of such a rule is if we want to procedurally place our g-elements, e.g. we want to distribute a number of images at even intervals across the window, regardless of what size the window is.]To resize the/-- canvas of (win - a g-window) to the/-- window:	now the canvas-width of the associated canvas of win is the width of win;	now the canvas-height of the associated canvas of win is the height of win;Section - Command for centering the window frame on specific points[The window centering phrases will only work properly when used after the scaling and offset factors are determined. Usually these phrases will be used in the window-framing adjustment activity. Coordinates passed into the centering phrases should be in canvas coordinates, not screen coordinates.]To center the/-- frame/framing/-- of/-- (win - a g-window) on canvas/-- coordinates/-- (coord - a list of numbers):	let x be entry 1 of coord;	let y be entry 2 of coord;	change entry 1 of the origin of win to x - (canvas-width of the associated canvas of win / 2);	change entry 2 of the origin of win to y - (canvas-height of the associated canvas of win / 2);	[*say "[>console][CBD]Window [i][win][/i] recentered on canvas coordinates [coord in brace notation]; origin changed to ([entry 1 of origin of win], [entry 2 of origin of win]).[/]";*]To decide what list of numbers is the center-point of (panel - a g-canvas):	let x be the canvas-width of panel divided by 2;	let y be the canvas-height of panel divided by 2;	let coord be {0, 0};	now entry 1 of coord is x;	now entry 2 of coord is y;	decide on coord.To center the/-- frame/framing/-- of/-- (win - a g-window) on its g-canvas/canvas:	let panel be the associated canvas of win;	center win on the center-point of panel.

To center the/-- frame/framing/-- of/-- (win - a g-window) on (item - a g-element):	[*say "[>console][CBD]Centering the window frame of [i][win][/i] on [i][item][/i].[/]";*]	center win on the center-point of item.Section 3.3 - Useful phrasesTo decide which real number is (N - a number) scaled by (R - a real number):	Let temp be N as a fixed point number;	let temp be temp real times R;	decide on temp.	To decide which real number is (N - a real number) scaled by (R - a real number):	Let temp be N real times R;	decide on temp.Part 7 - Coordinate ManipulationTo decide which list of numbers is the (warp - a list of numbers) offset by (weft - a list of numbers):	[*if the number of entries of warp is not 2:*]		[*say "[>console]*** Error:  [warp] is not a pair of coordinates.[/]";*]	[*if the number of entries of weft is not 2:*]		[*say "[>console]*** Error: [weft] is not a pair of coordinates.[/]";*]	let result1 be entry 1 of warp + entry 1 of weft;	let result2 be entry	2 of warp + entry 2 of weft;	let L be a list of numbers;	Add result1 to L;	Add result2 to L;	decide on L.To decide which list of numbers is the grid equivalent of the screen coordinates (X - a number) by (Y - a number) of (win - a g-window):	let x-fixe be X as a fixed point number;	let y-fixe be Y as a fixed point number;	let x-fixe be (x-fixe real minus x-offset of win) real divided by the scaling factor of win;	let y-fixe be (y-fixe real minus y-offset of win) real divided by the scaling factor of win;	let L be a list of numbers;	let L be {0, 0};	change entry 1 of L to x-fixe as an integer;	change entry 2 of L to y-fixe as an integer;	decide on L;Part 5 - Element DrawingDrawing the active elements of something is an activity.[These are global variables that are set by the drawing the active elements of something activity. In most cases, authors should not set these directly.]The current element is a g-element variable.The current window is a g-window variable.Last for drawing the active elements of a graphics g-window (called win) (this is the default active element drawing rule):	now the current window is win;	let L be the list of display-active g-elements displayed on the associated canvas of the current window;	prune the link-table of win links;	sort L in display-layer order;	repeat with current-element running through L:		follow the element scaling rules for current-element;		follow the element display rules for current-element;Chapter 5.1 - Element scaling rulesThe element scaling rules are an object-based rulebook.The element scaling rules have outcomes exit (success) and continue (no outcome - the default).An element scaling rule for a g-element (called the current-element) (this is the element origin scaling rule):	let x-temp be entry 1 of the origin of the current-element scaled by the scaling factor of the current window;	let y-temp be entry 2 of the origin of the current-element scaled by the scaling factor of the current window;	change the win-x of current-element to x-temp real plus the x-offset of the current window as an integer;	change the win-y of current-element to y-temp real plus the y-offset of the current window as an integer;	continue;The element origin scaling rule is listed first in the element scaling rules.Chapter 1.2 - Element display rulesThe element display rules are an object-based rulebook.The element display rules have outcomes exit (success - the default) and continue (no outcome).


Chapter 5a - Graphlink management (for use with Glimmr Graphic Hyperlinks by Erik Temple)To zero the/-- link-table:	repeat through the Table of Graphlink Glulx Replacement Commands:		blank out the whole row.		To prune the/-- link-table of the/-- (g - a g-window) links:	repeat through the Table of Graphlink Glulx Replacement Commands:		if g is the g-win entry:			blank out the whole row.Chapter 5b - Graphlink management (for use without Glimmr Graphic Hyperlinks by Erik Temple)To zero the/-- link-table:	do nothing.		To prune the/-- link-table of the/-- (g - a g-window) links:	do nothing.
Part 6 - Sprites[A sprite is an image (defined by a PNG or other image file) that has the capacity to be placed independently of other elements.]A sprite is a kind of g-element.

The specification of a sprite is "A sprite, per general computing terminology, is an independent image that is integrated into a larger composition. To use an image file as a sprite element, we must first declare the external image file (can be in PNG or JPEG format) as a figure in I7. The figure must then be assigned to the sprite by setting the 'image-ID' property of the sprite object to the figure-name. Like other g-elements, sprites have a coordinate pair, the origin property, that determines where in the canvas coordinate system the upper-left corner of the sprite will be displayed. Sprites can be scaled if desired, using the 'scaling factor' property. This scaling factor is calculated before the canvas is scaled to fit the window; in other words, the scaling factor property of the sprite scales it in relation to the rest of the canvas. If the asymmetrical scaling use option is set, it will be necessary to set both the 'x-scaling factor' and the 'y-scaling factor' of the sprite; these can, of course, be set to different values to allow the sprite to be 'stretched' to an aspect ratio other than the original aspect ratio."A sprite has a figure-name called image-ID. The image-ID property translates into I6 as "image_ID". Include (- with image_ID 0 -) when defining a sprite.[The sprite-x and sprite-y refer to the scaled dimensions of the image. Authors should not need to set them directly.]A sprite has a number called the sprite-x. The sprite-x is usually 0.A sprite has a number called the sprite-y. The sprite-y is usually 0.To display/draw the/-- sprite --/element (ID - a g-element) in (g - a g-window) at coordinates (off_x - a number) by/x/and (off_y - a number) with dimensions (image_x - a number) by/x/and (image_y - a number):	(- DrawSprite({ID}, {g}, {off_x}, {off_y}, {image_x}, {image_y}); -)Include (-[DrawSprite ID g off_x off_y image_x image_y ;	if (g.ref_number) {	#ifdef ASYM_SCALING;		if (g.scaling_factor~= (+ Divisor +) || ID.x_factor~= (+ Divisor +) || ID.y_factor~= (+ Divisor +) ) {!internal representation of 1.0000	#ifnot;		if (g.scaling_factor~= (+ Divisor +) || ID.scaling_factor~= (+ Divisor +) ) {!internal representation of 1.0000	#endif;			glk_image_draw_scaled(g.ref_number, ID.image_ID, off_x, off_y, image_x, image_y);		}		else {			glk_image_draw(g.ref_number, ID.image_ID, off_x, off_y);		}	}];  -).Chapter - Sprite scaling ruleAn element scaling rule for a sprite (called the current-sprite) (this is the sprite scaling rule):	unless the image-ID of current-sprite is no-picture:		let sprite-ID be image-ID of current-sprite;		let x-temp be the image-width of sprite-ID as a fixed point number;		let y-temp be the image-height of sprite-ID as a fixed point number;		unless using the asymmetrical scaling option:			change sprite-x to x-temp real times the scaling factor of current window real times the scaling factor of the current-sprite as an integer;			change sprite-y to y-temp real times the scaling factor of current window real times the scaling factor of the current-sprite as an integer;		otherwise:			change sprite-x to x-temp real times the scaling factor of current window real times the x-scaling factor of the current-sprite as an integer;			change sprite-y to y-temp real times the scaling factor of current window real times the y-scaling factor of the current-sprite as an integer;		if current-sprite is center-aligned:			change the win-x of current-sprite to win-x - (sprite-x) / 2;			change the win-y of current-sprite to win-y - (sprite-y) / 2;		if current-sprite is right-aligned:			change the win-x of current-sprite to win-x - sprite-x;			change the win-y of current-sprite to win-y - sprite-y;	continue;Chapter 6.1a - Sprite element display ruleAn element display rule for a sprite (called the current-sprite) (this is the sprite display rule):	unless the image-ID of current-sprite is no-picture:		display sprite current-sprite in the current window at coordinates win-x of current-sprite and win-y of current-sprite with dimensions sprite-x of current-sprite and sprite-y of current-sprite;		if graphlink status of current-sprite is g-active:			set a graphlink in the current window identified as current-sprite from win-x of current-sprite by win-y of current-sprite to (win-x of current-sprite + sprite-x of current-sprite) by (win-y of current-sprite + sprite-y of current-sprite) as the linked replacement-command of current-sprite;		[*say "[>console][CBD]Drawing sprite element [i][current-sprite][/i] ([image-ID of current-sprite]) in [i][current window][/i] at origin ([win-x of current-sprite], [win-y of current-sprite]), dimensions [sprite-x of current-sprite] x [sprite-y of current-sprite] pixels.[line break][CBD]Graphlink corresponding to [i][current-sprite][/i] set from ([win-x of current-sprite], [win-y of current-sprite]) to ([win-x of current-sprite + sprite-x of current-sprite], [win-y of current-sprite + sprite-y of current-sprite]): [quotation mark][linked replacement-command of current-sprite][quotation mark].[/]";*]	[*otherwise:*]		[*say "[>console][CBD]Sprite element [i][current-sprite][/i] is undefined (the image-ID property is not set or is set to [quotation mark]no-picture[quotation mark]).[/]".*]Section - Centering algorithm for sprites[When you create a new class of g-element, it is good practice to define a centering phrase that will be able to find the center point of any object of that class. This should not use the win-x/win-y properties, or any other property that is set by the element scaling rules. For this reason, the algorithm should assume that the origin is the upper-left hand corner (center and right alignment are calculated by the element scaling rules).]To decide what list of numbers is the center-point of (item - a sprite):	let x be entry 1 of the origin of item;	let y be entry 2 of the origin of item;	unless using the asymmetrical scaling option:		let dx be the image-width of item real times the scaling factor of the item as an integer;		let dy be the image-height of item real times the scaling factor of the item as an integer;	otherwise:		let dx be the image-width of item real times the x-scaling factor of the current-sprite as an integer;		let dy be the image-height of item real times the y-scaling factor of the current-sprite as an integer;	let x be x + (dx / 2);	let y be y + (dy / 2);	let coord be {0, 0};	now entry 1 of coord is x;	now entry 2 of coord is y;	decide on coord.


Chapter 1 - The primitive base classA primitive is a kind of g-element. 

The specification of a primitive is "A primitive element is a simple shape that is generally intended to be used in concert with other shapes and images to build up a composition; for example, rectangles and lines. The meaning of a graphics primitive is somewhat stretched here, since the only primitive actually provided by Glulx is a simple rectangle, whereas all of the other 'primitives' provided by Glimmr Canvas-Based Drawing are in fact built up out of rectangles. The most intensive of these, the line primitive, can be made up of many, many rectangles and may be quite slow to draw. Primitives have an origin, as do all g-elements, and they also have a second coordinate pair, the endpoint. For most primitives, the origin describes the upper left corner, while the endpoint describes the lower right corner. The line primitive, however, is freer--the two points can have any relationship. It is also necessary to specify the color of a primitive, using the 'tint' property. This is a glulx color value (see the Glulx Text Effects extension). Some primitives (the stroked rectangle) also have a 'background tint' property that controls a second color value."[The endpoint of a primitive are provided in the canvas' coordinate system.]A primitive has a list of numbers called the endpoint. The endpoint of a primitive is {0, 0}.A primitive has a glulx color value called the tint. The tint of a primitive is g-White.[The end-x and end-y are scaled values, presented in the coordinate system of the window rather than of the canvas. They are recalculated every time the window is redrawn and under most circumstances should not be specified by the author.]A primitive has a number called the end-x. The end-x of a primitive is 0. A primitive has a number called the end-y. The end-y of a primitive is 0.Section 1.1 - Scaling rule for primitives[The line-weight of the lines used in primitives are scaled according to the scaling factor (or, if we are using asymmetrical scaling, the x scaling factor). If we need to prevent line-weight from changing with the window scaling, we need to place a rule applying to the appropriate primitive or class before the primitive scaling rule. This rule should change the scaling factor to the inverse of the scaling factor; i.e. if the scaling factor were 0.2500, our rule would set the scaling factor to 4.0000, thereby canceling the effect of the window-scaling on the line line-weight.]An element scaling rule for a primitive (called the subject) (this is the primitive scaling rule):	let x-temp be entry 1 of the endpoint of the subject scaled by the scaling factor of the current window;	let y-temp be entry 2 of the endpoint of the subject scaled by the scaling factor of the current window;	now the end-x of the subject is x-temp real plus the x-offset of the current window as an integer;	now the end-y of the subject is y-temp real plus the y-offset of the current window as an integer;
	if the subject provides the property line-weight:		let weight-temp be the line-weight of the subject as a fixed point number;		unless using the asymmetrical scaling option:			change the stroke of the subject to the weight-temp real times the scaling factor of the current window real times the scaling factor of the subject as an integer;		otherwise:			change the stroke of the subject to the weight-temp real times the scaling factor of the current window real times the x-scaling factor of the subject as an integer;		if the stroke of the subject < 1, change the stroke of the subject to 1;	if the subject is center-aligned:		let dx be (end-x of the subject - win-x) / 2;		let dy be (end-y of the subject - win-y) / 2;		change the win-x to win-x - dx;		change the win-y to win-y - dy;		change the end-x to end-x - dx;		change the end-y to end-y - dy;	if the subject is right-aligned:		let dx be (end-x of the subject - win-x);		let dy be (end-y of the subject - win-y);		change the win-x to win-x - dx;		change the win-y to win-y - dy;		change the end-x to end-x - dx;		change the end-y to end-y - dy;	continue.Section 1.2 - Centering algorithm for primitives[This could be done much more concisely using the win-x/win-y and end-x/end-y properties, but these are not set until the element scaling rulebook is followed, which doesn't grant as much flexiblity. This phrase may be used anytime after the determining offsets activity.]To decide what list of numbers is the center-point of (item - a primitive):
	let x be entry 1 of the origin of item;	let y be entry 2 of the origin of item;
	unless the item is a point primitive:		let xx be entry 1 of the endpoint of the item;		let yy be entry 2 of the endpoint of the item;
	otherwise:
		let x be x - (line-weight of the item / 2);
		let y be y - (line-weight of the item / 2);
		let xx be x + line-weight of item;
		let yy be y + line-weight of item;	let x be (xx - x) / 2 + x;	let y be (yy - y) / 2 + y;	let coord be {0, 0};	now entry 1 of coord is x;	now entry 2 of coord is y;	decide on coord.Section 1.2 - Rectangle PrimitiveA rectangle primitive is a kind of primitive.

The specification of rectangle primitive is "A rectangle primitive is a type of g-element, a simple rectangle of color. The rectangle is specified from an origin coordinate in the upper left corner to an endpoint in the lower right corner. These coordinate pair properties are each specified using list formatting, e.g. {20, 10}. The color of the rectangle, as with all primitives, is specified using the 'tint' property. The tint is specified as a glulx color value (see the Glulx Text Effects extension)."An element display rule for a rectangle primitive (called the rectangle):	[if the rectangle is center-aligned:		change the win-x of the rectangle to win-x - (end-x) / 2;		change the win-y of the rectangle to win-y - (end-y) / 2;	if the rectangle is right-aligned:		change the win-x of the rectangle to win-x - end-x;		change the win-y of the rectangle to win-y - end-y;]	[*say "[>console][CBD]Drawing rectangle primitive [i][rectangle][/i], color [color tint of rectangle], in [i][current window][/i] with upper left ([win-x], [win-y]) and lower right ([end-x], [end-y])[if the rectangle is graphlinked]. [line break][CBD]Graphlink corresponding to [i][rectangle][/i] set from ([win-x of rectangle], [win-y of rectangle]) to ([end-x], [end-y]): [quotation mark][linked replacement-command][quotation mark][end if].[/]";*]	rectdraw (color tint of the rectangle) in (current window) from (win-x) by (win-y) to (end-x) by (end-y);	if the rectangle is graphlinked:		set a graphlink in the current window identified as the rectangle from win-x by win-y to end-x by end-y as the linked replacement-command of the rectangle.Section 1.3 - Box primitive[Box primitives draw a simple box, with the line straddling (as much as possible) the given dimensions. In other words, a box drawn at 100% size with a line-weight of 4 will be drawn with two pixels of line inside the given dimensions and two pixels outside.]A box primitive is a kind of primitive.

The specification of box primitive is "A box primitive is a type of g-element. It draws the outline of a rectangle, with an empty center. The rectangle is specified from an origin coordinate in the upper left corner to an endpoint in the lower right corner. These coordinate pair properties are each specified using list formatting, e.g. {20, 10}. The color of the outline is specified using the 'tint' property. The tint is supplied as a glulx color value (see the Glulx Text Effects extension). The width of the line used to draw the outline is specified using the 'line-weight' property. The line-weight will be scaled along with the canvas; that is, if the line-weight is specified as 4 pixels wide and the canvas must be scaled to 50% to fit in the window, the actual displayed width of the line will be 2 pixels."

A box primitive has a number called the line-weight. The line-weight of a box primitive is 1.

[The stroke is a scaled value, presented in the coordinate system of the window rather than of the canvas. They are recalculated every time the window is redrawn and under most circumstances should not be specified by the author.]

A box primitive has a number called the stroke. The stroke of a box primitive is 1.An element display rule for a box primitive (called the box):	[*say "[>console][CBD]Drawing box primitive [i][box][/i], color [color tint of the box], in [i][current window][/i] with upper left ([win-x], [win-y]) and lower right ([end-x], [end-y]), scaled line-weight [stroke] px[if the box is graphlinked]. [line break][CBD]Graphlink corresponding to [i][box][/i] set from ([win-x of box], [win-y of box]) to ([end-x], [end-y]): [quotation mark][linked replacement-command][quotation mark][end if].[/]";*]	boxdraw (color tint of the box) in (current window) from (win-x) by (win-y) to (end-x) by (end-y) with (stroke);	if the box is graphlinked:		set a graphlink in the current window identified as the box from win-x by win-y to end-x by end-y as the linked replacement-command of the box.Section 1.4 - Stroked rectangle primitiveA stroked rectangle primitive is a kind of primitive.

The specification of stroked rectangle primitive is "A stroked rectangle primitive is a type of g-element. It draws a rectangle of color, outlined by a second color. The rectangle is specified from an origin coordinate in the upper left corner to an endpoint in the lower right corner. These coordinate pair properties are each specified using list formatting, e.g. {20, 10}. The color of the inner area is specified using the 'tint' property, while the outline is specified by the 'background tint'. Both of these are glulx color values (see the Glulx Text Effects extension). The width of the line used to draw the outline is specified using the 'line-weight' property. The line-weight will be scaled along with the canvas; that is, if the line-weight is specified as 4 pixels wide and the canvas must be scaled to 50% to fit in the window, the actual displayed width of the line will be 2 pixels."A stroked rectangle primitive has a glulx color value called the background tint. The background tint is usually g-White.

A stroked rectangle primitive has a number called the line-weight. The line-weight of a stroked rectangle primitive is 1.

[The stroke is a scaled value, presented in the coordinate system of the window rather than of the canvas. They are recalculated every time the window is redrawn and under most circumstances should not be specified by the author.]

A stroked rectangle primitive has a number called the stroke. The stroke of a stroked rectangle primitive is 1.An element display rule for a stroked rectangle primitive (called the stroked rectangle):	[*say "[>console][CBD]Drawing stroked rectangle primitive [i][stroked rectangle][/i], color [color tint of the stroked rectangle], in [i][current window][/i] with upper left ([win-x], [win-y]) and lower right ([end-x], [end-y]), scaled line-weight [stroke] px[if the stroked rectangle is graphlinked]. [line break][CBD]Graphlink corresponding to [i][stroked rectangle][/i] set from ([win-x of stroked rectangle], [win-y of stroked rectangle]) to ([end-x], [end-y]): [quotation mark][linked replacement-command][quotation mark][end if].[/]";*]	strectdraw (color tint of the stroked rectangle) in (current window) from (win-x) by (win-y) to (end-x) by (end-y) with (stroke) stroke of (color background tint);	if the stroked rectangle is graphlinked:		set a graphlink in the current window identified as the stroked rectangle from win-x by win-y to end-x by end-y as the linked replacement-command of the stroked rectangle.Section 1.4 - Line primitive			A line primitive is a kind of primitive.

The specification of line primitive is "A line primitive is a type of g-element. It draws a line between any two points using a specified color. The line is drawn between an origin coordinate and an endpoint. The color of the line is specified using the 'tint' property, a glulx color value (see the Glulx Text Effects extension). The width of the line is specified using the 'line-weight' property. The line-weight will be scaled along with the canvas; that is, if the line-weight is specified as 4 pixels wide and the canvas must be scaled to 50% to fit in the window, the actual displayed width of the line will be 2 pixels."[Authors may mark a line primitive as graphlinked, but in most cases this should be done only for horizontal or vertical lines, as only a single rectangular entry will be placed in the graphlink lookup table.]

A line primitive has a number called the line-weight. The line-weight of a line primitive is 1.

[The stroke is a scaled value, presented in the coordinate system of the window rather than of the canvas. They are recalculated every time the window is redrawn and under most circumstances should not be specified by the author.]

A line primitive has a number called the stroke. The stroke of a line primitive is 1.An element display rule for a line primitive (called the line):	[*say "[>console][CBD]Drawing line primitive [i][line][/i], color [color tint of the line], in [i][current window][/i] from ([win-x], [win-y]) to ([end-x], [end-y]), scaled line-weight [stroke] pixels[if the line is graphlinked]. [line break][CBD]Graphlink corresponding to [i][line][/i] set from ([min win-x or end-x], [min win-y or end-y]) to ([max win-x or end-x], [max win-y or end-y]): [quotation mark][linked replacement-command][quotation mark][end if].[/]";*]	linedraw (color tint of the line) in (current window) from (win-x) by (win-y) to (end-x) by (end-y) with (stroke);	if the line is graphlinked:		set a graphlink in the current window identified as the line from (min win-x or end-x)  by (min win-y or end-y) to (max win-x or end-x) by (max win-y or end-y) as the linked replacement-command of the line;Section 1.5 - Point primitiveA point primitive is a kind of primitive.

The specification of point primitive is "A point primitive is a type of g-element. It draws a square centered on a coordinate specified using the 'origin' property. The coordinate pair is supplied using list formatting, e.g. {20, 10}. The color of the point is specified with the 'tint' property, a glulx color value (see the Glulx Text Effects extension). The size of the square is given using the 'line-weight' property; line weight of 1 pixel for example, will result in a square of a single pixel. The line-weight will be scaled along with the canvas; that is, if the line-weight is specified as 4 pixels wide and the canvas must be scaled to 50% to fit in the window, the actual displayed width of the line will be 2 pixels."

A point primitive has a number called the line-weight. The line-weight of a point primitive is 1.

[The stroke is a scaled value, presented in the coordinate system of the window rather than of the canvas. They are recalculated every time the window is redrawn and under most circumstances should not be specified by the author.]

A point primitive has a number called the stroke. The stroke of a point primitive is 1.An element display rule for a point primitive (called the point):	unless the stroke of the point is 1:		change win-x of the point to win-x of the point minus (stroke / 2);		change win-y of the point to win-y of the point minus (stroke / 2);	change end-x of the point to win-x plus stroke;	change end-y of the point to win-y plus stroke;	[*say "[>console][CBD]Drawing point primitive [i][point][/i], color [color tint of point] in [i][current window][/i] with upper left ([win-x], [win-y]) and lower right ([end-x], [end-y]), scaled line-weight [stroke] pixels[if the point is graphlinked]. [line break][CBD]Graphlink corresponding to [i][point][/i] set from ([win-x of point], [win-y of point]) to ([end-x], [end-y]): [quotation mark][linked replacement-command][quotation mark][end if].[/]";*]	rectdraw (color tint of the point) in (current window) from (win-x) by (win-y) to (end-x) by (end-y);	if the point is graphlinked:		set a graphlink in the current window identified as the point from win-x by win-y to end-x by end-y as the linked replacement-command of the point.


Chapter 2 - Bitmap base classA bitmap is a kind of g-element. 

The specification of bitmap is "A bitmap element draws a rectangular image composed of individual 'bits' that are specified by the author in the form of a list (the 'bitmap-array') defining the status of each bit. For example, a cross might be specified like so: 

{ 0, 0, 1, 0, 0,
  0, 0, 1, 0, 0,
  1, 1, 1, 1, 1,
  0, 0, 1, 0, 0,
  0, 0, 1, 0, 0  }. 

The ones represent bits that are turned on, while the zeros represent bits that are off. The author must additionally specify the 'bitmap-width' of the bitmap, which represents the number of bits that make a up a single horizontal line of the bitmap; this number tells Glimmr how to interpret the bitmap-array (if a bitmap-width is not provided, the bitmap will be interpreted as single line of bits). 

When image files such as PNGs or JPEGs are scaled, pixels can be interpolated so that the image file can be presented at virtually any scaling factor. However, the pixels of a bitmap element are set directly, and so the individual pixel is the primary unit of measurement. Thus, a bitmap displayed with a bit-size of 2 will be twice as wide and twice as high as the same bitmap displayed with a bit-size of 1. Glimmr will attempt to scale bitmaps to the canvas, but they cannot be scaled with the accuracy that sprites can be. 

There are two types of bitmaps: monochrome and polychrome bitmaps. In a monochrome bitmap, a maximum of two colors are allowed--all bits are either on or off. In a polychrome bitmap, the author can specify a full RGB color for each pixel. In both types, bits are rendered as a defined color (the 'tint') and background color ('background tint')."A bitmap has a number called the bitmap-width. The bitmap-width of a bitmap is 1.A bitmap has a list of numbers called the bitmap-array. The bitmap-array of a bitmap is {0}.A bitmap has a glulx color value called the tint. The tint of a bitmap is g-White.A bitmap has a glulx color value called the background tint. The background tint of a bitmap is g-PlaceNullCol.A bitmap has a number called the bit-size. The bit-size of a bitmap is 1.[A bitmap has a number called the vertical ratio. The vertical ratio of a bitmap is 1.][The dot-size and the bitmap-height are set automatically by the extension. Authors need not use them.]A bitmap has a number called the dot-size. The dot-size of a bitmap is 1.A bitmap has a number called the bitmap-height. The bitmap-height of a bitmap is 1.Section 2.1 - Scaling rule for bitmapsAn element scaling rule for a bitmap (called the image-map) (this is the bitmap scaling rule):	let the bitsize-temp be the bit-size of the image-map as a fixed point number;	unless using the asymmetrical scaling option:		change the dot-size of the image-map to the bitsize-temp real times the scaling factor of the current window real times the scaling factor of the image-map as an integer;	otherwise:		change the dot-size of the image-map to the bitsize-temp real times the scaling factor of the current window real times the x-scaling factor of the image-map as an integer;	if the dot-size of the image-map < 1, now the dot-size of the image-map is 1;	change the bitmap-height of the image-map to the number of entries of the bitmap-array of the image-map divided by the bitmap-width of the image-map;	if the image-map is center-aligned:		change the win-x of the image-map to win-x - (bitmap-width * dot-size) / 2;		change the win-y of the image-map to win-y - (bitmap-height * dot-size) / 2;	if the image-map is right-aligned:		change the win-x of the image-map to win-x - (bitmap-width * dot-size);		change the win-y of the image-map to win-y - (bitmap-height * dot-size);	[*if the remainder after dividing the number of entries of the bitmap-array of the image-map by the bitmap-width of the image-map is greater than 0:*]		[*say "[>console][CBD] ***Error: Bitmap array of [image-map] is improperly defined. Output is unlikely to be as expected.[/]";*]	continue.Section 2.2 - Centering algorithm for bitmapsTo decide what list of numbers is the center-point of (item - a bitmap):
	let x be entry 1 of the origin of item;	let y be entry 2 of the origin of item;	let dot-scale be (bit-size of the item * bitmap-width of the item) as a fixed point number;	unless using the asymmetrical scaling option:		let dx be the dot-scale real times the scaling factor of the item as an integer;		let dy be the dot-scale real times the scaling factor of the item as an integer;	otherwise:		let dx be the dot-scale real times the x-scaling factor of the item as an integer;		let dy be the dot-scale real times the y-scaling factor of the item as an integer;	let x be x + (dx / 2);	let y be y + (dy / 2);	let coord be {0, 0};	now entry 1 of coord is x;	now entry 2 of coord is y;	decide on coord.	Section 2.2 - Monochrome bitmap

A monochrome bitmap is a kind of bitmap.

The specification of monochrome bitmap is "A monochrome bitmap has two possible colors. Where the bitmap-array provides a 1, the value of the 'tint' property (a glulx color value) will be used. Where a 0 is provided, the 'background tint' color (also a glulx color value) will be presented. If the background tint is specified as g-PlaceNullCol, the null value defined by Flexible Windows, there will be no background color."An element display rule for a monochrome bitmap (called the image-map):
	if the background tint of the image-map is g-PlaceNullCol:
		draw a monochrome bitmap (color tint of the image-map) in (current window) at (win-x of the image-map) by (win-y of the image-map) using (bitmap-width) wide data from (bitmap-array) with dot size (dot-size) pixels;
	otherwise:
		draw a monochrome bitmap (color tint of the image-map) in (current window) at (win-x of the image-map) by (win-y of the image-map) using (bitmap-width) wide data from (bitmap-array) with dot size (dot-size) pixels and background (color background tint of the image-map);	if the image-map is graphlinked:		set a graphlink in the current window identified as image-map from win-x by win-y to win-x + (bitmap-height * dot-size) by win-y + (bitmap-height * dot-size) as the linked replacement-command of the image-map;
	[*say "[>console][CBD]Drawing monochrome bitmap [i][image-map][/i], foreground color [color foreground-color], in [i][current window][/i] with upper left ([win-x of image-map], [win-y]) and lower right ([column], [row plus dot-size])[unless background-color is g-PlaceNullCol]; background color [color background-color][end if][if image-map is graphlinked]. [line break][CBD]Graphlink corresponding to [i][image-map][/i] set from ([win-x of image-map], [win-y of image-map]) to ([column], [row plus dot-size]): [quotation mark][linked replacement-command of image-map][quotation mark][end if].[/]";*]Section 2.3 - Polychrome bitmap

[In a polychrome bitmap, we can set decimal versions of any hex RGB-color we like in our bitmap array. As with the monochrome bitmap, we can also set two special values, a basic foreground color, written as 1 in the bitmap array, and a background color, written as 2, which will utilize the color and background-color property of our bitmap object. Otherwise, we must define colors using decimal versions of hex RGB definitions.]A polychrome bitmap is a kind of bitmap.

The specification of polychrome bitmap is "A polychrome bitmap, like a monochrome bitmap, has two pre-specified colors; however, we can also specify any color using a decimal version of the hexadecimal RGB specification (see Glulx Text Effects for more info). Where a polychrome's bitmap-array provides a 1, the value of the 'tint' property (a glulx color value) will be used. Where a 2 is provided, the 'background tint' color (also a glulx color value) will be presented. If the background tint is specified as g-PlaceNullCol, the null value defined by Flexible Windows, there will be no background color."An element display rule for a polychrome bitmap (called the image-map):
	if the background tint of the image-map is g-PlaceNullCol:
		draw a polychrome bitmap (color tint of the image-map) in (current window) at (win-x of the image-map) by (win-y of the image-map) using (bitmap-width) wide data from (bitmap-array) with dot size (dot-size) pixels;
	otherwise:		draw a polychrome bitmap (color tint of the image-map) in (current window) at (win-x of the image-map) by (win-y of the image-map) using (bitmap-width) wide data from (bitmap-array) with dot size (dot-size) pixels and background (color background tint of the image-map);	if the image-map is graphlinked:		set a graphlink in the current window identified as image-map from win-x by win-y to win-x + (bitmap-height * dot-size) by win-y + (bitmap-height * dot-size) as the linked replacement-command of the image-map;
	[*say "[>console][CBD]Drawing polychrome bitmap [i][image-map][/i], foreground color [color foreground-color], in [i][current window][/i] with upper left ([win-x of image-map], [win-y]) and lower right ([column], [row plus dot-size])[unless background-color is g-PlaceNullCol]; background color [color background-color][end if][if image-map is graphlinked]. [line break][CBD]Graphlink corresponding to [i][image-map][/i] set from ([win-x of image-map], [win-y of image-map]) to ([column], [row plus dot-size]): [quotation mark][linked replacement-command of image-map][quotation mark][end if].[/]";*]


Chapter 1 - Rendered strings

Section 1.2 - Rendered string base classA rendered string is a kind of g-element.

The specification of rendered string is "A rendered string is a graphic element that renders an indexed text string--the 'text string' property--graphically. A rendered string must have an 'associated font' specified in order to function. Rendered strings can be left-aligned (the default), center-aligned, or right-aligned; the alignment refers to whether the origin will be the upper left, the upper center point, or the upper right of the rendered text. A cursor position can be specified (the 'cursor' property); this is a number that represents the position after which the cursor will be placed. If a number is provided for the 'text-animation delay' property, there will be a delay of that many milliseconds after each character is drawn (e.g. a text-animation delay of 100 represents approximately 1/10 of a second delay after each character in the string is painted)."
A rendered string has a font called the associated font.

[The text-animation delay allows us to draw each character as it is read, with a specified delay between them.]

A rendered string has a number called the text-animation delay. The text-animation delay is usually 0.[A rendered string can also have a cursor, which allows us to use rendered strings with input. The cursor is initially set to -99; this or any other negative number will suppress display of the cursor. A cursor value of 0 or higher will place the cursor after that character in the string. In other words, a cursor value of 2 places the cursor after the second character in the string. A cursor value greater than the number of characters in the string will never be shown.]A rendered string has a number called the cursor. The cursor is usually -99.[A rendered string has a number called the vertical ratio. The vertical ratio is usually 1.][Center and right alignment in rendered strings function differently from other g-elements; the vertical positioning does not change. This mimics the behavior of alignment in word processors, as is more appropriate for text.]A rendered string is usually left-aligned.[A rendered string is rendered either by providing a text string or a list of numbers, which represents a list of the characters of the string. The latter is faster, but more work for the author.]A rendered string has an indexed text called the text-string. The text-string of a rendered string is "".[A rendered string has a list of numbers called the parsed-string. The parsed-string of a rendered string is {0}.]A rendered string has a glulx color value called the tint. The tint of a rendered string is g-White.A rendered string has a glulx color value called the background tint. The background tint of a rendered string is g-PlaceNullCol.Section 1.2a - Private naming of rendered strings[Replace this section if you need the player to be able to refer to rendered strings.]A rendered string is privately-named.Section 1.3 - Calculate the length of a rendered stringTo decide what number is the length of (stream - a rendered string):	let len be 0;	repeat with N running from 1 to the number of characters in the text-string of the stream:		let V be the character code of position N of the text-string of the stream;		if there is a char of V in the font table of the associated font of the stream:			choose row with a char of V in the font table of the associated font of the stream;		otherwise:			choose row with a char of 32 in the font table of the associated font of the stream;		increase len by the advance entry;	decide on len.

Section 1.6 - Bitmap-rendered string classA bitmap-rendered string is a kind of rendered string.

The specification of bitmap-rendered string is "A bitmap-rendered string is a rendered string in which each glyph is drawn as a bitmap; that is, with individual pixels or 'bits' drawn directly to the screen by Glimmr. It does not require any external image files, only that a valid bitmap font (such as that provided by the Glimmr Bitmap Font extension) be specified as the 'associated font'. As with bitmaps, we can set the 'bit-size' property to set the size of each bit, and the 'tint' and 'background tint' properties to define the colors. When a background tint is provided, a single rectangle is drawn encompassing the entire text area of the rendered string."A bitmap-rendered string has a number called the bit-size. The bit-size of a bitmap-rendered string is 1.[The dot-size is set automatically by the extension. Authors need not use it.]A bitmap-rendered string has a number called the dot-size. The dot-size of a bitmap-rendered string is 1.


Section 1.6 - Prefer the null typeface (for use without Glimmr Bitmap Font by Erik Temple)
[Here we make the dummy font, defined in Glimmr Drawing Commands, the preferred font for image-rendered strings, but only if the Glimmr Bitmap Font extension is not included. Authors may replace this section to prevent this preference being set when they include a font other than the one mentioned in the name of the section.]

The associated font of a bitmap-rendered string is Null-bitmap-typeface.Section 1.7 - Centering algorithm for bitmap-rendered stringsTo decide what list of numbers is the center-point of (item - a bitmap-rendered string):	let x be entry 1 of the origin of item;	let y be entry 2 of the origin of item;	let dot-width be (bit-size of the item * length of the item) as a fixed point number;	unless using the asymmetrical scaling option:		let dx be the dot-width real times the scaling factor of the item as an integer;		let dy be the font-height of the associated font of the item real times the scaling factor of the item as an integer;	otherwise:		let dx be the dot-width real times the x-scaling factor of the item as an integer;		let dy be the font-height of the associated font of the item real times the x-scaling factor of the item as an integer;	let x be x + (dx / 2);	let y be y + (dy / 2);	let coord be {0, 0};	now entry 1 of coord is x;	now entry 2 of coord is y;	decide on coord.	Section 1.8 - Scaling rule for bitmap-rendered stringsAn element scaling rule for a bitmap-rendered string (called the stream) (this is the bitmap-rendered string scaling rule):	let the bitsize-temp be the bit-size of the stream as a fixed point number;	unless using the asymmetrical scaling option:		change the dot-size of the stream to the bitsize-temp real times the scaling factor of the current window real times the scaling factor of the stream as an integer;	otherwise:		change the dot-size of the stream to the bitsize-temp real times the scaling factor of the current window real times the x-scaling factor of the stream as an integer;	if the dot-size of the stream < 1, now the dot-size of the stream is 1;	continue.Section 1.9 - Bitmap-rendered string drawing ruleAn element display rule for a bitmap-rendered string (called the stream):	if the text-string of the stream is "" and the cursor of the stream is not 0:		[*say "[>console][BE]Rendered bitmap string [i][stream][/i] specifies no text and has not been rendered. To display only a cursor, change the cursor property of the bitmap-rendered string to 0.[/]";*]		exit;	let foreground-color be the tint of the stream;	let background-color be the background tint of the stream;	let len be the length of the stream;	if the stream is right-aligned:		change the win-x of the stream to the win-x of the stream - (len * dot-size);	if the stream is center-aligned:		change  the win-x of the stream to the win-x of the stream - (len * dot-size) / 2;	let row be the win-y of the stream;	let column be the win-x of the stream;	let column-index be column;	unless background-color is g-PlaceNullCol or the text-string of the stream is "":		draw a rectangle (color background-color) in (current window) at (column - dot-size of the stream) by (row - dot-size) with size (dot-size * len) + dot-size by (dot-size * font-height of the associated font of the stream) + dot-size;	if the cursor of the stream is 0:		draw a rectangle (color foreground-color) in (current window) at (column) by (row - dot-size) with size dot-size by (dot-size * font-height of the associated font of the stream);	if the text-string of the stream is "":		[*say "[>console][BE]Rendered bitmap string [i][stream][/i] specifies no text. Displaying cursor at position 0.[/]";*]		exit;	repeat with N running from 1 to the number of characters in the text-string of the stream:		let V be the character code of position N of the text-string of the stream;		if there is a char of V in the font table of the associated font of the stream:			choose row with a char of V in the font table of the associated font of the stream;		otherwise:			choose row with a char of 32 in the font table of the associated font of the stream;		let scan be 0;		let bitmap-size be width entry * height entry;		repeat with pointer running from (index entry + 1) to the (index entry + bitmap-size):			increase scan by 1;			if scan > width entry:				increase row by dot-size of the stream;				change column to column-index;				let scan be 1;			if entry pointer of the glyph map of the associated font of the stream is 1:				draw a rectangle (color foreground-color) in (current window) at (column) by row + (yoffset entry * dot-size) with size dot-size of the stream by dot-size;			increase column by the dot-size of the stream;		if the cursor of the stream is N:			draw a rectangle (color foreground-color) in (current window) at (column) by (win-y of the stream - dot-size) with size dot-size by (dot-size * font-height of the associated font of the stream);
		if the text-animation delay of the stream is greater than 0 and glulx timekeeping is supported:
			follow the text-painting animation rules for the stream;		increase column-index by (advance entry * dot-size of the stream);		change column to column-index;		let row be the win-y of the stream;	[*say "[>console][BE]Displaying rendered bitmap string [i][stream][/i], foreground color [color foreground-color], in [i][current window][/i] with upper left ([win-x of stream], [win-y]) and lower right ([column], [row + (font-height of the associated font of the stream * dot-size)])[unless background-color is g-PlaceNullCol]; background color [color background-color][end if][if stream is graphlinked]. [line break][BE]Graphlink corresponding to [i][stream][/i] set from ([win-x of stream], [win-y of stream]) to ([column], [row + (font-height of the associated font of the stream * dot-size)]): [quotation mark][linked replacement-command of stream][quotation mark][end if].[/]";*]	if the stream is graphlinked:		set a graphlink in the current window identified as the stream from (win-x - dot-size) by (win-y - dot-size) to column by row + (font-height of the associated font of the stream * dot-size) as the linked replacement-command of the stream;Chapter 2 - Image-rendered string classAn image-rendered string is a kind of rendered string.

The specification of image-rendered string is "An image-rendered string is a rendered string in which each glyph is drawn using a separate external PNG file; these are assigned and managed via a separate font object, which must be supplied as the 'associated font' of the rendered string. Like sprites, the rendered string can be provided its own 'scaling factor' property to adjust the size of its glyphs relative to the canvas. If the 'background tint' property is supplied (a glulx color value), a rectangle of that color will be drawn behind the rendered string."[The scaling factor is automatically calculated by the extension; authors need not utilize it.]An image-rendered string has a real number called the calculated scaling factor.Section 2.1 - Centering algorithm for image-rendered stringsTo decide what list of numbers is the center-point of (item - a image-rendered string):	let x be entry 1 of the origin of item;	let y be entry 2 of the origin of item;	let string-width be length of the item plus (2 * background-margin of the associated font of the item) as a fixed point number;	let string-height be font-height of the associated font of the item plus (2 * background-margin of the associated font of the item) as a fixed point number;	unless using the asymmetrical scaling option:		let dx be the string-width real times the scaling factor of the item as an integer;		let dy be the string-height real times the scaling factor of the item as an integer;	otherwise:		let dx be the string-width real times the x-scaling factor of the item as an integer;		let dy be the string-height real times the x-scaling factor of the item as an integer;	let x be x + (dx / 2);	let y be y + (dy / 2);	let coord be {0, 0};	now entry 1 of coord is x;	now entry 2 of coord is y;	decide on coord.	

Section 2.3 - Prefer the null typeface (for use without Glimmr Image Font by Erik Temple)
[Here we make the dummy font, defined in Glimmr Drawing Commands, the preferred font for image-rendered strings, but only if the Glimmr Image Font extension is not included. Authors may replace this section to prevent this preference being set when they include a font other than the one mentioned in the name of the section.]

The associated font of an image-rendered string is Null-image-typeface.Section 2.4 - Image-rendered string scaling ruleAn element scaling rule for an image-rendered string (called the stream) (this is the image-rendered string scaling rule):	unless using the asymmetrical scaling option: 			change the calculated scaling factor of the stream to the the scaling factor of the current window real times the scaling factor of the stream;	otherwise:		change the calculated scaling factor of the stream to the the scaling factor of the current window real times the x-scaling factor of the stream; 	continue.Section 2.5 - Image-rendered string drawing ruleAn element display rule for an image-rendered string (called the stream):
	if the text-string of the stream is "" and the cursor of the stream is not 0:
		[*say "[>console][BE]Rendered image string [i][stream][/i] specifies no text and has not been rendered. To display only a cursor, change the cursor property of the image-rendered string to 0.[/]";*]
		exit;
	let foreground-color be the tint of the stream;
	let background-color be the background tint of the stream;
	let len be the length of the stream;
	let len be len real times the calculated scaling factor of the stream as an integer;
	if the stream is right-aligned:
		change the win-x of the stream to the win-x of the stream - len;
	if the stream is center-aligned:
		change the win-x of the stream to the win-x of the stream - (len / 2);
	let row be the win-y of the stream;
	let column be the win-x of the stream;
	let cursor-weight be the cursor-width of the associated font of the stream real times the calculated scaling factor as an integer;
	if cursor-weight < 1, let cursor-weight be 1;
	let margin be background-margin of the associated font of the stream real times the calculated scaling factor as an integer;
	let vertical-size be font-height of the associated font of the stream real times the calculated scaling factor as an integer;
	unless background-color is g-PlaceNullCol or the text-string of the stream is "":
		draw a rectangle (color background-color) in (current window) at (column - margin) by (row - margin) with size (len + margin + margin) by (vertical-size + margin + margin);
	if the cursor of the stream is 0:
		draw a rectangle (color foreground-color) in (current window) at (column) by (win-y of the stream) with size cursor-weight by vertical-size;
	if the text-string of the stream is "":
		[*say "[>console][BE]Rendered bitmap string [i][stream][/i] specifies no text. Displaying cursor at position 0.[/]";*]
		exit;
	repeat with N running from 1 to the number of characters in the text-string of the stream:
		let V be the character code of position N of the text-string of the stream;
		if there is a char of V in the font table of the associated font of the stream:
			choose row with a char of V in the font table of the associated font of the stream;
		otherwise:
			choose row with a char of 32 in the font table of the associated font of the stream;
		let the chosen glyph be glyph-ref entry;
		let the yoffset be yoffset entry real times the calculated scaling factor of the stream as an integer;
		let xx be the image-width of chosen glyph;
		let yy be the image-height of chosen glyph;
		let xx be xx real times the calculated scaling factor of the stream as an integer;
		let yy be yy real times the calculated scaling factor of the stream as an integer;
		drscimage (chosen glyph) in (current window) at (column) by (row + yoffset) with dimensions (xx) by (yy);
		if the cursor of the stream is N:
			draw a rectangle (color foreground-color) in (current window) at (column + xx) by (win-y of the stream) with size cursor-weight by vertical-size;
		if the text-animation delay of the stream is greater than 0 and glulx timekeeping is supported:
			follow the text-painting animation rules for the stream;
		increase column by the advance entry real times the calculated scaling factor of the stream as an integer;
	[*say "[>console][BE]Displaying rendered image string [i][stream][/i], foreground color [color foreground-color], in [i][current window][/i] with upper left ([win-x of stream], [win-y]) and lower right ([column + margin], [row + vertical-size + margin])[unless background-color is g-PlaceNullCol]; background color [color background-color][end if][if stream is graphlinked]. [line break][BE]Graphlink corresponding to [i][stream][/i] set from ([win-x of stream], [win-y of stream]) to ([column + margin], [row + vertical-size + margin]): [quotation mark][linked replacement-command of stream][quotation mark][end if].[/]";*]
	if the stream is graphlinked:
		set a graphlink in the current window identified as the stream from (win-x - margin) by (win-y - margin) to (column + margin) by (row + vertical-size + margin) as the linked replacement-command of the stream;


Chapter 3 - Animation

The text-painting animation rules are an object-based rulebook. The text-painting animation rules have outcomes exit (success - the default) and continue.

The anim-delay is a truth state variable. The anim-delay variable translates into I6 as "anim_delay".

Include (-

Global anim_delay = 0;

-) before "Glulx.i6t".


Section - Basic animation phrases

[This is a modified version of the timed delay code from the Real-Time Delays extension. The namespace is different, however, and that extension is compatible with this one. Of course, simultaneous real-time events invoked using the two extension is a bad idea and almost certain to fail.

Note: If you invoke any of these phrases directly from your code, you should test to see "if glulx timekeeping is supported" to prevent error messages on interpreters that don't support real-time.]

To pace animation at/-- (T - a number) millisecond/milliseconds/ms:
	now anim-delay is true;
	start a T millisecond anim-timer;
	wait for the anim-timer flag.

A glulx timed activity rule (this is the redirect from timer rule):
	now the anim-delay is false;
	stop the timer.
	
To start a/-- (T - a number) millisecond anim-timer:
	(- glk_request_timer_events({T});  -)
	
To stop the/-- timer:
	(- glk_request_timer_events(0); -)
	
To wait for the anim-timer flag:
	(- EscAnimDelay(); -)

Include (-

[ EscAnimDelay key ix;
	glk_request_char_event(gg_mainwin);
	while (anim_delay) {
		glk_select(gg_event); 
		ix = HandleGlkEvent(gg_event, 1, gg_arguments); 
		if (ix >= 0 && gg_event-->0 == 2) { 
			key = gg_event-->2;
			if (key == $fffffff8) {
				anim_delay = 0;
			}
		} 
	}
	glk_cancel_char_event(gg_mainwin);  
];

-)


Section - Animated text painting rules

Last text-painting animation rule for a rendered string (called the stream) (this is the default text-painting animation rule):
	pace animation at (text-animation delay of the stream) milliseconds.Part 9 - WorkaroundsSection 9.1 - Workaround for handling empty windows[Currently, if a figure-name variable is not explicitly defined, Inform substitutes the cover art (resource ID #1). Practically, this means that it is impossible to test for an undefined figure-name, and thus it is also impossible to call an image-drawing rule without its drawing something, whether we want it to or not. This workaround allows us to explicitly define a figure-name as referring to no-figure. We should explicitly say that the currently shown picture is no-picture if we do not wish to have a image. Replace this section in your source text if it becomes unnecessary or redundant through changes to Inform.]To decide which figure-name is no-picture: (- 0 -). To decide which object is nothing: (- nothing -).Glimmr Canvas-Based Drawing ends here.


---- DOCUMENTATION ----

[The immediately quit rule is the Standard Rule that quits the game immediately.]
[Mention that element coordinates can be negative, or greater than the dimensions of the canvas.]


Chapter: Concepts

Glimmr Canvas-Based Drawing (GBCD) takes an object-oriented approach to drawing in graphics windows. The central concept is the "canvas" (called the "g-canvas" to avoid namespace conflicts). A canvas is similar to the HTML5 <canvas> element: it is a defined area within which graphic elements of various sorts can be displayed. The canvas is basically nothing more than a coordinate system, a blank page which is given certain dimensions. To display a canvas, we assign it to a graphics window (created using the Flexible Windows extension). When the window is opened, the composition we have defined will be displayed, and the canvas--along with all of the graphic elements displayed in it--will automatically be scaled to fit in the window.

The graphic elements displayed in the canvas are called "g-elements" (again, to avoid namespace clashes with your code or with other extensions). These are declared as individual objects. GCBD provides four basic types of element:

	sprite - displays an image from a file (a "figure" in Inform's terminology).
	primitive - a simple shape such as a filled rectangle, an outlined box, or an arbitrary line.
	bitmap - a complex element declared by specifying a grid of on/off or colored "bits"; similar to programming an LED sign.
	rendered string - a complex element in which either image files or bitmaps are used to render arbitrary text strings.

 The element types are discussed in more detail below. Authors can also create their own g-element types if desired; some examples are given in this documentation.

Elements are assigned to a canvas, and they can also be set either active or inactive; inactive elements will not be displayed. They can also be scaled relative to the canvas and given z-values (called "display-layer") to control the way in which objects overlap each other. If we include the Glimmr Graphic Hyperlinks extension, elements can also be made to respond in various ways to mouse input from the player.


Chapter: Basic Usage

Glimmr Canvas-Based Drawing is designed to be easy to use, but also both powerful and flexible. There are four basic steps to using it.

	1) Define a graphics window;
	2) Define a canvas to use with that window;
	3) Create elements and assign them to the canvas.
	4) Activate elements for display.

	
Section: Define a graphics window

Windows are managed by the Flexible Windows extension, and we can make use of any of the features available in that extension. It is important that the window be defined using the "graphics g-window" kind (or a descendant of this kind):

	The graphics-window is a graphics g-window spawned by the main-window.
	
You may find it useful to use the Glimmr Simple Graphics Window extension, which will do most of the configuration of the graphics window for you, including assigning a canvas (see the following section). See the Flexible Windows extension for more on creating windows.
	
We also need to be sure that we open the window at some point, using the "open up the <g-window>" phrase, and that we have provided an indication of when the window should be redrawn. For most cases, doing the latter in an every turn rule will suffice:

	Every turn: follow the refresh windows rule.


Section: Define the canvas

Defining the canvas is also quite easy. Basically, we simply declare the canvas object and associate it with a g-window:

	The graphics-canvas is a g-canvas. The associated canvas of a g-element is the graphics-canvas.
	
We should also specify the dimensions of the canvas. There are two ways to do this. We can set the width and height directly:

	The canvas-width of the graphics-canvas is 600. The canvas-height of the graphics-canvas is 300.
	
Or we can supply a background image for the canvas. The background image will be drawn underneath (that is, before) any of the elements associated with the canvas are drawn. If we have not explicitly set the canvas dimensions as described above, the background image will itself define the dimensions of the canvas. We declare the background image like this:

	The background image of the graphics-canvas is Figure of Background.
	
Again, the background image will only define the canvas dimensions for us if we have not specified dimensions, or if we have specified either the width or the height at 0. If, on the other hand, we have specified dimensions in advance, the background image will be resized to fit the previously defined dimensions. It will even be stretched to fit if need be.


Section: Create elements and assign them to the canvas

Finally, we need to create some elements (called g-elements in Inform to avoid namespace issues) and assign these to our canvas.

Elements are things, in Inform's sense of the term. The player cannot see or refer to them (they are given the "privately-named" and "scenery" properties by default), and we will generally create them off-stage, but authors can declare and manipulate them just like any other thing. 

Each type of element (sprite/image, primitive, bitmap, or text) needs to be declared with its own set of properties that define its behavior. This is generally a simple process; in fact, the Glimmr Canvas Editor extension allows you to arrange elements visually using a GUI interface and will output appropriate element definitions in I7 source code for you. Here is an example of definitions for a few different types of element:

	The Player Avatar is a sprite. The image-ID is Figure of Player. The origin is {10, 10}.

	The Violet Border is a rectangle primitive. The origin is {100, 100}. The endpoint is {200, 200}. The tint is g-Lavender.

	The Title Text is a bitmap-rendered string. The origin is {120, 110}. The text-string is "My Great Game: An Interactive Pile of Awesome". The font is Glimmr C&C. The tint is g-Red. The bit-size is 2.

(Please see the guide below for an explanation of the properties of elements.)

By the far the best way to define a set of g-elements is with a table. This is much briefer and is legible at a glance. (The Glimmr Canvas Editor can also output its source code in a tabular format.) Here is an example of such a table:

	Table of Room Elements
	sprite	origin	image-ID	display-layer	scaling factor
	Orthogonal_Room_Horizontal_1	{63, 89}	Figure of Orthogonal Room Horizontal	3	1.0000
	Orthogonal_Room_Round_1	{87, 112}	Figure of Orthogonal Room Round	3	1.0000
	Stair_Circular_1	{95, 121}	Figure of Stair Circular	4	0.7000
	Orthogonal_Hall_Vertical_1	{68, 131}	Figure of Orthogonal Hall Vertical	3	1.0000

Each g-element must be assigned to a canvas. If we have only one canvas, we can simply assign all elements to that canvas at a stroke (this is what the Glimmr Simple Graphics Window extension does):

	The associated canvas of a g-element is the graphics-canvas.

If we have more than one canvas, we can assign each element individually:

	The Player Avatar is a sprite. The image-ID is Figure of Player. The origin is {10, 10}. The associated canvas is the graphics-canvas.

In general, however, the best way to organize elements--especially when we have a lot of them--is to organize them using sub-kinds. We can then assign any property, including the associated canvas, using the appropriate sub-kind. For example, if we are making a map where each room has its own sprite (image element), we could do something like this:

	A room-sprite is a kind of a sprite. The associated canvas of a room-sprite is the map-canvas. The display-layer of a room-sprite is 2.

	Some room-sprites are defined by the Table of Room Elements.

...and now we can proceed to declare all of the room elements in a single table, and they will automatically be assigned to the appropriate canvas and display-layer.


Section: Activate elements for display

Each time a graphics window is redrawn, Glimmr iterates through the elements that are associated with that window's current canvas. If the element is marked for display, the element is drawn to the screen according to the parameters we have specified. If it is not marked for display, it is ignored. We set the display status to either g-active (marked for display) or g-inactive to initialize it.

All elements are marked for display by default, so if we say nothing about the display status of an element when we define it, it will display as soon as the appropriate graphics window is opened.

Very often, however, we do not want all of our elements on all of the time; a more dynamic approach is desired. For example, If we have designed a map in which each room is represented by a sprite, we want only the rooms that a player has visited to be displayed. We might begin by defining all of these as of the sub-kind room-sprite, and then mark all of them as initially not for display:

	A room-sprite is a kind of a sprite. The associated canvas of a room-sprite is the map-canvas. A room-sprite has a room called the associated room. The display status of a room-sprite is g-inactive. 

Now, none of our rooms will show up when the map window is first opened. If we add a rule to the rules for the looking action, which are carried out each time we enter a room, we can cause rooms to display as we enter them (note that we have added a property here to room-sprites, the "associated room," which represents the room that the sprite depicts):

	Carry out looking:
		Repeat with current-element running through room-sprites:
			if the associated room of the current-element is the location:
				if current-element is display-inactive:
					activate the current-element.

"Activate <a g-element>" is a shortened way of writing "change the display status of <g-element> to g-active." (We can also use "mark <g-element> for display".) To mark an element inactive, we use "deactivate <g-element>" or "unmark <g-element> for display". Finally, we can test whether an element is currently active or inactive by using one of the following phrases:

	if <g-element> is display-active
	if <g-element> is display-inactive

There are many appropriate ways to manage the display of elements. The examples below will provide more ideas.

And those are the basic steps in using Glimmr Canvas-Based Drawing. The remainder of this documentation explores the element types and other options in more detail, and also explores intermediate and advanced usage of the extension. Finally, the examples illustrate basic usage as well as a number of techniques that are likely to be of interest.


Chapter: Kinds of element

Section: Sprites

In common computer-graphics usage, a sprite is an independent image that comprises part of a larger scene, most commonly a two-dimensional image such as the moving characters in a video game. This definition also holds true for GCBD. (Experienced graphics folk should note that there is no "sprite sheet," however; each entity comes from a separate image file.) Sprites are likely to be the most common element used in GCBD games, being the most flexible elements and, at small to moderate sizes, also the fastest to draw.

The image files used with sprites can be in PNG or JPEG format. (PNG is recommended, since you can use alpha channels to create transparency, allowing for irregular shapes.) To use an image file as a sprite element, we must first declare the external image file (can be in PNG or JPEG format) as a figure in Inform:

	Figure of Scroll is the file "Scroll_background.png".

The figure must then be assigned to the sprite by setting the 'image-ID' property of the sprite object to the figure-name, e.g. "The image-ID of the scroll is Figure of Scroll". If you have more than a handful of sprites, it can be much faster to declare them using tables; see Chapter 15 of the Inform manual.

Like other g-elements, sprites have a coordinate pair, the "origin" property, that determines where in the canvas coordinate system the upper-left corner of the sprite will be displayed. Sprites can be scaled if desired, using the "scaling factor" property. This scaling factor is calculated before the canvas is scaled to fit the window; in other words, the scaling factor property of the sprite scales it in relation to the rest of the canvas. If the asymmetrical scaling use option is set, it will be necessary to set both the "x-scaling factor" and the "y-scaling factor" of the sprite; these can, of course, be set to different values to allow the sprite to be "stretched" to an aspect ratio other than the original aspect ratio.

Note: When sprites are intended to fit together tightly on screen, as for example image tiles, we will have more flexibility if we design the tiles so that they overlap one another. In other words, where they will abut one another, we should include an extra margin of 1-3 pixels in each image. This will ensure that, if the sprites are scaled, the inaccuracies inherent in scaling do not create visible seams between sprites.


Section: Primitives

A primitive element is a simple shape that is generally intended to be used in concert with other shapes and images to build up a composition; for example, rectangles and lines. The meaning of a graphics primitive is somewhat stretched here, since the only primitive actually provided by Glulx is a simple rectangle, whereas all of the other "primitives" provided by Glimmr Canvas-Based Drawing are in fact built up out of rectangles. The most intensive of these, the line primitive, can be made up of many, many rectangles and may be quite slow to draw. The primitives included with GBCD are:

	Rectangle primitive - A simple rectangle of color.

	Box primitive - An "empty" rectangle defined by a surrounding line of variable thickness.

	Stroked rectangle primitive - A rectangle of color surrounded by a line of another color. Basically, a rectangle primitive with a box primitive drawn around it. (Not really a "primitive", then, but the algorithm used draws this faster than using the two primitives, so it makes sense to provide it.)

	Line primitive - A straight line drawn between any two points. Horizontal and vertical lines will be the fastest to draw. Diagonal lines, especially long lines or lines approaching a 45 degree angle, can be much slower.

	Point primitive - A rectangle whose size is defined by its line-weight.

Primitives have an origin, as do all g-elements, and they also have a second coordinate pair, the "endpoint". For most primitives, the origin describes the upper left corner, while the endpoint describes the lower right corner. The line primitive, however, is freer--the two points can in fact have any relationship. Because the size of primitive elements is defined by two points on the canvas, they cannot be scaled at the element level in the same way as sprite elements can (they will, of course, scale along with the canvas).

Four primitives--the box, line, and stroked rectangle primitives--have a "line-weight" property that defines the thickness of the lines that make them up. This is the only property of primitives that responds to scaling. The response is coarse, however, because line-weight is measured in pixels. Fractional pixel measurements are not possible, and are rounded to the nearest integer. For example, if you define a line-weight of 2 pixels, the line will appear as two pixels wide when the canvas is scaled down to 75% of full size, but will appear as 1 pixel when scaled to 74% or less.

The color of a primitive is specified using the "tint" property. This is a glulx color value (see the Glulx Text Effects extension). Some primitives (the stroked rectangle) also have a "background tint" property that supplies a second color value, in this case the color of the "stroke" that surrounds the central fill of the rectangle.


Section: Bitmaps

A bitmap element draws a rectangular image composed of individual "bits" that are specified by the author in the form of a list (the "bitmap-array") that defines the status of each bit. For example, a cross might be specified like so: 

{ 0, 0, 1, 0, 0,
  0, 0, 1, 0, 0,
  1, 1, 1, 1, 1,
  0, 0, 1, 0, 0,
  0, 0, 1, 0, 0  }. 

The ones represent bits that are turned on, while the zeros represent bits that are off. The author must additionally specify the "bitmap-width" of the bitmap, which represents the number of bits that make a up a single horizontal line of the bitmap; this number tells Glimmr how to interpret the bitmap-array (if a bitmap-width is not provided, the bitmap will be interpreted as single line of bits). 

When image files such as PNGs or JPEGs are scaled, pixels can be interpolated so that the image file can be presented at virtually any scaling factor. However, the pixels of a bitmap element are set directly, and so the individual pixel is the primary unit of measurement (a bitmap displayed with a bit-size of 2 will be twice as wide and twice as high as the same bitmap displayed with a bit-size of 1). Fractional pixel measurements are not possible, and the bit-size is rounded to the nearest integer. So, if you define a bit-size of 2 pixels, the bit will be 2 pixels from 75% to 100% of full size, but will appear as 1 pixel when scaled to 74% or less. The screen size of the bitmap is determined by the bit-size and the dimensions of its grid: a 10 x 10 bitmap with a scaled bit-size of 2 will occupy 20 x 20 pixels on the screen.  

The "on" bit of a bitmap is rendered using the color provided by the "tint" property (defaults to black). The "off" bit can be implemented in one of two ways. If the "background tint" property is specified, the "off" bit will be rendered using the background color. If the "background tint" property is not set, the "off" bit will do nothing (anything drawn beneath the bitmap will show through the off bits). Both the tint and background tint properties are specified using the glulx color value kind of value (see the Glulx Text Effects extension).

There are two types of bitmaps: 

	Monochrome bitmap - Each bit is either on or off. The "on" bit is specified using 1, the "off" bit using 0.

	Polychrome bitmap - In addition to the on and off bits, any RGB color may be provided in the bitmap-array. RGB colors must be specified using a decimal version of the hexadecimal representation of the color (see Glulx Text Effects for more information). In a polychrome bitmap, the "on" bit is specified using 1, but the "off" bit is specified using 2 (rather than 0 as with a monochrome bitmap).

Polychrome bitmaps are not as human-readable as monochrome ones (white, for example, will be listed in the bitmap-array as 16777215), but they are a bit more flexible. 


Section: Rendered strings 

A rendered string is a graphic element that renders an indexed text string graphically. The string is read character by character from the element's "text string" property, and each character is drawn to the screen using either an image file or a bitmap. Note that rendered strings are not accessible to screen readers.

Rendered strings need to have a font specified in their "associated font" property in order to function. A font in this sense is a special kind of object; its major task is to link letterforms (images or bitmaps), via a lookup table, with the characters they are meant to represent. Two fonts are available with Glimmr (Glimmr Image Font and Glimmr Bitmap Font), and authors are of course free to create their own fonts (see the documentation for the Glimmr font extensions for more). 

Rendered strings can be left-aligned (the default), center-aligned, or right-aligned; the alignment determines whether the origin coordinate will represent the upper left, the upper center point, or the upper right of the rendered text. 

The display of a rendered string can be crudely animated (as if printed by a teletype machine) by specifying the "text-animation delay" property. This is a number property representing the number of milliseconds of delay after each character is drawn to the screen. This is not a continuous loop, which would be likely to irritate players, but a word of warning: each time the canvas is redrawn, the animation will restart. If you want the teletype effect to occur only once, you will need to reset the text-animation delay to 0 manually after drawing the string. (Note that interpreters based on Windows Glk have poor temporal resolution, perhaps 20-90 milliseconds. These include Windows Glulxe and Windows Git. The Gargoyle and Zoom interpreters both implement a much better timer and should give better results.)

Rendered strings can also manage the display of a cursor, which is drawn as a simple vertical line whose color is determined by the "tint" property of the rendered string (see below). This functionality is not likely to be useful except when paired with something like the Glimmr Canvas Text Input Fields extension, which handles mouse and keyboard input to allow for input to be accepted and understood via a graphics window. To display a cursor, provide a number 0 or greater via a rendered string's "cursor" property. This represents the position after which the cursor will be placed; e.g. with a cursor value of 0, the cursor will appear immediately before the first character in the string. To suppress display of the cursor (the default), provide a negative number for the cursor property.

As has been alluded to, there are two types of rendered string:

	Bitmap-rendered string - Each glyph is drawn as a bitmap; that is, with individual pixels or 'bits' drawn directly to the screen by Glimmr.

	Image-rendered string - Each glyph is drawn using a separate, external image file, preferably in PNG format.

A bitmap-rendered string  does not require any external image files, only that a valid bitmap font (such as that provided by the Glimmr Bitmap Font extension) be specified as the "associated font". As with bitmaps, we can set the "bit-size" property to set the size of each bit, and it has the same coarseness in scaling. And as with bitmaps, the "tint" and "background tint" properties define the colors of a bitmap-rendered string, with "tint" providing the color of the letterforms. When a background tint is provided, a single rectangle is drawn encompassing the entire text area of the rendered string.

A rendered string, like a sprite, can be provided its own "scaling factor" property to adjust the size of its glyphs relative to the canvas, and it scales with an accuracy comparable to that of sprite elements. If the "background tint" property is supplied (as always, a glulx color value), a rectangle of that color will be drawn behind the rendered string. The "tint" property of an image-rendered string controls only the color of the cursor; the color of the letterforms is set in the image files.


Chapter: Settings and options for scaling

Section: Asymmetrical scaling

Up to this point, we have talked about element scaling factors as if they were unitary; that is, as if both the x and y axes are always scaled by the same amount. And this is in fact true, unless we set the asymmetrical scaling use option:

	Use asymmetrical scaling

Now we can scale elements—most usefully, sprites—asymmetrically, meaning we can stretch or squeeze it along one axis more than along the other. This will often be less than pleasing aesthetically, but in some cases it can be quite useful.

Note that when this option is set, we can no longer use the "scaling factor" property for elements. Instead, we must now specify the "x-scaling factor" and the "y-scaling factor" separately. We must do this for all elements:

	The gas mask is a sprite. The x-scaling factor is 0.9800. The y-scaling factor is 0.5000.

Note that by default, both scaling factors are set to 1.0000, so we really only need to set the scaling factors if we wish to change this default.


Section: Oversize scaling

By default, Glimmr Canvas-Based Drawing will only scale a canvas up to its original size, so that 1 unit in the canvas coordinate system equates to 1 pixel on the screen (i.e., a window scaling factor of 1.0000). This ensures high-quality display, especially of sprite images. However, if we do want the canvas to be scaled beyond its original size, we can set the "oversize scaling" property of the window to true:

		The graphics-window is a graphics g-window spawned by the main-window. Oversize scaling is true.

This option can, of course, be changed during play if we want to temporarily upscale our canvas for some special effect.


Chapter: Elements and mouse input

When the Glimmr Graphic Hyperlinks extension is included, graphic elements can be hyperlinked to issue a command or try a stored action when the player clicks on the element onscreen. Glimmr will perform all of the required bookkeeping automatically; we need only define the behavior we want. In most cases, this is as simple as indicating what command should be entered at the command line when a given element is clicked.

Before a window can receive mouse input, it must be made capable of doing so. We can do this by setting the g-graphlinked property for the window:

	The graphics-window is a graphics g-window. It is g-graphlinked.

Alternatively, we can simply declare the window to be of the kind "graphlink g-window," which will set this property automatically. Note that while the property can be changed during play, this is not recommended--the window must be closed and reopened for the change to take effect.

Elements must also be set to receive graphlinks. We can do this when the element is declared by setting its "graphlink status" property to active:

	Mario is a sprite. The graphlink status is g-active.

To change the graphlink status during the course of the game, we can use these phrases:

	Activate graphlink for Mario.
	Deactivate graphlink for Mario.

And we can test whether an element is accepting mouse input by asking whether or not the element is graphlinked:

	if Mario is not graphlinked:
		activate graphlink for Mario.

We now know how to ensure that our element is accepting mouse input, but we haven't yet told it to do anything in response. The easiest way to program a response is simply to provide the text of the command in the "linked replacement-command" property (see Glimmr Graphic Hyperlinks for other approaches). This indexed text is simply the command we wish to fire when the sprite is clicked. (A linked replacement-command of "" (the default) will be perceived by the player as having had no effect.) Here's a complete definition for a hyperlinked element:

	Mario is a sprite. The image-ID is Figure of Mario. The origin is {58, 45}. The display-layer is 4. The graphlink status is g-active. The linked replacement-command is "JUMP".

And now, as long as the Mario sprite appears in the window, clicking on it with our mouse will result in the command "JUMP" being entered at the command prompt. All of the types of graphic element can be hyperlinked in this way. The entire area of the element, including transparent zones, is hyperlinked, and the hyperlink zone for any element is a single rectangle. This is most notable in the case of line primitives, because the hyperlink zone will be the smallest rectangular area that can completely enclose the line.

A graphlink-active element that overlaps another in the display layering system will supercede the lower element. That is, if Mario, on display-layer 4, partially overlaps a hyperlinked mushroom  sprite on display-layer 3, clicking within the boundaries of the rectangle that defines Mario will cause Mario's, rather than the mushroom's, linked replacement-command to be invoked.

The background of a canvas cannot be hyperlinked. We can, however, imitate a clickable background by including a fully transparent sprite image of the same dimensions as the background and placing it on the lowest display-layer (usually display-layer 1). 

A final note: if we will need to have more than 120 hyperlinked elements active at a single moment, we need to extend the number of blank rows in the Table of Graphlink Glulx Replacement Commands. Graphic Window Sprites manages this table automatically, and we should not attempt to set entries in it directly--the table is rebuilt each time the sprite drawing rules are updated, so direct edits will be disregarded in any case.


Chapter: Intermediate and advanced topics

Section: The default canvas-based drawing rule

GCBD is constructed around a single, rather complex window-drawing rule. This drawing rule is automatically used for any g-window of the kind "graphics g-window" (defined by the Flexible Windows extension). Here are the basic steps in the processing of this rule, along with what happens at each stage. For more information on details, of course, please see the code.

	1. Calculate the scaling factor for the window: Check the canvas dimensions against the window dimensions and calculate the scaling factor needed to best fit the canvas in the window.

	2. Calculate window offsets: Unless the aspect ratio of the canvas is exactly the same as the window, the scaled canvas will fall short of the window dimension along one or both axes. In this stage, we calculate the offsets necessary to center the canvas in the window.

	3. Window-framing adjustment: This phase only occurs if we have specified an origin other than {0, 0} for the window. If we have, the offsets are again adjusted to account for the fact that we have changed the window framing (see the "Framing the Window" section below).

	4. Clear the window to prepare for drawing.

	5. Draw the canvas background: If the canvas has a background image, we draw it now.

	6. Draw active graphic elements: Repeat through the display-active elements assigned to the window. For each element, we will first follow the element scaling rules for the element, and then follow the element display rules.

These steps (except for the clearing of the window) are implemented as activities, so we can add before or after rules to any of them, making the whole system very accessible to modification. Some of the topics which follow show how to "hack" the process.


Section: Using canvases to manage display

At first glance, the canvas may almost look unnecessary: elements will be displayed in a graphics window, so why not assign the element directly to the window? Why do we need the canvas to mediate?

There are really two answers. First, canvases provide an easy way to change the display content of a graphics window at a stroke. We can, for example, set up two canvases with different elements. We first show Canvas A in our graphics window, and then, when we want to change the content of the window, we simply change the associated canvas of the window to Canvas B. The next time the window refreshes, it will display our second composition.  Canvases can thus be used as discrete "pages" to be shown in a graphics window. See the "Two Canvases, One Window" example.

We can also display the same canvas in two or more windows at the same time, using different display parameters. So, if we have a detailed map that would benefit from being seen both in close-up and at long-range, we could show the map at one scale in one window, and at another in the other. See the "One Canvas, Two Windows" example.


Section: Framing the canvas

In normal usage, if the canvas is too large to fit in its associated graphics window, it will be scaled down to fit. Whether the canvas needs to be down-scaled or not, it will also be centered in the window, with offsets on two to four sides (two sides if the canvas has been scaled to fit, four if it is smaller than the window.) There are many ways that we can alter this behavior.

First, we can specify our own scaling factor for the window, the "arbitrary scaling factor." If we set this value, then the canvas will not be automatically scaled to fit the window. Instead it will simply be scaled to our specification:

	The arbitrary scaling factor of the graphics-window is 1.0000.

A ratio of 1.0000 will present the canvas without scaling it, so that one pixel onscreen will be equivalent to one coordinate unit of the canvas. The canvas may or may not fit within the window as the player has sized it, but it will still be centered within the window.

Second, a graphics window has an origin coordinate, similar to that of elements. Normally, the origin is {0, 0}, which means that the upper left corner of the canvas will be displayed in the upper left corner of the window. (In practice, this placement is usually modified by an offset that centers the canvas within the window, so that the canvas is actually displayed at the origin of the window plus the x and y, or top and left, offsets.) If we change the origin of the window, then the canvas will be framed differently. Setting the window's origin to {100, 100}, for example, will place the upper left corner of the window at canvas coordinates {100, 100}. Again, this does not account for the offsets, which we may prefer to suppress. Here is one way to suppress the calculation of offsets:

	For offset calculation of the graphics-window:
		change x-offset of the graphics-window to 0;
		change y-offset of the graphics-window to 0.

This will replace the standard behavior of the window offset calculation activity in the case of the graphics-window (only--other graphics windows would not be affected) and make sure that no offsets are used in the framing of the window.

Third, we can center the window frame on a specific point on the canvas. This must be done after the scaling and offset calculation phases of the canvas-based drawing rule; usually it will occur during the window-framing adjustment activity (step 3 of the default canvas-based drawing rule; see above). Here's how to do it:

	Before window-framing adjustment of the graphics-window:
		center the frame of the graphics-window on canvas coordinates {100, 100};
		continue the action.

This works by changing the origin coordinates of the window. In addition to specifying a coordinate (or a variable containing a coordinate pair), we can also use the special phrase "center-point" of an element, in this case the sprite "Mario":

	 Before window-framing adjustment of the graphics-window:
		center the frame of the graphics-window on the center-point of Mario;
		continue the action.

Or, more concisely, we can simply say "center the frame of the graphics-window on Mario," which will have the same effect. 

One note: if we have changed the alignment of a graphic element from left-aligned to center-aligned (see the property reference), we will need to specify this differently. Since the origin coordinate of a center-aligned element actually refers to the center-point of the element, we need to say "center the frame of the graphics-window on the origin of Mario". Centering the window on a right-aligned element will not have the desired effect.


Section: Creating new kinds of elements

The types of element defined in Glimmr Canvas-Based Drawing are, in most cases, pretty simple. They draw just one entity. But elements need not be so simple. The bitmap and rendered string elements, for example, actually draw many rectangles or images to the screen each time the element is called upon. 

We can write our own custom rules for drawing elements. The Glimmr Automap extension, for example, creates a new g-element called the map-renderer. The map-renderer iterates through grid-based map data produced by Mark Tilford's Automap extension, and for each space in the grid, it selects an appropriate tile from a tileset (the tileset is a table that relates each bit of map data to a given image). We use the element display rules to write behavior for new elements and element-kinds:

	An element display rule for the map-renderer (this is the map-renderer display rule): 
		...
		repeat with count running from 1 to (map height * map width):
		...

Element display rules also typically set a graphic hyperlink for the element being drawn. For all of the types of elements included in the extension, the shape of the hyperlinked area is a simple rectangle. Here, for example, is the element display rule for the rectangle primitive type:

	An element display rule for a rectangle primitive (called the rectangle):		draw a rectangle (color tint of the rectangle) in (current window) from (win-x) by (win-y) to (end-x) by (end-y);		if the rectangle is graphlinked:			set a graphlink in the current window identified as the rectangle from win-x by win-y to end-x by end-y as the linked replacement-command of the rectangle.

The first line draws the rectangle (see Glimmr Drawing Commands for the syntax of direct drawing commands). If the rectangle has a graphic hyperlink attached, the final line sets a rectangular hyperlink using the same coordinates as the rectangle itself occupies (see Glimmr Graphic Hyperlinks for more on hyperlinks).

There is no limit on how many entities we can draw in a single element display rule. If we wanted, for example, to have an element that displayed a sprite with a box drawn around it, we could do so:

	An element display rule for an emphasized sprite (called the highlighted item):
		draw a sprite...		draw a box...		if the highlighted item is graphlinked:			set a graphlink in the current window...

We can also set multiple hyperlinks in the same element display rule. If, for example, our g-element is L-shaped, we can set two rectangular hyperlink zones (graphic hyperlink zones are always rectangular) at right angles to one another. 


Section: Customizing element display

We can also use the element display rules to specialize behavior for one element, or for a class of elements, by prefacing or replacing the standard element display rule with another. For example, if we want to create a debugging command to print the name and origin coordinates of each g-element to the main window as it is drawn to our graphics window, we could do something like this:

	First element display rule for a g-element (called the item):
		say "Element [item] drawn at [origin of the item in brace notation].";
		continue.

The "continue" is important, because by default the element display rulebook will terminate once a rule completes. The continue directive allows Inform to look for subsequent rules in the rulebook. (We can also use "continue the action," Inform's standard phrasing, but the element display rules provide "continue" as a shortened form; "exit" similarly serves as a shortened form of "rule succeeds.")


Section: Elements as objects in the world model

Since elements are objects, like any other entity of Inform's "thing" kind, we can use their location in space to manage display. If we want an image (or images) to display only when the player is in a certain room, we could put the element object in that room and indicate that elements should only be depicted when the element object is in scope (in most cases, this will be when the player is also in the room). For example, this rule would run before the default canvas-based drawing rule and activate the appropriate elements for display:

	First window-drawing rule for a graphics g-window (called the present window):
		repeat with item running through g-elements assigned to the present window:
			if the item can be seen by the player:
				activate item;
			otherwise:
				deactivate item;
		continue the action.

We could also potentially use other aspects of g-elements--particularly their relationships with one another--as means of organizing their display. I leave users to think about whether this kind of thing might have advantages for them. 

If for some reason we actually want players to be able to see, pick up, and refer to elements as if they were objects in the game world, we can replace the section of the code that conceals them from the player, like this:

	Section - Revealing elements (in place of Section - Concealing elements in Glimmr Canvas-Based Drawing by Erik Temple)With the body of this section left blank, the privately-named and scenery properties are not set for g-elements, and we can now treat g-elements like any other kind of object: the player will be now able to see and interact with them. Note that g-elements, just like other objects, will be created "off-stage" unless we actively place them in specific rooms.


Chapter: Troubleshooting

Runtime error "cannot divide by zero" (or similar):

	The background has probably not been defined. Be sure you define the background such that it will have been defined before any of the sprite drawing rules fires. 

Inform doesn't recognize the "image-ID" property, or a table in which it is used:

	Inform requires a figure to be defined in the source before it can be referred to. Be sure that your figures are defined in the source *above* the text in which you are attempting to define the associated sprites.

When I click on a hyperlinked element, the game prints a blank line at the command prompt, and then prints my replacement command:

	This is how Glk is designed; it is unavoidable on most interpreters. A new version of the Glk standard will change this, and Glimmr will be updated when this happens. As of this writing, all major Glulx interpreters will respond in this way except for Zoom, which does not insert the extra line. If possible, you may want to recommend Zoom to your OS X and Linux players.

Performance issues:

	Be sure that your images are not too large. Images should be sized no larger than you want them to appear onscreen. Note that games played within the Inform IDE will be slower than games played in an external interpreter. Try pressing the Release button to produce a blorb file, and play that file in the latest version of a fast, modern interpreter. Better yet, test your game in all the interpreters you can get your hands on, and recommend the best interpreter(s) to your players. (At the time of this writing, Gargoyle and Zoom are both well optimized for graphics and other multimedia effects. Spatterlight on OS X is not, and also has a poor UI for mouse input. Windows Glulxe and Windows Git have a low-resolution timer, and neither is quite as fast with graphic display as Gargoyle, but they should be adequate for most purposes.)


Chapter: Producing images for use with Glimmr

Full instructions for producing images are well beyond the scope of this documentation, but a few notes and links will be useful. For almost all purposes, you will want to produce your images in PNG (Portable Networks Graphics) format. PNG graphics (file extension .png) can contain an "alpha channel" that defines transparent areas of the image, allowing for shapes that are not rectangular. They can be produced with Photoshop, of course, but also with many other programs, including the free, cross-platform GIMP software (http://www.gimp.org). Here are some sites that might be of use to you if you are unfamiliar with PNG graphics (Inform tends to mangle URL spacing in documentation, so you may need to edit these by hand or open the extension itself and copy the links from there into your browser): 

	http://en.wikipedia.org/wiki/Portable_Network_Graphics
	http://www.libpng.org/pub/png/pngintro.html
	http://www.axialis.com/tutorials/tutorial-misc001.html (Photoshop tutorial)
	http://www.fabiovisentin.com/tutorial/GIMP_transparent_image/gimp_how_to_make_transparent_image.asp (GIMP tutorial)

Avoid making your images too large. Images should be sized no larger than you want them to appear onscreen.


Chapter: A reference to elements and their properties

Here is a list of properties common to all graphic elements (g-elements). Separate sections for each of the element types follows. Properties which the extension uses internally and should not be referred to by the author are also included. These are marked with a double asterisk (**).

	associated canvas - the g-canvas with which the element is currently associated. The element will be considered for drawing to the screen when this canvas is drawn.

	display status - indicates whether or not the element is marked for display (i.e., whether or not it will be drawn to the associated canvas of the element when the  window displaying that canvas is updated). Can be g-active (marked for display) or g-inactive. Default value: g-active

	origin - the x and y coordinates where the element's drawing will be commenced. These coordinates refer to the coordinate system of the canvas and indicate where the upper-left corner of the element will be drawn (usually; see alignment properties below) . The origin coordinates are expressed as a list of exactly two numbers in brace notation. Default value: {0, 0}

	display-layer - a number that defines the "layer" the element will be drawn to, comparable to the z-index in CSS/HTML. Elements with a display-layer of 1 are drawn first, then those with display-layer 2, etc. Lower numbers are thus lower in the stack order. Default value: 1

	scaling factor - a ratio for scaling the element in relation to its associated canvas. A decimal quantity with four-digit precision, e.g. 0.5000 would scale a sprite image to 50% of its original size (different element types are differentially affected by the scale property; see the discussion of element types above for more information). Actual size is expressed as 1.0000; ratios greater than 1.0000 are allowed (e.g., 2.0000 is equivalent to 200% of actual size). An element's actual displayed size is also subject to adjustment by the window-scaling factor. Default value: 1.0000

	x-scaling factor - only available when the asymmetrical scaling use option is in force (the scaling factor property is disabled by this same use option). Like the scaling factor property, a decimal quantity with four-digit precision. Scales only the x-axis of an element; most useful for sprites. Default value: 1.0000

	y-scaling factor - only available when the asymmetrical scaling use option is in force (the scaling factor property is disabled by this same use option). Like the scaling factor property, a decimal quantity with four-digit precision. Scales only the y-axis of an element; most useful for sprites. Default value: 1.0000

	alignment - defines how an element is drawn in relation to its origin property. When left-aligned, the origin will describe the upper left corner of the element. When center-aligned, the origin will describe the center of the x and y axes of the element. When right-aligned, the origin will describe the lower right corner. It is probably best to declare an element left-aligned whenever possible. Default value: left-aligned

	graphlink status - indicates whether or not the element is accepting mouse input. Can be g-active (marked for display) or g-inactive. Default value: g-inactive

	linked replacement-command - an indexed text containing a command that should be entered on the player's behalf when an element has received a mouse-click. The command will be automatically printed to the command line and parsed after clicking. Default value: "" (empty string, will have no visible effect) 

	win-x** - represents the x-coordinate of the element's origin AFTER it has been scaled according to the window's scaling factor; i.e., it refers to the position of the element in the window's coordinate system, not the canvas's. Default value: 0

	win-y** - represents the y-coordinate of the element's origin AFTER it has been scaled according to the window's scaling factor; i.e., it refers to the position of the element in the window's coordinate system, not the canvas's. Default value: 0


Section: Summary of sprite properties

This section presents a list of the properties associated with sprites, including those that we should not try to set directly. Properties of the latter sort--those which the extension uses internally and should not be referred to by the author--are marked with a double asterisk (**). All sprites also inherit the properties common to the g-element kind (see above for those properties).

	image-ID: the figure-name of the sprite's associated image file. The default value is null, which can be tested using the special token "no-picture".

	sprite-x**: A number that refers to the width of the sprite image after scaling calculations--the final size of the sprite as displayed on screen. Default value: 0

	sprite-y**: A number that refers to the height of the sprite image after scaling calculations--the final size of the sprite as displayed on screen. Default value: 0


Section: Summary of the primitive base class's properties

This section presents a list of the properties associated with all primitive elements, including rectangle, box, stroked rectangle, line, and point primitives. Properties which the extension uses internally, and should not be referred to by the author, are marked with a double asterisk (**). All primitives also inherit the properties common to the g-element kind (see above for those properties).

	origin - the x and y coordinates where the element's drawing will be completed. These coordinates refer to the coordinate system of the canvas and usually indicate where the lower right corner of the element will be drawn. In the case of line primitives, the origin and endpoint are more or less interchangeable, neither has priority. The endpoint coordinates are expressed as a list of exactly two numbers in brace notation. Default value: {0, 0}

	tint - a glulx color value (see the Glulx Text Effects extension) that defines the color of the primitive; in the case of the stroked rectangle primitive, this represents the color of the fill fo the rectangle. Default value: g-White

	end-x** - represents the x-coordinate of the primitive's origin AFTER it has been scaled according to the window's scaling factor; i.e., it refers to the position of the endpoint in the window's coordinate system, not the canvas's. Default value: 0

	end-y** - represents the y-coordinate of the primitive's origin AFTER it has been scaled according to the window's scaling factor; i.e., it refers to the position of the endpoint in the window's coordinate system, not the canvas's. Default value: 0


Section: Summary of the properties of the box, stroked rectangle, line, and point primitives

This section presents a list of the properties associated with the box, stroked rectangle, line, and point primitives; i.e., those primitives that have a line of variable thickness. Properties which the extension uses internally, and should not be referred to by the author, are marked with a double asterisk (**). These primitives also inherit the properties common to the primitive kind, and to the g-element kind (see above for those properties).

	line-weight - the width, in pixels, of either (1) the outline of the box or stroked rectangle primitive; (2) the line of the line primitive; or (3) the square of the point primitive. Default value: 1

	stroke** - represents the line-weight of the primitive as scaled into the window's coordinate system (i.e., the final thickness of the line as displayed on the screen, in pixels. Default value: 1


Section: Summary of the properties of the stroked rectangle primitive

This section presents a list of the properties associated with the stroked rectangle primitive. Since the stroked rectangle is the only primitive that can incorporate two colors, we use the background tint property to supply the second color (the color of the line). Stroked rectangle primitives also inherit the properties common to the primitive and the g-element kinds (see above for those properties).

	background tint - a glulx color value (see the Glulx Text Effects extension) that defines the color of the outline surrounding the central rectangle of the stroked rectangle primitive; i.e., the color of the "stroke" as opposed to the "fill." Default value: g-White


Section: Summary of the properties of bitmaps

This section presents a list of the properties associated with both monochrome and polychrome bitmaps. Properties which the extension uses internally, and should not be referred to by the author, are marked with a double asterisk (**). All bitmap elements also inherit the properties common to the g-element kind (see above for those properties).

	bitmap-array - a list of numbers, written in brace notation, that defines the on and off bits of a bitmap element. Monochrome bitmaps can include only 0 ("off") or 1 ("on"). Polychrome bitmaps may include any number from 0 to 16777215, defining a decimally packed 16-bit RGB number; in a polychrome bitmap, the "on" bit is 1, while the "off" bit is 2. Default value: {0}

	bitmap-width - a number defining the width, in bits, of a bitmap. Thus, if our bitmap is five columns wide, the bitmap-width will be 5. Default value: 1

	tint - a glulx color value (see the Glulx Text Effects extension) that defines the color of the "on" bit of a bitmap. (The "on" bit is given by a 1 in the bitmap-array for both types of bitmap.) Default value: g-White

	background tint - a glulx color value (see the Glulx Text Effects extension) that defines the color of the background of the bitmap. This color will appear wherever an "off" bit has been specified. (The "off" bit is given by 0 for monochrome bitmaps, and by 2 for polychrome bitmaps.) Default value: g-PlaceNullCol (the null color value, meaning no background will be drawn)

	bit-size - the size, relative to the canvas, of each bit in the bitmap. A bit-size of 2 will be two units wide and two units high. The bit-size is subject to scaling both by the scaling factor (or x-scaling factor) of the bitmap element, and by the window scaling factor. Default value: 1

	dot-size** - the final display size of each bit in the bitmap, measured in pixels as output on-screen. Default value: 1

	bitmap-height** - counterpart to the bitmap-width measurement; calculated automatically by dividing the length of the bitmap-array by the author-provided bitmap-width. Default value: 1

Section: Summary of the properties of rendered strings

This section presents a list of the properties associated with rendered strings. Properties which the extension uses internally, and should not be referred to by the author, are marked with a double asterisk (**). All rendered strings also inherit the properties common to the g-element kind (see above for those properties).

Note that the alignment property functions differently for rendered strings than for other g-elements. For center-aligned and right-aligned rendered strings, the origin is always located along the upper edge of the element; not at the center or the bottom edge.

	associated font - a font object, which is the font that should be used to draw the rendered text element. A bitmap-rendered text must use a bitmap font, and an image-rendered font an image font.

	text-string - an indexed text containing the string to be rendered by the element. Default value: "" (empty string, no output)

	tint - a glulx color value (see the Glulx Text Effects extension) that defines the color of the letterforms and cursor of a bitmap-rendered string; defines only the cursor color of an image-rendered string. Default value: g-White

	background tint - a glulx color value (see the Glulx Text Effects extension) that defines the color of the background of the rendered string element. Will be drawn as a single block of color behind the letterforms. Default value: g-PlaceNullCol (null, no background will appear)

	text-animation delay - a number defining the number of milliseconds that will be delayed after the drawing of each character of the text-string. Default value: 0
	
	cursor - a number defining the position of the cursor in the display of the rendered string. The cursor is only displayed when this property is 0 or higher. The cursor wil placed immediately after the string position; i.e., when cursor is 1, the cursor will be positioned immediately after the first character in the string. Default value: -99 (no cursor displayed)


Section: Summary of the properties of bitmap-rendered strings

This section presents a list of the properties associated with bitmap-rendered strings. These are more or less equivalent to the properties of bitmap elements. Properties which the extension uses internally, and should not be referred to by the author, are marked with a double asterisk (**). All bitmap-rendered strings also inherit the properties common to the g-element and rendered string kinds (see above for those properties).

	bit-size - the size, relative to the canvas, of each bit in the bitmaps of the associated font's letterforms. For example, a bit-size of 2 will be two units wide and two units high. The bit-size is subject to scaling both by the scaling factor (or x-scaling factor) of the rendered-string, and by the window scaling factor. Default value: 1

	dot-size** - the final display size of each bit in the bitmaps of the associated font's letterforms, measured in pixels as output on-screen. Default value: 1

	
Section: Summary of the properties of image-rendered strings

This section presents a list of the properties associated with image-rendered strings. Properties which the extension uses internally, and should not be referred to by the author, are marked with a double asterisk (**). All image-rendered strings also inherit the properties common to the g-element and rendered string kinds (see above for those properties).

	calculated scaling factor** - a real number (decimal with four-digit precision) that represents the scaling factor of both the window and the rendered string element. 


Example: *** Basic Floorplan - A toolset including images for use in constructing basic floorplans for indoor maps, as well as illustrating most of the basic options available. Also illustrates the use of user-specified source text and tags to create automatic mapping capabilities.


	*: "Basic Floorplan"



Example: ** Two Canvases, One Window - Switching between canvases to change the contents of our graphics window at a stroke.


Example: ** One Canvas, Two Windows - We want to show the player's location on a map, but the full map is so large that it leaves us unable to see details. This example explores one solution to this problem, displaying the full map in one graphics window, and showing a detail view, an inset, in a second window.

This example illustrates one way to do this, by displaying the same canvas in two different windows, with each window having different framing parameters. We have a larger graphics window on the left, displaying the full map, scaled to fit in the window. A smaller window on the right displays a close-up of the map, centered on the player's location.

 Because this by itself is too easy, we also provide the ability to "TOGGLE" between two means of showing the player's location: a placemarker, a la Google Maps, and a box marking on the full map the area shown in the inset view. The latter will serve to illustrate how we can dynamically resize elements based on the size of our windows. 

	*: "Glimmr One Canvas Two Windows"

	Include Glimmr Canvas-Based Drawing by Erik Temple.
	Include Glimmr Simple Graphics Window by Erik Temple.

	Figure of Rhodes is the file "Rhodes.jpg".
	Figure of Placemark is the file "Placemark.png".

	The background image of the graphics-canvas is Figure of Rhodes.

	The measurement of the graphics-window is 50. The position of the graphics-window is g-placeabove.

We use the graphics window provided by Glimmr Simple Graphics Window to display the full map view. Here we define the closeup-window, the g-window that will show the inset. Note that we assign the same canvas to the closeup-window as to the main graphics-window. We display the map by making it the background image of the graphics-canvas. We also set the closeup-window to a scaling factor of 1.0000 (i.e., 100%), so that the map will always be displayed without scaling.

We then assign x,y coordinates to each room. These coordinates will determine where the placemarker will be placed, and will also serve as the center of the frame of the closeup-window; that is, we will display the graphics-canvas in the closeup-window such that the window is centered over this point. This is done using the window-framing adjustment activity and the "center the framing..." phrase.

	*: The closeup-window is a graphics g-window spawned by the graphics-window. The position is g-placeright. The measurement is 25. The associated canvas is graphics-canvas.

	The arbitrary scaling factor of the closeup-window is 1.0000.

	A room has a list of numbers called the origin. The origin is usually {0, 0}.
	Some rooms are defined by the Table of Room Origins.

	For window-framing adjustment of the closeup-window:
		center the framing of closeup-window on the origin of the location;
		continue the action.

We offer the player the choice to display the current location on the map using either a placemarker (a pointer), or a rectangle that reflects the area of the larger map that is displayed in the closeup-window; the former is implemented as a sprite/image, while the latter is a box primitive. As with other maps, we update the status of these primarily in the carry out looking rules, since the looking rules are always consulted when the player moves between rooms. The currently chosen option is put into a global variable called the placemarker, which we will use to determine how the properties of the element should be updated.

	*: The associated canvas of a g-element is the graphics-canvas.

	Pointer is a sprite. The image-ID is Figure of Placemark.

	Map Inset is a box primitive. The tint is g-White. The display status is g-inactive. The line-weight is 2.

	Toggling view is an action applying to nothing. Understand "toggle" or "toggle map" or "toggle placemarker" as toggling view.

	The placemarker is a g-element variable. The placemarker is the pointer.

	Carry out toggling view:
		if the placemarker is the pointer:
			now the placemarker is the map inset;
			activate the placemarker;
			deactivate pointer;
		otherwise:
			now the placemarker is the pointer;
			activate the placemarker;
			deactivate map inset;
		refresh windows;
		say "The placemarker will now be displayed [if the placemarker is the pointer]as an image[otherwise]using a box to depict the area displayed in the closeup window[end if]."

	Carry out looking:
		follow the refresh windows rule;
		continue the action.

We don't want to display the marker in the closeup-window, so we simply skip it during the drawing sequence for that window (closeup-window placemarker rule). We then use the drawing active elements activity as a hook for calculating the origins (and endpoint) of the placemarker elements. This activity is a good place for this since it is the activity that controls the scaling and drawing of all elements.

The calculation for the map inset element, which is the box primitive that outlines on the large map the area displayed in the closeup-window, is more interesting. This calculation (the map inset placement rule) uses the room coordinates, the dimensions of the canvas, and the dimensions of the closeup-window to calculate the placement and sizing of the map inset.  

Note the use of "continue the action" at the end of each rule. Most of the rules and activities in Canvas-Based Drawing end automatically in success, so we need to provide explicit continuation in order to use the rest of the rulebook. In this case, the drawing the active elements activity needs to go on to actually draw the elements, not just calculate placement.

	*: Element display rule for the placemarker when the current window is the closeup-window (this is the closeup-window placemarker rule):
		do nothing.
	
	For drawing the active elements when the placemarker is the pointer (this is the pointer placement rule):
		change the origin of the placemarker to the origin of the location;
		continue the action;
	
	For drawing the active elements when the placemarker is the map inset (this is the map inset placement rule):
		change entry 1 of the origin of the placemarker to (entry 1 of the origin of the location) - (width of closeup-window / 2);
		change entry 2 of the origin of the placemarker to (entry 2 of the origin of the location) - (height of the closeup-window / 2);
		change entry 1 of the endpoint of the placemarker to (entry 1 of the origin of placemarker) + (width of closeup-window);
		change entry 2 of the endpoint of the placemarker to (entry 2 of the origin of placemarker) + (height of closeup-window);
		continue the action;

	Table of Room Origins
	room	origin
	West Tower	{90, 197}
	East End of Tower Street	{335, 268}
	West End of Tower Street	{193, 256}


	West End of Tower Street is east of West Tower.  East End of Tower Street is east of West End.

	When play begins:
		open up graphics-window;
		open up the closeup-window.




