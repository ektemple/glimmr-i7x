Version 1/100602 of Glimmr Drawing Commands (for Glulx only) by Erik Temple begins here.

[Look hard at whether to keep the bipartite scheme for drawing; i.e., the base command plus a secondary command that writes to the console.]
[Make sure that by/x is available for both coordinates and dimensions of all commands.]
[Need to add back in the tile-size specifications for image-maps, after the new version is available that allows it.]

"Provides commands for drawing images, shape primitives (such as rectangles, boxes, and lines), user-specified bitmaps, and for text-painting using 'fonts' with glyphs composed of either bitmaps or image files."


Part - Inclusions

Include version 9 of Flexible Windows by Jon Ingold.
Include version 3 of Fixed Point Maths by Michael Callaghan.


Part - Use options

Use MAX_ARRAYS of 3000.


Part - Console settings
[This is a macro that allows the extension to identify itself in the Glimmr console window with fewer keystrokes on my part.]

To say DC:
	say "[bracket]Glimmr DC[close bracket]: ".


Part - Global variables
[The global variables support a very brief form of drawing command; they are not used for the standard length commands.]

The current graphics window is a graphics g-window that varies.
The current foreground-color is a number that varies. The current foreground-color is 0.
The current background-color is a number that varies. The current background-color is 0.


Part - Primitives


Chapter - Rectangles


Section - Dimensioned rectangle
[The dimensioned rectangle reflects Glulx Inform's I6-level rectangle command, which provides dimensions for the rectangle rather than start and endpoints. It is intended to be used internally by other commands, and as such does not itself generate console messages.]

To draw/display a/-- rectangle/rect (hue - a number) in (win - a g-window) at (x1 - a number) by/x (y1 - a number) with size/dimensions (width - a number) by/x (height - a number):
	(- DrawDimRect({hue}, {win}, {x1}, {y1}, {width}, {height}); -)

To draw/display a/-- rectangle/rect (hue - a number) in (win - a g-window) at (coord1 - a list of numbers) with size/dimensions (width - a number) by/x (height - a number):
	let x1 be entry 1 of coord1;
	let y1 be entry 2 of coord1;
	draw a rectangle (hue) in (win) at (x1) by (y1) with size (width) by (height);

To rect/rectangle (coord1 - a list of numbers) size (width - a number) by/x (height - a number):
	if the current graphics window is not a graphics g-window:
		rule fails;
	let x1 be entry 1 of coord1;
	let y1 be entry 2 of coord1;
	draw a rectangle (current foreground-color) in current graphics window at x1 by y1 with size width by height;


Include (-

[ DrawDimRect hue win x1 y1 width height ;
	if (win.ref_number) {
		glk_window_fill_rect(win.ref_number, hue, x1, y1, width, height);
	}
];

-).


Section - Rectangle

To rectdraw (hue - a number) in (win - a g-window) from (x1 - a number) by (y1 - a number) to (x2 - a number) by (y2 - a number):
	(- DrawRect({hue}, {win}, {x1}, {y1}, {x2}, {y2}); -)

To draw/display a/-- rectangle/rect (hue - a number) in (win - a g-window) from (x1 - a number) by/x (y1 - a number) to (x2 - a number) by/x (y2 - a number):
	rectdraw (hue) in (win) from (x1) by (y1) to (x2) by (y2);
	only if utilizing Glimmr debugging;
	if basic drawing command debugging is true:
		say "[>console][DC]Drawing a rectangle of color [hue] in [i][win][/i] with upper left ([x1], [y1]) and lower right ([x2], [y2]).[<]";
	end only if.

To draw/display a/-- rectangle/rect (hue - a number) in (win - a g-window) from (coord1 - a list of numbers) to (coord2 - a list of numbers):
	let x1 be entry 1 of coord1;
	let y1 be entry 2 of coord1;
	let x2 be entry 1 of coord2;
	let y2 be entry 2 of coord2;
	rectdraw (hue) in (win) from (x1) by (y1) to (x2) by (y2).

To rect/rectangle (coord1 - a list of numbers) to (coord2 - a list of numbers):
	if the current graphics window is not a graphics g-window:
		say "[>console][DC]*** Error: Short-form rectangle-drawing directive ignored. The current graphics window global was not specified.[<]";
		rule fails;
	let x1 be entry 1 of coord1;
	let y1 be entry 2 of coord1;
	let x2 be entry 1 of coord2;
	let y2 be entry 2 of coord2;
	rectdraw (current foreground-color) in (current graphics window) from (x1) by (y1) to (x2) by (y2).

Include (-

[ DrawRect hue win x1 y1 x2 y2 ;
	if (win.ref_number) {
		glk_window_fill_rect(win.ref_number, hue, x1, y1, x2 - x1, y2 - y1 );
	}
];

-).


Chapter - Outlined rectangles


Section - Box

To boxdraw (hue - a number) in (win - a g-window) from (x1 - a number) by (y1 - a number) to (x2 - a number) by (y2 - a number) with (wgt - a number), outlined or inset:
	(- DrawBox({hue}, {wgt}, {win}, {x1}, {y1}, {x2}, {y2}, {phrase options}); -)

To draw/display a/-- box (hue - a number) in (win - a g-window) from (x1 - a number) by/x (y1 - a number) to (x2 - a number) by/x (y2 - a number) with (wgt - a number) pixel/pixels/px/-- line-weight/stroke, outlined or inset:
	if outlined:
		boxdraw (hue) in (win) from (x1) by (y1) to (x2) by (y2) with (wgt), outlined;		
	otherwise if inset:
		boxdraw (hue) in (win) from (x1) by (y1) to (x2) by (y2) with (wgt), inset;
	otherwise:
		boxdraw (hue) in (win) from (x1) by (y1) to (x2) by (y2) with (wgt);
	only if utilizing Glimmr debugging;
	if basic drawing command debugging is true:
		say "[>console][DC]Drawing a box of color [hue] in [i][win][/i] with upper left ([x1], [y1]) and lower right ([x2], [y2]), line-weight [wgt] px[if outlined]; line is drawn outside the bounds of the box[otherwise if inset]; line is drawn inside the bounds of the box[end if].[<]";
	end only if;

To draw/display a/-- box (hue - a number) in (win - a g-window) from (coord1 - a list of numbers) to (coord2 - a list of numbers) with (wgt - a number) pixel/pixels/px/-- line-weight/stroke, outlined or inset:
	let x1 be entry 1 of coord1;
	let y1 be entry 2 of coord1;
	let x2 be entry 1 of coord2;
	let y2 be entry 2 of coord2;
	if outlined:
		boxdraw (hue) in (win) from (x1) by (y1) to (x2) by (y2) with (wgt), outlined;
	otherwise if inset:
		boxdraw (hue) in (win) from (x1) by (y1) to (x2) by (y2) with (wgt), inset;
	otherwise:
		boxdraw (hue) in (win) from (x1) by (y1) to (x2) by (y2) with (wgt);
		
To box (coord1 - a list of numbers) to (coord2 - a list of numbers) at (wgt - a number) px/pixels/pixel, outlined or inset: 
	if the current graphics window is not a graphics g-window:
		only if utilizing Glimmr debugging;
		if basic drawing command debugging is true:
			say "[>console][DC]*** Error: Short-form box-drawing directive ignored. The current graphics window global was not specified.[<]";
		end only if;
		rule fails;
	let x1 be entry 1 of coord1;
	let y1 be entry 2 of coord1;
	let x2 be entry 1 of coord2;
	let y2 be entry 2 of coord2;
	if outlined:
		boxdraw (current foreground-color) in (current graphics window) from (x1) by (y1) to (x2) by (y2) with (wgt), outlined;
	otherwise if inset:
		boxdraw (current foreground-color) in (current graphics window) from (x1) by (y1) to (x2) by (y2) with (wgt), inset;
	otherwise:
		boxdraw (current foreground-color) in (current graphics window) from (x1) by (y1) to (x2) by (y2) with (wgt).


Include (-

[ DrawBox hue wgt win x1 y1 x2 y2 outline_opt ;
! Draws four rectangles that outline the coordinates given as input on the I7 level.
	if (win.ref_number) {
		if (outline_opt & 2) {
			glk_window_fill_rect(win.ref_number, hue, x1, y1, x2 - x1, wgt);
			glk_window_fill_rect(win.ref_number, hue, x2 - wgt, y1, wgt, y2 - y1);
			glk_window_fill_rect(win.ref_number, hue, x1, y2 - wgt, x2 - x1, wgt);
			glk_window_fill_rect(win.ref_number, hue, x1, y1, wgt, y2 - y1);
		}
		if (outline_opt & 1) {
			glk_window_fill_rect(win.ref_number, hue, x1 - wgt, y1 - wgt, wgt + x2 - x1, wgt);
			glk_window_fill_rect(win.ref_number, hue, x2, y1 - wgt, wgt, wgt + y2 - y1);
			glk_window_fill_rect(win.ref_number, hue, x1 - wgt, y2, wgt + wgt + x2 - x1, wgt);
			glk_window_fill_rect(win.ref_number, hue, x1 - wgt, y1 - wgt, wgt, wgt + y2 - y1);
		}
		if (~~outline_opt) {
			glk_window_fill_rect(win.ref_number, hue, x1 - (wgt / 2), y1 - (wgt / 2), x2 - x1, wgt);
			glk_window_fill_rect(win.ref_number, hue, x2 - (wgt / 2), y1 - (wgt / 2), wgt, (y2 - y1) + wgt);
			glk_window_fill_rect(win.ref_number, hue, x1 - (wgt / 2), y2 - (wgt / 2), x2 - x1, wgt);
			glk_window_fill_rect(win.ref_number, hue, x1 - (wgt / 2), y1 - (wgt / 2), wgt, y2 - y1);
		}
	}
];

-).


Section - Stroked Rectangle

To strectdraw (hue - a number) in (win - a g-window) from (x1 - a number) by (y1 - a number) to (x2 - a number) by (y2 - a number) with (wgt - a number) stroke of (color - a number):
	(- DrawStrokedRect({hue}, {wgt}, {win}, {x1}, {y1}, {x2}, {y2}, {color}); -)

To draw/display a/-- rectangle/rect (hue - a number) in (win - a g-window) from (x1 - a number) by/x (y1 - a number) to (x2 - a number) by/x (y2 - a number) with (wgt - a number) pixel/pixels/px/-- line-weight/stroke (color - a number):
	strectdraw (hue) in (win) from (x1) by (y1) to (x2) by (y2) with (wgt) stroke of (color);
	only if utilizing Glimmr debugging;
	if basic drawing command debugging is true:
		say "[>console][DC]Drawing a stroked rectangle of color [hue] in [i][win][/i] with upper left ([x1], [y1]) and lower right ([x2], [y2]); stroke of line-weight [wgt] pixels (color [color]) drawn inside the bounds of the box.[<]";
	end only if;

To draw/display a/-- rectangle/rect (hue - a number) in (win - a g-window) from (coord1 - a list of numbers) to (coord2 - a list of numbers) with (wgt - a number) pixel/pixels/px/-- line-weight/stroke (color - a number):
	let x1 be entry 1 of coord1;
	let y1 be entry 2 of coord1;
	let x2 be entry 1 of coord2;
	let y2 be entry 2 of coord2;
	strectdraw (hue) in (win) from (x1) by (y1) to (x2) by (y2) with (wgt) stroke of (color).

To rect/rectangle (coord1 - a list of numbers) to (coord2 - a list of numbers) at (wgt - a number) px/pixels/pixel:
	if the current graphics window is not a graphics g-window:
		only if utilizing Glimmr debugging;
		if basic drawing command debugging is true:
			say "[>console][DC]*** Error: Short-form rectangle-drawing directive ignored. The current graphics window global was not specified.[<]";
		end only if;
		rule fails;
	let x1 be entry 1 of coord1;
	let y1 be entry 2 of coord1;
	let x2 be entry 1 of coord2;
	let y2 be entry 2 of coord2;
	strectdraw (current foreground-color) in (current graphics window) from (x1) by (y1) to (x2) by (y2) with (wgt) stroke of (current background-color).

Include (-

[ DrawStrokedRect hue wgt win x1 y1 x2 y2 color;
	if (win.ref_number) {
		glk_window_fill_rect(win.ref_number, color, x1, y1, x2 - x1, y2 - y1 );
		glk_window_fill_rect(win.ref_number, hue, x1 + wgt, y1 + wgt, (x2 - x1) - (wgt * 2), (y2 - y1) - (wgt * 2) );
	}
];

-).


Chapter - Lines


Section - Basic line
[The code for drawing a line between any two points was ported from the GREX module of the GWindows system by L. Ross Raszewski (http://gwindows.trenchcoatsoft.com). The code is there indicated to having been based on code by Paul Heckbert.]

To linedraw (hue - a number) in (win - a graphics g-window) from (x1 - a number) by/x (y1 - a number) to (x2 - a number) by/x (y2 - a number) with (wgt - a number):
	let dd be x2 - x1;
	if dd >= 0:
		let ax be 2 times dd;
		let sx be 1;
	otherwise:
		let ax be -2 times dd;
		let sx be -1;
	let dd be y2 - y1;
	if dd >= 0:
		let ay be 2 times dd;
		let sy be 1;
	otherwise:
		let ay be -2 times dd;
		let sy be -1;
	let x be x1;
	let y be y1;
	if ax > ay:
		let x1 be 1;
		let d be ay - (ax / 2);
		while x is not x2:
			if d >= 0:
				let y be y + sy;
				let d be d - ax;
			let x be x plus sx;
			let d be d plus ay;
			if x is x2 or y is not y1:
				if sx > 0:
					draw rectangle (hue) in win at (x - x1) by y1 with size x1 by wgt;
				otherwise:
					draw a rectangle (hue) in win at x by y1 with size x1 by wgt;
				let y1 be y;
				let x1 be 1;
			otherwise:
				increase x1 by 1;
	otherwise:
		let y1 be 1;
		let d be ax - (ay / 2);
		while y is not y2:
			if d >= 0:
				let x be x + sx;
				let d be d - ay;
			let y be y + sy;
			let d be d + ax;
			if x is not x1 or y is y2:
				if sy > 0:
					draw rectangle (hue) in win at x1 by (y - y1) with size wgt by y1;
				otherwise:
					draw a rectangle (hue) in win at x1 by y with size wgt by y1;
				let y1 be 1;
				let x1 be x;
			otherwise:
				increase y1 by 1;


To draw a/-- line (hue - a number) in (win - a graphics g-window) from (x1 - a number) by/x (y1 - a number) to (x2 - a number) by/x (y2 - a number) with (wgt - a number) pixel/pixels/px/-- line-weight/stroke:
	only if utilizing Glimmr debugging;
	if basic drawing command debugging is true:
		say "[>console][DC]Drawing a line of color [hue] in [i][win][/i] from ([x1], [y1]) to ([x2], [y2]), line-weight [wgt] pixels.[<]";
	end only if;
	linedraw (hue) in (win) from (x1) by (y1) to (x2) by (y2) with (wgt).
		

To draw a/-- line (hue - a number) in (win - a graphics g-window) from (coord1 - a list of numbers) to (coord2 - a list of numbers) with (wgt - a number) pixel/pixels/px/-- line-weight/stroke:
	let x1 be entry 1 of coord1;
	let y1 be entry 2 of coord1;
	let x2 be entry 1 of coord2;
	let y2 be entry 2 of coord2;
	Draw a line (hue) in win from x1 by y1 to x2 by y2 with wgt pixel line-weight.

To line (coord1 - a list of numbers) to (coord2 - a list of numbers) at (wgt - a number) px/pixel/pixels:
	if the current graphics window is not a graphics g-window:
		only if utilizing Glimmr debugging;
		if basic drawing command debugging is true:
			say "[>console][DC]*** Error: Short-form line-drawing directive ignored. The current graphics window global was not specified.[<]";
		end only if;
		rule fails;
	let x1 be entry 1 of coord1;
	let y1 be entry 2 of coord1;
	let x2 be entry 1 of coord2;
	let y2 be entry 2 of coord2;
	Draw a line (current foreground-color) in current graphics window from x1 by y1 to x2 by y2 with wgt pixel line-weight.
	

Section - Line using angle + distance

To draw a line (hue - a number) in (win - a graphics g-window) from (x1 - a number) by (y1 - a number) measuring/of (distance - a number) pixel/pixels/-- long/-- at (angle - a number) deg/degree/degrees/-- angle/-- with (wgt - a number) pixel/pixels/px/-- line-weight/stroke:
	let xx be (sine of angle) * distance as an integer;
	let yy be (cosine of angle) * distance as an integer;
	let x2 be x1 + xx;	
	let y2 be y1 - yy;
	Draw a line (hue) in (win) from (x1) by (y1) to (x2) by (y2) with (wgt) pixel line-weight.
	
To draw a line (hue - a number) in (win - a graphics g-window) from (coord1 - a list of numbers) measuring (distance - a number) pixels/pixel/-- long/-- at (angle - a number) deg/degree/degrees/-- angle/-- with (wgt - a number) pixel/pixels/px/-- line-weight/stroke:
	let x1 be entry 1 of coord1;
	let y1 be entry 2 of coord1;
	Draw a line (hue) in (win) from (x1) by (y1) measuring (distance) pixels at (angle) with (wgt) pixel line-weight.

To line (coord1 - a list of numbers) dist/distance (distance - a number) px/pixels/pixel (angle - a number) deg/degree/degrees/angle (wgt - a number) px/pixels/pixel wgt/wt/weight/--:
	let x1 be entry 1 of coord1;
	let y1 be entry 2 of coord1;
	Draw a line (current foreground-color) in (current graphics window) from (x1) by (y1) measuring (distance) pixels at (angle) with (wgt) pixel line-weight.

To decide what number is (rad - a real number) rad/radians:
	decide on rad in degrees as an integer.


Chapter - Images


Section - Image

To drimage (ID - a figure name) in (win - a g-window) at (x1 - a number) by (y1 - a number):
	(- DrawImage({ID}, {win}, {x1}, {y1}); -)

To display/draw the/-- image/-- (ID - a figure name) in (win - a g-window) at (x1 - a number) by/x (y1 - a number):
	only if utilizing Glimmr debugging;
	if basic drawing command debugging is true:
		say "[>console][DC]Drawing image [ID] in [i][win][/i] at ([x1], [y1]).[<]";
	end only if;
	drimage (ID) in (win) at (x1) by (y1).

To display/draw the/an/-- image/-- (ID - a figure name) in (win - a g-window) at (coord1 - a list of numbers):
	let x1 be entry 1 of coord1;
	let y1 be entry 2 of coord1;
	drimage (ID) in (win) at (x1) by (y1).

To image (ID - a figure name) at (coord1 - a list of numbers):
	if the current graphics window is not a graphics g-window:
		rule fails;
	let x1 be entry 1 of coord1;
	let y1 be entry 2 of coord1;
	drimage (ID) in (current graphics window) at (x1) by (y1).

Include (-

[DrawImage ID win x y ;
	if (win.ref_number) {
		glk_image_draw(win.ref_number, ResourceIDsOfFigures-->ID, x, y);
	}
];  

-).


Section - Image with specified size

To drscimage (ID - a figure name) in (win - a g-window) at (x1 - a number) by/x (y1 - a number) with size/dimensions (width - a number) by/x (height - a number):
	(- DrawImageScaled({ID}, {win}, {x1}, {y1}, {width}, {height}); -)
	
To display/draw the/an/-- image/-- (ID - a figure name) in (win - a g-window) at (x1 - a number) by/x (y1 - a number) with size/dimensions (width - a number) by/x (height - a number):
	only if utilizing Glimmr debugging;
	if basic drawing command debugging is true:
		say "[>console][DC]Drawing image [ID] in [i][win][/i] at ([x1], [y1]), scaled to dimensions [width] x [height].[<]";
	end only if;
	drscimage (ID) in (win) at (x1) by (y1) with dimensions (width) by (height).

To display/draw the/an/-- image/-- (ID - a figure name) in (win - a g-window) at (coord1 - a list of numbers) with size/dimensions (width - a number) by/x (height - a number):
	let x1 be entry 1 of coord1;
	let y1 be entry 2 of coord1;
	drscimage (ID) in (win) at (x1) by (y1) with dimensions (width) by (height).

To image (ID - a figure name) at (coord1 - a list of numbers) size (width - a number) by/x (height - a number):
	if the current graphics window is not a graphics g-window:
		rule fails;
	let x1 be entry 1 of coord1;
	let y1 be entry 2 of coord1;
	drscimage (ID) in (current graphics window) at (x1) by (y1) with dimensions (width) by (height).


Include (-

[DrawImageScaled ID win x y image_x image_y ;
	if (win.ref_number) {
		glk_image_draw_scaled(win.ref_number, ResourceIDsOfFigures-->ID, x, y, image_x, image_y);
	}
];  

-).


Part - Drawing bitmaps

[Bitmaps are drawn by coloring individual pixels (or pixels in groups), and are specified by the user using an I7 list. Since they are drawn by setting pixels, they cannot be scaled as PNG or JPEG images can.]


Chapter - Monochrome bitmaps


Section - Monochrome bitmap with background color

To draw/display a/-- monochrome bitmap (HUE - a number) in (WIN - a g-window) at (X1 - a number) by/x (Y1 - a number) using (WDT - a number) bit/-- wide data of/from/-- (BIT_MAP - a list of numbers) with dot/-- size (WGT - a number) pixel/pixels/px/-- and background (bkgd - a number):
	let row be Y1;
	let column be X1;
	let the bit-height be the number of entries of BIT_MAP divided by WDT;
	draw a rectangle (BKGD) in (WIN) at (column) by (row) with size (WDT * WGT) by (bit-height * WGT);
	let scan be 0;
	repeat with index running through BIT_MAP:
		increase scan by 1;
		if scan > WDT:
			increase row by WGT;
			change column to X1;
			let scan be 1;
		if index > 0:
			draw a rectangle (HUE) in (WIN) at (column) by (row) with size (WGT) by (WGT);
		increase column by WGT.

To draw/display a/-- monochrome bitmap (HUE - a number) in (WIN - a g-window) at (COORD1 - a list of numbers) using (WDT - a number) bit/-- wide data of/from/-- (BIT_MAP - a list of numbers) with dot/-- size (WGT - a number) pixel/pixels/px/-- and background (bkgd - a number):
	let x1 be entry 1 of coord1;
	let y1 be entry 2 of coord1;
	display a monochrome bitmap (HUE) in (WIN) at (X1) by (Y1) using (WDT) wide data of (BIT_MAP) with dot size (WGT) px and background (BKGD).


Section - Monochrome bitmap without background color

To draw/display a/-- monochrome bitmap (HUE - a number) in (WIN - a g-window) at (X1 - a number) by/x (Y1 - a number) using (WDT - a number) bit/-- wide data of/from/-- (BIT_MAP - a list of numbers) with dot/-- size (WGT - a number) pixel/pixels/px/--:
	let row be Y1;
	let column be X1;
	let scan be 0;
	repeat with index running through BIT_MAP:
		increase scan by 1;
		if scan > WDT:
			increase row by WGT;
			change column to X1;
			let scan be 1;
		if index > 0:
			draw a rectangle (HUE) in (WIN) at (column) by (row) with size (WGT) by (WGT);
		increase column by WGT.

To draw/display a/-- monochrome bitmap (HUE - a number) in (WIN - a g-window) at (COORD1 - a list of numbers) using (WDT - a number) bit/-- wide data of/from/-- (BIT_MAP - a list of numbers) with dot/-- size (WGT - a number) pixel/pixels/px/--:
	let x1 be entry 1 of coord1;
	let y1 be entry 2 of coord1;
	display a monochrome bitmap (HUE) in (WIN) at (X1) by (Y1) using (WDT) wide data of (BIT_MAP) with dot size (WGT) px.


Section - Short forms

To monochrome/bi bitmap/bmp (BIT_MAP - a list of numbers) at (COORD1 - a list of numbers) width (WDT - a number) dot/-- size (WGT - a number) pixel/pixels/px/--, backgrounded:
	let x1 be entry 1 of coord1;
	let y1 be entry 2 of coord1;
	if backgrounded:
		display a monochrome bitmap (current foreground-color) in (current graphics window) at (X1) by (Y1) using (WDT) wide data of (BIT_MAP) with dot size (WGT) px and background (current background-color);
	otherwise:
		display a monochrome bitmap (current foreground-color) in (current graphics window) at (X1) by (Y1) using (WDT) wide data of (BIT_MAP) with dot size (WGT) px.


Chapter - Polychrome bitmaps

[In a polychrome bitmap, we can set a decimal version of any hex RGB-color we like in our bitmap array. To save typing (decimalized hex numbers are long), we can also set one of two special values. The first, a basic foreground color, is written as 1 in the bitmap array, utilizes the color we set in our drawing phrase. The other special value, written as 2 in the bitmap array, is a null value--it draws nothing to the screen. If we have specified a background color, we will see that background color wherever 2 is present in our bitmap array.]


Section - Polychrome bitmap with background color

To draw/display a/-- polychrome bitmap (HUE - a number) in (WIN - a g-window) at (X1 - a number) by/x (Y1 - a number) using (WDT - a number) bit/-- wide data of/from/-- (BIT_MAP - a list of numbers) with dot/-- size (WGT - a number) pixel/pixels/px/-- and background (bkgd - a number):
	let row be Y1;
	let column be X1;
	let the bit-height be the number of entries of BIT_MAP divided by WDT;
	draw a rectangle (BKGD) in (WIN) at (column) by (row) with size (WDT * WGT) by (bit-height * WGT);
	let scan be 0;
	repeat with index running through BIT_MAP:
		increase scan by 1;
		if scan > WDT:
			increase row by WGT;
			change column to X1;
			let scan be 1;
		if index is 1:
			draw a rectangle (HUE) in (WIN) at (column) by (row) with size (WGT) by (WGT);
		unless index is 1 or index is 2:
			draw a rectangle (index) in (WIN) at (column) by (row) with size (WGT) by (WGT);
		increase column by WGT.

To draw/display a/-- polychrome bitmap (HUE - a number) in (WIN - a g-window) at (COORD1 - a list of numbers) using (WDT - a number) bit/-- wide data of/from/-- (BIT_MAP - a list of numbers) with dot/-- size (WGT - a number) pixel/pixels/px/-- and background (bkgd - a number):
	let x1 be entry 1 of coord1;
	let y1 be entry 2 of coord1;
	display a polychrome bitmap (HUE) in (WIN) at (X1) by (Y1) using (WDT) wide data of (BIT_MAP) with dot size (WGT) px and background (BKGD).


Section - Polychrome bitmap without background color

To draw/display a/-- polychrome bitmap (HUE - a number) in (WIN - a g-window) at (X1 - a number) by/x (Y1 - a number) using (WDT - a number) bit/-- wide data of/from/-- (BIT_MAP - a list of numbers) with dot/-- size (WGT - a number) pixel/pixels/px/--:
	let row be Y1;
	let column be X1;
	let scan be 0;
	repeat with index running through BIT_MAP:
		increase scan by 1;
		if scan > WDT:
			increase row by WGT;
			change column to X1;
			let scan be 1;
		if index is 1:
			draw a rectangle (HUE) in (WIN) at (column) by (row) with size (WGT) by (WGT);
		unless index is 1 or index is 2:
			draw a rectangle (index) in (WIN) at (column) by (row) with size (WGT) by (WGT);
		increase column by WGT.

To draw/display a/-- polychrome bitmap (HUE - a number) in (WIN - a g-window) at (COORD1 - a list of numbers) using (WDT - a number) bit/-- wide data of/from/-- (BIT_MAP - a list of numbers) with dot/-- size (WGT - a number) pixel/pixels/px/--:
	let x1 be entry 1 of coord1;
	let y1 be entry 2 of coord1;
	display a polychrome bitmap (HUE) in (WIN) at (X1) by (Y1) using (WDT) wide data of (BIT_MAP) with dot size (WGT) px.


Section - Short forms

To polychrome/poly bitmap/bmp (BIT_MAP - a list of numbers) at (COORD1 - a list of numbers) width (WDT - a number) dot/-- size (WGT - a number) pixel/pixels/px/--, backgrounded:
	let x1 be entry 1 of coord1;
	let y1 be entry 2 of coord1;
	if backgrounded:
		display a polychrome bitmap (current foreground-color) in (current graphics window) at (X1) by (Y1) using (WDT) wide data of (BIT_MAP) with dot size (WGT) px and background (current background-color);
	otherwise:
		display a polychrome bitmap (current foreground-color) in (current graphics window) at (X1) by (Y1) using (WDT) wide data of (BIT_MAP) with dot size (WGT) px.


Chapter - Fonts


Section - The font base class

A font is a kind of thing. 
A font has a table name called the font table.
A font has a number called the font-height. The font-height is usually 1.
A font has some text called the colophon. The colophon is usually "".


Section - Private naming of fonts
[Replace this section if you need the player to be able to refer to fonts.]

A font is privately-named.


Section - Bitmap fonts

A bitmap font is a kind of font.
A bitmap font has a list of numbers called the glyph map. The glyph map is usually {0}.


Section - Dummy bitmap typeface
[Inform requires that there be at least one font in the world. Here we include a dummy font object, which can also be used as a null-object should we need it.]

Null-bitmap-typeface is a bitmap font. 
The font table of a bitmap font is usually the Table of Null Bitmap Font Parameters.

Table of Null Bitmap Font Parameters
glyph	char	index	width	height	yoffset	advance
indexed text	number	number	number	number	number	number
with 1 blank row


Section - Image-based fonts

An image-based font is a kind of font.
An image-based font has a number called the cursor-width. The cursor-width is usually 1.

[The background-margin defines how far outside the bounds of the characters the background color should be drawn. This will be scaled by both the window and "sprite" scaling factors.]
An image-based font has a number called the background-margin. The background-margin is usually 1.


Section - Null image typeface
[Inform requires that there be at least one font in the world. Here we include a dummy font object, which can also be used as a null-object should we need it.]

Null-image-typeface is an image-based font.
The font table of an image-based font is usually the Table of Null Image Font Parameters.

Table of Null Image Font Parameters
glyph	char	glyph-ref	yoffset	advance
indexed text	number	figure name	number	number
with 1 blank row


Section - Crediting fonts

Report requesting the story file version (this is the announce colophon rule):
	repeat with typeface running through the list of fonts:
		unless the colophon of the typeface is "":
			say "[one of]Typefaces used in graphics windows:[line break][or][stopping][colophon of the typeface][line break]"


Chapter - Text-painting with bitmap fonts


Section - Bitmap strings with a background color

To paint/display a/-- bitmap text (hue - a number) of (str - indexed text) in (win - a g-window) at (X1 - a number) by/x (Y1 - a number) using font/-- (typf - a font) with dot/-- size (wgt - a number) pixel/pixels/px/-- and background (bkgd - a number), center-aligned or right-aligned:
	unless STR is "":
		let LEN be the length of STR set in TYPF;
		if right-aligned:
			let X1 be X1 - (LEN * WGT);
		if center-aligned:
			let X1 be X1 - (LEN * WGT) / 2;
		change current g-row to Y1;
		change current g-column to X1;
		let column-index be current g-column;
		draw a rectangle (BKGD) in (WIN) at (current g-column - WGT) by (current g-row - WGT) with size (WGT * LEN) + WGT by (WGT * font-height of TYPF) + WGT;
		repeat with N running from 1 to the number of characters in STR:
			let V be the character code of position N of STR;
			if there is a char of V in the font table of TYPF:
				choose row with a char of V in the font table of TYPF;
			otherwise:
				choose row with a char of 32 in the font table of TYPF;
			let scan be 0;
			let bitmap-size be width entry * height entry;
			repeat with pointer running from (index entry + 1) to (index entry + bitmap-size):
				increase scan by 1;
				if scan > width entry:
					increase current g-row by WGT;
					change current g-column to column-index;
					let scan be 1;
				if entry pointer of the glyph map of TYPF is 1:
					draw a rectangle (HUE) in WIN at (current g-column) by current g-row + (yoffset entry * WGT) with size WGT by WGT;
				increase current g-column by WGT;
			increase column-index by (advance entry * WGT);
			change current g-column to column-index;
			change current g-row to Y1;

To paint/display a/-- bitmap text (hue - a number) of (str - indexed text) in (win - a g-window) at (coord1 - a list of numbers) using font/-- (typf - a font) with dot/-- size (wgt - a number) pixel/pixels/px/-- and background (bkgd - a number), center-aligned or right-aligned:
	let x1 be entry 1 of coord1;
	let y1 be entry 2 of coord1;
	if center-aligned:
		paint bitmap text (HUE) of (STR) in (WIN) at (X1) by (Y1) using (TYPF) with size (WGT) and background (BKGD), center-aligned;
		rule succeeds;
	if right-aligned:
		paint bitmap text (HUE) of (STR) in (WIN) at (X1) by (Y1) using (TYPF) with size (WGT) and background (BKGD), right-aligned;
		rule succeeds;
	paint bitmap text (HUE) of (STR) in (WIN) at (X1) by (Y1) using (TYPF) with size (WGT) and background (BKGD).


Section - Bitmap strings without a background color

To paint/display a/-- bitmap text (hue - a number) of (str - indexed text) in (win - a g-window) at (X1 - a number) by/x (Y1 - a number) using font/-- (typf - a font) with/-- dot/-- size (wgt - a number) pixel/pixels/px/--, center-aligned or right-aligned:
	unless STR is "":
		let LEN be the length of STR set in TYPF;
		if right-aligned:
			let X1 be X1 - (LEN * WGT);
		if center-aligned:
			let X1 be X1 - (LEN * WGT) / 2;
		change current g-row to Y1;
		change current g-column to X1;
		let column-index be current g-column;
		repeat with N running from 1 to the number of characters in STR:
			let V be the character code of position N of STR;
			if there is a char of V in the font table of TYPF:
				choose row with a char of V in the font table of TYPF;
			otherwise:
				choose row with a char of 32 in the font table of TYPF;
			let scan be 0;
			let bitmap-size be width entry * height entry;
			repeat with pointer running from (index entry + 1) to (index entry + bitmap-size):
				increase scan by 1;
				if scan > width entry:
					increase current g-row by WGT;
					change current g-column to column-index;
					let scan be 1;
				if entry pointer of the glyph map of TYPF is 1:
					draw a rectangle (HUE) in WIN at (current g-column) by current g-row + (yoffset entry * WGT) with size WGT by WGT;
				increase current g-column by WGT;
			increase column-index by (advance entry * WGT);
			change current g-column to column-index;
			change current g-row to Y1;

To paint/display a/-- bitmap text (hue - a number) of (str - indexed text) in (win - a g-window) at (coord1 - a list of numbers) using font/-- (typf - a font) with dot/-- size (wgt - a number) pixel/pixels/px/--, center-aligned or right-aligned:
	let x1 be entry 1 of coord1;
	let y1 be entry 2 of coord1;
	if center-aligned:
		paint bitmap text (HUE) of (STR) in (WIN) at (X1) by (Y1) using (TYPF) with size (WGT), center-aligned;
		rule succeeds;
	if right-aligned:
		paint bitmap text (HUE) of (STR) in (WIN) at (X1) by (Y1) using (TYPF) with size (WGT), right-aligned;
		rule succeeds;
	paint bitmap text (HUE) of (STR) in (WIN) at (X1) by (Y1) using (TYPF) with size (WGT).


Section - Brief forms

To bitmap/bmp text/txt (STR - indexed text) at (COORD1 - a list of numbers) size (WGT - a number) pixel/pixels/px/-- backgrounded/background/bkgd, center-aligned or right-aligned:
	if the current graphics window is not a graphics g-window:
		rule fails;
	let x1 be entry 1 of coord1;
	let y1 be entry 2 of coord1;
	if center-aligned:
		paint a bitmap text (current foreground-color) of (STR) in (current graphics window) at (X1) by (Y1) using (current font) with dot size (WGT) and background (current background-color), center-aligned;
		rule succeeds;
	if right-aligned:
		paint a bitmap text (current foreground-color) of (STR) in (current graphics window) at (X1) by (Y1) using (current font) with dot size (WGT) and background (current background-color), right-aligned;
		rule succeeds;
	otherwise:
		paint a bitmap text (current foreground-color) of (STR) in (current graphics window) at (X1) by (Y1) using (current font) with dot size (WGT) and background (current background-color).

To bitmap/bmp text/txt (STR - indexed text) at (COORD1 - a list of numbers) size (WGT - a number) pixel/pixels/px/--, center-aligned or right-aligned:
	if the current graphics window is not a graphics g-window:
		rule fails;
	let x1 be entry 1 of coord1;
	let y1 be entry 2 of coord1;
	if center-aligned:
		paint a bitmap text (current foreground-color) of (STR) in (current graphics window) at (X1) by (Y1) using (current font) with dot size (WGT), center-aligned;
		rule succeeds;
	if right-aligned:
		paint a bitmap text (current foreground-color) of (STR) in (current graphics window) at (X1) by (Y1) using (current font) with dot size (WGT), right-aligned;
		rule succeeds;
	otherwise:
		paint a bitmap text (current foreground-color) of (STR) in (current graphics window) at (X1) by (Y1) using (current font) with dot size (WGT).
		

Chapter - Text-painting with image-based fonts


Section - Text-painting with a background color

To paint/display an/-- image-based text of/-- (STR - indexed text) in (win - a g-window) at (X1 - a number) by/x (Y1 - a number) using font/-- (TYPF - a font) scaled at (SCF - a real number) with background (BKGD - a number) and margin of/-- (MARGIN - a number) pixel/pixels/px/--, center-aligned or right-aligned:
	unless STR is "":
		let LEN be the length of STR set in TYPF;
		let LEN be LEN real times SCF as an integer;
		if right-aligned:
			let X1 be X1 - LEN;
		if center-aligned:
			let X1 be X1 - (LEN / 2);
		change current g-row to Y1;
		change current g-column to X1;
		let vertical-size be font-height of TYPF real times SCF as an integer;
		draw a rectangle (BKGD) in (WIN) at (current g-column - MARGIN) by (current g-row - MARGIN) with size (LEN + MARGIN + MARGIN) by (vertical-size + MARGIN + MARGIN);
		repeat with N running from 1 to the number of characters in STR:
			let V be the character code of position N of STR;
			if there is a char of V in the font table of TYPF:
				choose row with a char of V in the font table of TYPF;
			otherwise:
				choose row with a char of 32 in the font table of TYPF;
			let the chosen glyph be glyph-ref entry;
			let the yoffset be yoffset entry real times SCF as an integer;
			change g-imgwidth to the image-width of chosen glyph;
			change g-imgheight to the image-height of chosen glyph;
			change g-imgwidth to g-imgwidth real times SCF as an integer;
			change g-imgheight to g-imgheight real times SCF as an integer;
			drscimage (chosen glyph) in (WIN) at (current g-column) by (current g-row + yoffset) with dimensions (g-imgwidth) by (g-imgheight);
			increase current g-column by the advance entry real times SCF as an integer;

To paint/display an/-- image-based text (hue - a number) of (str - indexed text) in (win - a g-window) at (coord1 - a list of numbers) using font/-- (typf - a font) scaled at (SCF - a real number) with background (BKGD - a number) and margin of/-- (MARGIN - a number) pixel/pixels/px/--, center-aligned or right-aligned:
	let x1 be entry 1 of coord1;
	let y1 be entry 2 of coord1;
	if center-aligned:
		paint image-based text of (STR) in (WIN) at (X1) by (Y1) using (TYPF) scaled at (SCF) with background (BKGD) and margin (MARGIN), center-aligned;
		rule succeeds;
	if right-aligned:
		paint image-based text of (STR) in (WIN) at (X1) by (Y1) using (TYPF) scaled at (SCF) with background (BKGD) and margin (MARGIN), right-aligned;
		rule succeeds;
	paint image-based text of (STR) in (WIN) at (X1) by (Y1) using (TYPF) scaled at (SCF) with background (BKGD) and margin (MARGIN).


Section - Text-painting without a background color

To paint/display an/-- image-based text of/-- (STR - indexed text) in (win - a g-window) at (X1 - a number) by/x (Y1 - a number) using font/-- (TYPF - a font) scaled at (SCF - a real number), center-aligned or right-aligned:
	unless STR is "":
		let LEN be the length of STR set in TYPF;
		let LEN be LEN real times SCF as an integer;
		if right-aligned:
			let X1 be X1 - LEN;
		if center-aligned:
			let X1 be X1 - (LEN / 2);
		change current g-row to Y1;
		change current g-column to X1;
		let vertical-size be font-height of TYPF real times SCF as an integer;
		repeat with N running from 1 to the number of characters in STR:
			let V be the character code of position N of STR;
			if there is a char of V in the font table of TYPF:
				choose row with a char of V in the font table of TYPF;
			otherwise:
				choose row with a char of 32 in the font table of TYPF;
			let the chosen glyph be glyph-ref entry;
			let the yoffset be yoffset entry real times SCF as an integer;
			change g-imgwidth to the image-width of chosen glyph;
			change g-imgheight to the image-height of chosen glyph;
			change g-imgwidth to g-imgwidth real times SCF as an integer;
			change g-imgheight to g-imgheight real times SCF as an integer;
			drscimage (chosen glyph) in (WIN) at (current g-column) by (current g-row + yoffset) with dimensions (g-imgwidth) by (g-imgheight);
			increase current g-column by the advance entry real times SCF as an integer;

To paint/display an/-- image-based text (hue - a number) of (str - indexed text) in (win - a g-window) at (coord1 - a list of numbers) using font/-- (typf - a font) scaled at (SCF - a real number), center-aligned or right-aligned:
	let x1 be entry 1 of coord1;
	let y1 be entry 2 of coord1;
	if center-aligned:
		paint image-based text of (STR) in (WIN) at (X1) by (Y1) using (TYPF) scaled at (SCF), center-aligned;
		rule succeeds;
	if right-aligned:
		paint image-based text of (STR) in (WIN) at (X1) by (Y1) using (TYPF) scaled at (SCF), right-aligned;
		rule succeeds;
	paint image-based text of (STR) in (WIN) at (X1) by (Y1) using (TYPF) scaled at (SCF).


Section - Brief forms

To image/img text/txt (STR - indexed text) at (COORD1 - a list of numbers) scaled/scale (SCF - a real number) margin (MARGIN - a number) pixels/pixel/px, center-aligned or right-aligned:
	if the current graphics window is not a graphics g-window:
		rule fails;
	let x1 be entry 1 of coord1;
	let y1 be entry 2 of coord1;
	if center-aligned:
		paint an image-based text of (STR) in (current graphics window) at (X1) by (Y1) using (current font) scaled at (SCF) with background (current background-color) and margin (MARGIN) px, center-aligned;
		rule succeeds;
	if right-aligned:
		paint an image-based text of (STR) in (current graphics window) at (X1) by (Y1) using (current font) scaled at (SCF) with background (current background-color) and margin (MARGIN) px, right-aligned;
		rule succeeds;
	otherwise:
		paint an image-based text of (STR) in (current graphics window) at (X1) by (Y1) using (current font) scaled at (SCF) with background (current background-color) and margin (MARGIN) px.

To image/img text/txt (STR - indexed text) at (COORD1 - a list of numbers) scaled/scale (SCF - a real number), center-aligned or right-aligned:
	if the current graphics window is not a graphics g-window:
		rule fails;
	let x1 be entry 1 of coord1;
	let y1 be entry 2 of coord1;
	if center-aligned:
		paint an image-based text of (STR) in (current graphics window) at (X1) by (Y1) using (current font) scaled at (SCF), center-aligned;
		rule succeeds;
	if right-aligned:
		paint an image-based text of (STR) in (current graphics window) at (X1) by (Y1) using (current font) scaled at (SCF), right-aligned;
		rule succeeds;
	otherwise:
		paint an image-based text of (STR) in (current graphics window) at (X1) by (Y1) using (current font) scaled at (SCF).


Part - Image-maps

Chapter - Definition of the tileset kind

[Optionally, the translation-table can have a column called "linked command" that defines a replacement command to be used when that tile is clicked with the mouse.]

A tileset is a kind of thing.

The specification of a tileset is "A tileset is an object that specifies the tiles to be used in an image map. It should refer to a 'translation-table' that assigns numbers ('char' column) to figure names ('tile' column). If we want to assign graphic hyperlinks to individual tiles of the image-map, we can also specify a 'linked command' column, which contains the text of a replacement command to be associated with the hyperlinked image (used by Glimmr Canvas-Based Drawing).

A tileset must also set, via its 'tile-width' and 'tile-height' properties, integer dimensions for each tile or cell of the image-maps to be associated with the tileset. (These can be overridden as necessary in drawing commands or using image-map element properties in Canvas-Based Drawing.) "

A tileset has a number called the tile-width. The tile-width is usually 0.
A tileset has a number called the tile-height. The tile-height is usually 0.

A tileset has a table name called the translation-table.

[These should only be present in the Glimmr Automap tilesets. Make a new subkind.

A tileset has a list of real numbers called the zoom-level set. The zoom-level set of a tileset is usually {}.

A tileset has a number called the initial zoom level. The initial zoom level of a tileset is usually 1.]


Section - Null tileset

[We provide a minimal tileset to use as a null placeholder.]

The null tileset is a tileset. The translation-table is Table of Null Tilesetting.

Table of Null Tilesetting
Char	Tile
number	figure name
1	Figure of Null


Chapter - Image-map with figure array

Section - Long forms

To draw/display an/-- image-map in (WIN - a g-window) at (X1 - a number) by/x (Y1 - a number) using (WDT - a number) wide data of/from/-- (IMG_MAP - a list of figure names) with tile-size (W - a number) by/x (H - a number) pixel/pixels/px/--:
	let row be Y1;
	let column be X1;
	let total-height be the number of entries of IMG_MAP / WDT;
	let scan be 0;
	repeat with index running from 1 to the number of entries in IMG_MAP:
		increase scan by 1;
		if scan > WDT:
			increase row by H;
			change column to X1;
			let scan be 1;
		unless entry index of IMG_MAP is Figure of Null:
			drscimage (entry index of IMG_MAP) in (WIN) at (column) by (row) with dimensions (W) by (H);
		increase column by W;
	only if utilizing Glimmr debugging;
	if basic drawing command debugging is true:
		say "[>console][DC]Image-map drawn at screen coordinates ([X1], [Y1]) of [WIN] using the list of figure names provided, interpreted as a grid [WDT] tiles wide and [total-height] tiles high. Tile size used: [W] by [H] pixels.[<]";
	end only if;

To draw/display an/-- image-map in (WIN - a g-window) at (X1 - a number) by/x (Y1 - a number) using (WDT - a number) wide data of/from/-- (IMG_MAP - a list of figure names) with tile-size (W - a number) by/x (H - a number) pixel/pixels/px/-- and background (BKGD - a number):
	let total-height be the number of entries of IMG_MAP / WDT;
	rectdraw (BKGD) in (WIN) from (X1) by (Y1) to (WDT * W) by (total-height * H);
	display an image-map in (WIN) at (X1) by (Y1) using (WDT) wide data from (IMG_MAP) with tile-size (W) by (H).
	
To draw/display an/-- image-map in (WIN - a g-window) at (COORD1 - a list of numbers) using (WDT - a number) wide data of/from/-- (IMG_MAP - a list of figure names) with tile-size (W - a number) by/x (H - a number) pixel/pixels/px/--:
	let X1 be entry 1 of coord1;
	let Y1 be entry 2 of coord1;
	display an image-map in (current graphics window) at (X1) by (Y1) using (WDT) wide data from (IMG_MAP) with tile-size (W) by (H).

To draw/display an/-- image-map in (WIN - a g-window) at (COORD1 - a list of numbers) using (WDT - a number) wide data of/from/-- (IMG_MAP - a list of figure names) with tile-size (W - a number) by/x (H - a number) pixel/pixels/px/-- and background (BKGD - a number):
	let X1 be entry 1 of coord1;
	let Y1 be entry 2 of coord1;
	let total-height be the number of entries of IMG_MAP / WDT;
	rectdraw (BKGD) in (WIN) from (X1) by (Y1) to (WDT * W) by (total-height * H);
	display an image-map in (WIN) at (X1) by (Y1) using (WDT) wide data from (IMG_MAP) with tile-size (W) by (H).
		

Section - Brief form		

To image-map (IMG_MAP - a list of figure names) at (COORD1 - a list of numbers) width/w (WDT - a number) tile-size/size (DIM - a number) pixel/pixels/px/--, backgrounded:
	if the current graphics window is a graphics g-window:
		let x1 be entry 1 of coord1;
		let y1 be entry 2 of coord1;
		if backgrounded:
			display an image-map in (current graphics window) at (X1) by (Y1) using (WDT) wide data from (IMG_MAP) with tile-size (DIM) by (DIM) and background (current background-color);
		otherwise:
			display an image-map in (current graphics window) at (X1) by (Y1) using (WDT) wide data from (IMG_MAP) with tile-size (DIM) by (DIM) px;
	otherwise:
		say "*** Error: Short-form image-map drawing directive ignored. The current graphics window global was not specified."


Chapter - Image-map with tileset array

[Tilesets define their own tile sizes in the tile-width and tile-height properties of the tileset object. The long form commands ignore these properties and require the user to set the tile dimensions manually. The short form, however, respects the tile dimensions provided by the tileset object.]

[FOR NOW, I've stripped the tile-size specification for both long and short form tileset types. The bug in 6E36 that disallows many substitutions in phrases is not allowing this. 5/8/2010.]

Section - Long forms

To draw/display an/-- image-map in (WIN - a g-window) at (X1 - a number) by/x (Y1 - a number) using (WDT - a number) wide data of/from/-- (IMG_MAP - a list of numbers) rendered/-- using/with (TSET - a tileset)[ with tile-size (W - a number) by/x (H - a number) --/pixel/pixels/px]:
	let row be Y1;
	let column be X1;
	let total-height be the number of entries of IMG_MAP / WDT;
	let scan be 0;
	[Delete this if adding width and height back into the phrase preamble]
	let W be the tile-width of TSET;
	let H be the tile-height of TSET;
	[end delete]
	repeat with index running through IMG_MAP:
		increase scan by 1;
		if scan > WDT:
			increase row by H;
			change column to X1;
			let scan be 1;
		if index > 0:
			if there is a char of index in the translation-table of TSET:
				choose row with a char of index in the translation-table of TSET;
				let the current tile be tile entry;
				drscimage (current tile) in (WIN) at (column) by (row) with dimensions (W) by (H);
		increase column by W;
	only if utilizing Glimmr debugging;
	if basic drawing command debugging is true:
		say "[>console][DC]Image-map drawn at screen coordinates ([X1], [Y1]) of [WIN] using the list of numbers provided, interpreted as a grid [WDT] tiles wide and [total-height] tiles high. Tile size used: [W] by [H] pixels.[<]";
	end only if;

To draw/display an/-- image-map in (WIN - a g-window) at (X1 - a number) by/x (Y1 - a number) using (WDT - a number) wide data of/from/-- (IMG_MAP - a list of numbers) rendered/-- using/with (TSET - a tileset)[ with tile-size (W - a number) by/x (H - a number) pixel/pixels/px/--] and background (BKGD - a number):
	let total-height be the number of entries of IMG_MAP / WDT;
	let W be the tile-width of TSET;
	let H be the tile-height of TSET;
	rectdraw (BKGD) in (WIN) from (X1) by (Y1) to (WDT * W) by (total-height * H);
	display an image-map in (WIN) at (X1) by (Y1) using (WDT) wide data from (IMG_MAP) rendered with (TSET)[ with tile-width (W) by tile-height (H)].
	
To draw/display an/-- image-map in (WIN - a g-window) at (COORD1 - a list of numbers) using (WDT - a number) wide data of/from/-- (IMG_MAP - a list of numbers) rendered/-- using/with (TSET - a tileset)[ with tile-size (W - a number) by/x (H - a number) pixel/pixels/px/--]:
	let X1 be entry 1 of coord1;
	let Y1 be entry 2 of coord1;
	display an image-map in (current graphics window) at (X1) by (Y1) using (WDT) wide data from (IMG_MAP) rendered using (TSET)[ with tile-width (DIM) by tile-height (DIM)].

To draw/display an/-- image-map in (WIN - a g-window) at (COORD1 - a list of numbers) using (WDT - a number) wide data of/from/-- (IMG_MAP - a list of numbers) rendered/-- using/with (TSET - a tileset) with tile-size (W - a number) by/x (H - a number) pixel/pixels/px/-- and background (BKGD - a number):
	let X1 be entry 1 of coord1;
	let Y1 be entry 2 of coord1;
	let total-height be the number of entries of IMG_MAP / WDT;
	rectdraw (BKGD) in (WIN) from (X1) by (Y1) to (WDT * W) by (total-height * H);
	display an image-map in (WIN) at (X1) by (Y1) using (WDT) wide data from (IMG_MAP) rendered using (TSET)[ with tile-width (W) by tile-height (H)].
		

Section - Short form		

To image-map (IMG_MAP - a list of numbers) at (COORD1 - a list of numbers) width/w (WDT - a number) tileset (TSET - a tileset) tile-size/size (DIM - a number) pixel/pixels/px/--, backgrounded:
	if the current graphics window is a graphics g-window:
		let x1 be entry 1 of coord1;
		let y1 be entry 2 of coord1;
		if backgrounded:
			display an image-map in (current graphics window) at (X1) by (Y1) using (WDT) wide data from (IMG_MAP) rendered using (TSET)[ with tile-size (DIM) by (DIM)] and background (current background-color);
		otherwise:
			display an image-map in (current graphics window) at (X1) by (Y1) using (WDT) wide data from (IMG_MAP) rendered using (TSET)[ with tile-size (DIM) by (DIM)];
	otherwise:
		say "*** Error: Short-form image-map drawing directive ignored. The current graphics window global was not specified."


Chapter - Resources


Section - Global variables

[This first set of global variables supports a very brief form of drawing command; these are not used for the standard length commands.]

The current font is a font that varies.

[These are here only to overcome I7's limitation on the number of local variables that can be present in a single routine. They are not user-modifiable, since they will be set within the drawing routines.]
The g-imgwidth is a number variable. The g-imgwidth is 0.
The g-imgheight is a number variable. The g-imgheight is 0.
The current g-row is a number variable. Current g-row is 0.
The current g-column is a number variable. Current g-column is 0.


Section - Calculating the rendered length of a string

To decide what number is the length of (STR - indexed text) set in (TYPF - a font):
	let len be 0;
	repeat with N running from 1 to the number of characters in STR:
		let V be the character code of position N of STR;
		if there is a char of V in the font table of TYPF:
			choose row with a char of V in the font table of TYPF;
		otherwise:
			choose row with a char of 32 in the font table of TYPF;
		increase len by the advance entry;
	decide on len.


Part - Routines for color specification

Chapter - Get color from lookup table (by name)

To decide which number is color/colour (hue - a glulx color value):
	(- ColVal({hue}) -)


Chapter - Specifying color using RGB formula


Section - RGB color specification

To decide which number is R/r --/= (R - a number) G/g --/= (G - a number) B/b --/= (B - a number):
	unless R < 0 or R > 255 or G < 0 or G > 255 or B < 0 or B > 255:
		decide on (R * 65536) + (G * 256) + B;
	decide on 0;


Section - RGB specified as a percentage

To decide which number is r%/R% --/= (R - a number) g%/G% --/= (G - a number) b%/B% --/= (B - a number):
	unless R < 0 or R > 100 or G < 0 or G > 100 or B < 0 or B > 100:
		let R be R real times 2.5500 as an integer;
		let G be G real times 2.5500 as an integer;
		let B be B real times 2.5500 as an integer;
		decide on (R * 65536) + (G * 256) + B;
	decide on 0;


Section - RGB specified as a fixed point percentage (for use with Fixed Point Maths by Michael Callaghan)

To decide which number is r%/R% --/= (R - a real number) g%/G% --/= (G - a real number) b%/B% --/= (B - a real number):
	unless R is real less than 0 or R is real greater than 100.0000 or G is real less than 0 or G is real greater than 100.0000 or B is real less than 0 or B is real greater than 100.0000:
		let R1 be R real times 2.5500 as an integer;
		let G1 be G real times 2.5500 as an integer;
		let B1 be B real times 2.5500 as an integer;
		decide on (R1 * 65536) + (G1 * 256) + B1;
	decide on 0;


Chapter - Color specified as a hexadecimal

To decide which number is hex (hex - indexed text):
	let hex be hex in upper case;
	replace the regular expression "\$|\#" in hex with "";
	let len be the number of characters in hex;
	let total be 0;
	let multiplier be 1;
	repeat with index running from 1 to len:
		let N be (len - index) + 1;
		let V be the character code of position N of hex;
		unless V < 48 or V > 70 or ( V > 57 and V < 65):
			if V > 64:
				let curval be V - 55;
			otherwise if V < 58:
				let curval be V - 48;
		otherwise:
			let total be 0;
			break;
		let curval be curval * multiplier;
		increase total by curval;
		let multiplier be multiplier * 16;
	decide on total.


Part - Other functions

Chapter - Determination of image size

To decide what number is the image-width of (img - a figure name):
	(- FindImageWidth({img}) -)
	
To decide what number is the image-height of (img - a figure name):
	(- FindImageHeight({img}) -)

Include (-

[ FindImageWidth  img result img_width;
	result = glk_image_get_info(ResourceIDsOfFigures-->img, gg_arguments, gg_arguments+WORDSIZE);
             		img_width  = gg_arguments-->0;
	return img_width;
];

[ FindImageHeight  img result img_height;
	result = glk_image_get_info(ResourceIDsOfFigures-->img, gg_arguments, gg_arguments+WORDSIZE);
             		img_height  = gg_arguments-->1;
	return img_height;
];

-)


Chapter - Min and max functions

To decide which number is the greater/max of/-- (X - a number) or (Y - a number):
	if Y > X, decide on Y;
	decide on X.

To decide which number is the lesser/min of/-- (X - a number) or (Y - a number):
	if Y < X, decide on Y;
	decide on X.


Chapter - Look up the char number from a text-string

To decide which number is the character code of position (N - a number) of (T - an indexed text):
	(- ParseStringToChar({N}, {T}); -)

Include (-

[ ParseStringToChar pos txb len ch;
	len = BlkValueExtent(txb);
	pos = pos - 1;
	ch = BlkValueRead(txb, pos);
	return ch;
];

-).


Chapter - Identify a character by code in a string

To say char-code (N - a number):
	(- glk_put_char({N}); -)


Part - Provide indices for each glyph in a bitmap font

The file of Font Table is called "FontTable".

To get/set blank/-- indices for (typeface - a bitmap font), silently, verifying glyph map, and/or writing table to disk:
	sort the font table of the typeface in index order;
	let actual-index be 1;
	let next-advance be 0;
	unless silently:
		say "Checking the font table for [typeface]. Will attempt to add any missing index values. There are [number of rows in the font table of typeface] rows in the table.[paragraph break]";
	repeat with N running from 1 to the number of rows in the font table of the typeface:
		choose row N in the font table of the typeface;
		if there is an index entry:
			unless index entry is (actual-index plus next-advance):
				say "***Index numbers for the font table of [typeface] MAY be incorrect. Check glyph '[char-code char entry]' (char [char entry]), or the index position before it. The problem may also be that the height or width is incorrectly specified.";
			let actual-index be index entry;
		otherwise:
			next;
		if verifying glyph map:
			if the char entry is entry (index entry) of the glyph map of the typeface:
				unless silently:
					say "Glyph '[char-code char entry]' ([char entry]) appears to be correctly matched to the glyph map.";
			otherwise:
				say "***The index entry for glyph [char-code char entry] ([char entry]) does not seem to correctly match the glyph map. Continuing, if possible...";
		if there is a width entry and there is a height entry:
			let next-advance be (width entry * height entry) + 1;
		otherwise:
			say "***Glyph '[char-code char entry]' ([char entry]) in the font table of [typeface] is missing bitmap dimensions. Repair font table.";
			break;
	if verifying glyph map:
		if silently:
			add indices to the typeface starting from (index entry + next-advance), silently, verifying glyph map;
		otherwise:
			add indices to the typeface starting from (index entry + next-advance), verifying glyph map;
	otherwise if silently:
		add indices to the typeface starting from (index entry + next-advance), silently;
	otherwise:
		add indices to the typeface starting from (index entry + next-advance);
	if writing table to disk:
		write font table to disk for the typeface.

To add indices to (typeface - a bitmap font) starting from (N - a number), silently and/or verifying glyph map:
	let calculated-index be N;
	repeat through the font table of typeface:
		if there is an index entry:
			next;
		change index entry to calculated-index;
		if calculated-index is greater than 0:
			unless silently:
				say "Changed index entry for glyph '[char-code char entry]' (char [char entry]) to [index entry].";
		otherwise:
			say "***Could not provide an index entry for the font table of [typeface]: Check glyph '[char-code char entry]' (char [char entry]) first.";
			break;
		let calculated-index be calculated-index plus ( width entry * height entry) + 1;
		if verifying glyph map:
			if the char entry is entry (index entry) of the glyph map of the typeface:
				unless silently:
					say "Glyph '[char-code char entry]' ([char entry]) appears to be correctly matched to the glyph map.";
			otherwise:
				say "***The index entry for glyph [char-code char entry] ([char entry]) does not seem to correctly match the glyph map. Continuing, if possible...";

To write font table to disk for (typeface - a bitmap font):
	write "[font table of typeface][line break]" to the file of Font Table;
	append "glyph[direct-character placement tab]char[direct-character placement tab]index[direct-character placement tab]width[direct-character placement tab]height[direct-character placement tab]yoffset[direct-character placement tab]advance[line break]" to the file of Font Table;
	repeat with N running from 1 to the number of rows in the font table of the typeface:
		choose row N in the font table of the typeface;
		append "'[glyph entry]'[direct-character placement tab][char entry][direct-character placement tab][index entry][direct-character placement tab][width entry][direct-character placement tab][height entry][direct-character placement tab][yoffset entry][direct-character placement tab][advance entry][line break]" to the file of Font Table.

To say direct-character placement tab:
	(- glk_put_char_uni(9); -)


Chapter - Graphlink management (for use without Glimmr Graphic Hyperlinks by Erik Temple)

To set a graphlink in (g - a g-window) identified as (newlinkid - an object) from (gleft - a number) by (gtop - a number) to (gright - a number) by (gbottom - a number) as (linkaction - some text), ignoring redundant links:
	do nothing.

To set a graphlink in (g - a g-window) identified as (newlinkid - an object) from (gleft - a number) by (gtop - a number) to (gright - a number) by (gbottom - a number) as (linkref - a number), ignoring redundant links:
	do nothing.

To set a graphlink in (g - a g-window) identified as (newlinkid - an object) from (gleft - a number) by (gtop - a number) to (gright - a number) by (gbottom - a number) as (linkref - a stored action), ignoring redundant links:
	do nothing.


Part - Debugging

Use Glimmr debugging translates as (- Constant Glimmr_DEBUG; -).

To only if utilizing Glimmr debugging:
	(- #ifdef Glimmr_DEBUG; -)
	
To end only if:
	(- #endif; -)


Chapter - Drawing debugging

Basic drawing command debugging is a truth state variable.


Section - Turn on basic command debugging (for use without Canvas-Based Drawing by Erik Temple)

Basic drawing command debugging is true.


Chapter - Abbreviations
[These are phpBB-inspired macros for some fairly keystroke-intensive I7 text substitutions.]

To say b:
	say "[bold type]";

To say /b:
	say "[roman type]";

To say i:
	say "[italic type]";

To say /i:
	say "[roman type]";


Chapter - Debugging commands

To suspend actions tracing:
	(- trace_actions = 0; -)

To activate actions tracing:
	(- trace_actions = 1; -)

To suspend rules tracing:
	(- debug_rules = 1; -)

To activate intensive rules tracing:
	(- debug_rules = 2; -)

To activate rules tracing:
	(- debug_rules = 1; -)

To decide whether rules tracing is active:
	(- debug_rules -)

To decide whether intensive rules tracing is active:
	(- debug_rules == 2 -)


Chapter - Dummy text substitutions (for use without Glimmr Debugging Console by Erik Temple)

To say >console:
	do nothing.
 
To say <:
	do nothing.


Glimmr Drawing Commands ends here.


---- DOCUMENTATION ----

Glimmr Drawing Commands is 

[Documentation: Warn that the current font must be the correct type, or the game may crash with no message--that is, image or bitmap font.]
[Documentation: Include syntax that illustrates that bitmaps can be declared inline:

monochrome bitmap {	0, 0, 0, 0, 1,
				0, 0, 0, 1, 0,
				0, 0, 1, 0, 0,
				0, 1, 0, 0, 0,
				1, 0, 0, 0, 0 } at {100, 100} width 5 size 2 px.

]

Section - Extending bitmap fonts

It is possible to extend a bitmap font if it is missing characters we need. This is a two-step process. 

First, we need to add our new glyphs to the font's glyph map. This is done similarly to the drawing of a monochrome bitmap as discussed above, by specifying each bit of the font using an I7-style list, with 1's for on-bits and 0's for off-bits. However, we immediately preface the bitmap with the character code for the glyph. As with all other I7 lists, this code and each bit much be followed by a comma. The "starting the virtual machine" activity is probably the best place to add glyphs. Here is a glyph for a happy face, which we will place at character code 1:

	After starting the virtual machine:
		Add { 1, [This is the character code]
			0, 1, 1, 1, 1, 1, 0,
			1, 0, 0, 0, 0, 0, 1,
			1, 0, 1, 0, 1, 0, 1,
			1, 0, 0, 0, 0, 0, 1,
			1, 0, 1, 1, 1, 0, 1,
			1, 0, 0, 1, 1, 0, 1,
			1, 0, 0, 0, 0, 0, 1,
			0, 1, 1, 1, 1, 1, 0  } to the glyph map of Glimmr C&C.

Never use any syntax but the "Add {} to the glyph map of ..." shown here to extend glyph maps. The order of glyphs in the glyph map is of critical importance, and new glyphs must always be added *after* all earlier glyphs.

We must also then extend the typeface's font table so that the glyph can be drawn to the screen. We do this by looking at the font extension, noting the name of the font table, and putting a table continuation in our own code:

	Table of Glimmr C&C Parameters (continued)
	glyph	char	index	width	height	yoffset	advance
	"happy face"	1	2724	7	8	1	8

The glyph column contains a string that reflects what the author needs to type to produce that character. This is not used by the extension--it is for reference only.

Some characters will have no convenient keyboard equivalent. In this case, we can use the formulation "char-code X", where X is the character code; to see our happy face, for example, we specify our rendered text as "LOL [char-code 1]".

The char column should contain the character code as a digit; this is what the extension will use to match against the text-string provided.

The width column is the width of the bitmap in bits, and height is, of course, the height. These numbers must correctly describe the dimensions of the bitmap or it will be incorrectly drawn. These dimensions are also used to calculate the index column (see below).

Bitmap fonts are rendered starting from the upper-left corner. The yoffset column tells how many bits down from the imaginary top line of the font the glyph in question should be drawn. An uppercase "A", for example, which is a tall character, likely will have a y-offset of 0. A character like lowercase "y", however, is a short character and will likely have a positive y-offset. A negative offset can be used, if necessary, to make characters taller than the standard.

The advance column describes how far to the right we should move the imaginary "pen" after drawing the current glyph to prepare for the next glyph. Usually, this number will be at least one more than the width of the character, to be sure that the next character does not touch or overlap it.

I am mentioning the index column last, but it is very important. The index refers to the position of the character code reference within the font's glyph map. As such, it refers to the number of entries that existed in the glyph map before we added our most recent character, plus one. The index is used like the grooves in an LP: by jumping straight to this entry when we are ready to draw a glyph, we can avoid iterating through all of the entries that come before it.

Counting each entry in the glyph map by hand to determine the index would be a chore, so there is a utility provided that will automatically populate blank index values. There are two prerequisites for this process to work: We must have correctly filled out the other columns in our table continuation, and the order in which characters are listed in the table continuation must be the same as the order in which their glyphs are defined in the glyph map. So long as both of these are true, we can leave our index column(s) blank, like so:

	Table of Glimmr C&C Parameters (continued)
	glyph	char	index	width	height	yoffset	advance
	"happy face"	1	--	7	8	1	8
	"happy face reversed"	2	--	7	8	1	8

And then:

	First when play begins:
		set blank indices for Glimmr C&C, silently.

There are a few things to note here. First, there are really two ways to use this feature. We can simply do this silently and, as long as there are no errors, the game will automatically correct itself. At the cost of a little extra time at startup, this will get things working with no extra work.

But we can also use this to fix our table (and it's especially useful if we are making our own font from scratch). To see the calculated index numbers, simply remove the silently:

	 set blank indices for Glimmr C&C.

This will output the changes made to the screen. We can then type the proper index numbers into our table and remove the "set blank indices" instruction from the source code. 

Optionally, we can also verify that both old and newly assigned index numbers match the glyph map:

	set blank indices for Glimmr C&C, verifying glyph map.

Finally, "set blank indices" can also output the entire table to an external text file, which is expected to be useful if we are designing our own font, or heavily modifying an existing one:

	set blank indices for Glimmr C&C, verifying glyph map and writing table to disk.

If you run your game in the Inform IDE, the external file should be saved to your project folder. Note that there is a bug in Inform build 5Z71 that will cause rows that have had new indices applied by "set blank indices" to appear at the top of the table rather than at the bottom. You are free to move these to the bottom before making use of the table.


Section - Creating a new font

...using the "set blank indices" phrase (see above) with the verification option will allow us to check the integrity of the index, height, and width columns in the font table, as well as the structure of the glyph map.



