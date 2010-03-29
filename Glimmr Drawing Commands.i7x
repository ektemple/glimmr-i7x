Version 1/091028 of Glimmr Drawing Commands (for Glulx only) by Erik Temple begins here.

[Look hard at whether to keep the bipartite scheme for drawing; i.e., the base command plus a secondary command that writes to the console.]

"Provides commands for drawing images, shape primitives (such as rectangles, boxes, and lines), user-specified bitmaps, and for text-painting using 'fonts' with glyphs composed of either bitmaps or image files."


Part - Inclusions

Include version 9 of Flexible Windows v9 by Jon Ingold.
Include version 3 of Fixed Point Maths by Michael Callaghan.


Part - Primitives


Chapter - Rectangles



Chapter - Outlined rectangles


Chapter - Lines


Chapter - Images


Part - Drawing bitmaps

[Bitmaps are drawn by coloring individual pixels (or pixels in groups), and are specified by the user using an I7 list. Since they are drawn by setting pixels, they cannot be scaled as PNG or JPEG images can.]


Chapter 1 - Bichrome bitmaps


Section 1.1 - Bichrome bitmap with background color

To draw/display a/-- bichrome bitmap (HUE - a number) in (WIN - a g-window) at (X1 - a number) by/x (Y1 - a number) using (WDT - a number) bit/-- wide data of/from/-- (BIT_MAP - a list of numbers) with dot/-- size (WGT - a number) pixel/pixels/px/-- and background (bkgd - a number):
	let row be Y1;
	let the bit-height be the number of entries of BIT_MAP divided by WDT;

To draw/display a/-- bichrome bitmap (HUE - a number) in (WIN - a g-window) at (COORD1 - a list of numbers) using (WDT - a number) bit/-- wide data of/from/-- (BIT_MAP - a list of numbers) with dot/-- size (WGT - a number) pixel/pixels/px/-- and background (bkgd - a number):
	let x1 be entry 1 of coord1;
	display a bichrome bitmap (HUE) in (WIN) at (X1) by (Y1) using (WDT) wide data of (BIT_MAP) with dot size (WGT) px and background (BKGD).


Section 1.2 - Bichrome bitmap without background color

To draw/display a/-- bichrome bitmap (HUE - a number) in (WIN - a g-window) at (X1 - a number) by/x (Y1 - a number) using (WDT - a number) bit/-- wide data of/from/-- (BIT_MAP - a list of numbers) with dot/-- size (WGT - a number) pixel/pixels/px/--:
	let row be Y1;
	let scan be 0;

To draw/display a/-- bichrome bitmap (HUE - a number) in (WIN - a g-window) at (COORD1 - a list of numbers) using (WDT - a number) bit/-- wide data of/from/-- (BIT_MAP - a list of numbers) with dot/-- size (WGT - a number) pixel/pixels/px/--:
	let x1 be entry 1 of coord1;
	display a bichrome bitmap (HUE) in (WIN) at (X1) by (Y1) using (WDT) wide data of (BIT_MAP) with dot size (WGT) px.


Section 1.3 - Short forms

To bichrome/bi bitmap/bmp (BIT_MAP - a list of numbers) at (COORD1 - a list of numbers) width (WDT - a number) dot/-- size (WGT - a number) pixel/pixels/px/--, backgrounded:
	let x1 be entry 1 of coord1;
	if backgrounded:
		display a bichrome bitmap (current foreground-color) in (current graphics window) at (X1) by (Y1) using (WDT) wide data of (BIT_MAP) with dot size (WGT) px and background (current background-color);
	otherwise:
		display a bichrome bitmap (current foreground-color) in (current graphics window) at (X1) by (Y1) using (WDT) wide data of (BIT_MAP) with dot size (WGT) px.


Chapter 2 - Polychrome bitmaps

[In a polychrome bitmap, we can set a decimal version of any hex RGB-color we like in our bitmap array. To save typing (decimalized hex numbers are long), we can also set one of two special values. The first, a basic foreground color, is written as 1 in the bitmap array, utilizes the color we set in our drawing phrase. The other special value, written as 2 in the bitmap array, is a null value--it draws nothing to the screen. If we have specified a background color, we will see that background color wherever 2 is present in our bitmap array.]


Section 2.1 - Polychrome bitmap with background color

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


Section 2.2 - Polychrome bitmap without background color

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


Section 2.3 - Short forms

To polychrome/poly bitmap/bmp (BIT_MAP - a list of numbers) at (COORD1 - a list of numbers) width (WDT - a number) dot/-- size (WGT - a number) pixel/pixels/px/--, backgrounded:
	let x1 be entry 1 of coord1;
	let y1 be entry 2 of coord1;
	if backgrounded:
		display a polychrome bitmap (current foreground-color) in (current graphics window) at (X1) by (Y1) using (WDT) wide data of (BIT_MAP) with dot size (WGT) px and background (current background-color);
	otherwise:
		display a polychrome bitmap (current foreground-color) in (current graphics window) at (X1) by (Y1) using (WDT) wide data of (BIT_MAP) with dot size (WGT) px.


Chapter 1 - Fonts


Section 1.1 - The font base class


Section 1.4 - Bitmap fonts


Section 2.2 - Image-based fonts


Section 2.4 - Crediting fonts

Report requesting the story file version (this is the announce colophon rule):
	repeat with typeface running through the list of fonts:
		unless the colophon of the typeface is "":
			say "[one of]Typefaces used in graphics windows:[line break][or][stopping][colophon of the typeface][line break]"


Chapter 1 - Text-painting with bitmap fonts


Section 1.1 - Bitmap strings with a background color

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
	if center-aligned:
		paint bitmap text (HUE) of (STR) in (WIN) at (X1) by (Y1) using (TYPF) with size (WGT) and background (BKGD), center-aligned;
		rule succeeds;
	if right-aligned:
		paint bitmap text (HUE) of (STR) in (WIN) at (X1) by (Y1) using (TYPF) with size (WGT) and background (BKGD), right-aligned;
		rule succeeds;
	paint bitmap text (HUE) of (STR) in (WIN) at (X1) by (Y1) using (TYPF) with size (WGT) and background (BKGD).


Section 1.2 - Bitmap strings without a background color

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
	if center-aligned:
		paint bitmap text (HUE) of (STR) in (WIN) at (X1) by (Y1) using (TYPF) with size (WGT), center-aligned;
		rule succeeds;
	if right-aligned:
		paint bitmap text (HUE) of (STR) in (WIN) at (X1) by (Y1) using (TYPF) with size (WGT), right-aligned;
		rule succeeds;
	paint bitmap text (HUE) of (STR) in (WIN) at (X1) by (Y1) using (TYPF) with size (WGT).


Section 1.3 - Brief forms

To bitmap/bmp text/txt (STR - indexed text) at (COORD1 - a list of numbers) size (WGT - a number) pixel/pixels/px/-- backgrounded/background/bkgd, center-aligned or right-aligned:
	if the current graphics window is not a graphics g-window:
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
	if center-aligned:
		paint a bitmap text (current foreground-color) of (STR) in (current graphics window) at (X1) by (Y1) using (current font) with dot size (WGT), center-aligned;
		rule succeeds;
	if right-aligned:
		paint a bitmap text (current foreground-color) of (STR) in (current graphics window) at (X1) by (Y1) using (current font) with dot size (WGT), right-aligned;
		rule succeeds;
	otherwise:
		paint a bitmap text (current foreground-color) of (STR) in (current graphics window) at (X1) by (Y1) using (current font) with dot size (WGT).
		

Chapter 2 - Text-painting with image-based fonts


Section 2.1 - Text-painting with a background color

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
	if center-aligned:
		paint image-based text of (STR) in (WIN) at (X1) by (Y1) using (TYPF) scaled at (SCF) with background (BKGD) and margin (MARGIN), center-aligned;
		rule succeeds;
	if right-aligned:
		paint image-based text of (STR) in (WIN) at (X1) by (Y1) using (TYPF) scaled at (SCF) with background (BKGD) and margin (MARGIN), right-aligned;
		rule succeeds;
	paint image-based text of (STR) in (WIN) at (X1) by (Y1) using (TYPF) scaled at (SCF) with background (BKGD) and margin (MARGIN).


Section 2.2 - Text-painting without a background color

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
	if center-aligned:
		paint image-based text of (STR) in (WIN) at (X1) by (Y1) using (TYPF) scaled at (SCF), center-aligned;
		rule succeeds;
	if right-aligned:
		paint image-based text of (STR) in (WIN) at (X1) by (Y1) using (TYPF) scaled at (SCF), right-aligned;
		rule succeeds;
	paint image-based text of (STR) in (WIN) at (X1) by (Y1) using (TYPF) scaled at (SCF).


Section 2.3 - Brief forms

To image/img text/txt (STR - indexed text) at (COORD1 - a list of numbers) scaled/scale (SCF - a real number) margin (MARGIN - a number) pixels/pixel/px, center-aligned or right-aligned:
	if the current graphics window is not a graphics g-window:
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
	if center-aligned:
		paint an image-based text of (STR) in (current graphics window) at (X1) by (Y1) using (current font) scaled at (SCF), center-aligned;
		rule succeeds;
	if right-aligned:
		paint an image-based text of (STR) in (current graphics window) at (X1) by (Y1) using (current font) scaled at (SCF), right-aligned;
		rule succeeds;
	otherwise:
		paint an image-based text of (STR) in (current graphics window) at (X1) by (Y1) using (current font) scaled at (SCF).


Chapter 3 - Resources


Section 3.1 - Global variables

[This first set of global variables supports a very brief form of drawing command; these are not used for the standard length commands.]

The current font is a font that varies.

[These are here only to overcome I7's limitation on the number of local variables that can be present in a single routine. They are not user-modifiable, since they will be set within the drawing routines.]
The g-imgwidth is a number variable. The g-imgwidth is 0.
The g-imgheight is a number variable. The g-imgheight is 0.
The current g-row is a number variable. Current g-row is 0.
The current g-column is a number variable. Current g-column is 0.


Section 3.2 - Calculating the rendered length of a string

To decide what number is the length of (STR - indexed text) set in (TYPF - a font):


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

To decide what number is the image-width of (img - a figure-name):

Include (-

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
	do nothing.

To set a graphlink in (g - a g-window) identified as (newlinkid - an object) from (gleft - a number) by (gtop - a number) to (gright - a number) by (gbottom - a number) as (linkref - a number), ignoring redundant links:
	do nothing.

To set a graphlink in (g - a g-window) identified as (newlinkid - an object) from (gleft - a number) by (gtop - a number) to (gright - a number) by (gbottom - a number) as (linkref - a stored action), ignoring redundant links:
	do nothing.



---- DOCUMENTATION ----

[Documentation: Warn that the current font must be the correct type, or the game may crash with no message--that is, image or bitmap font.]
[Documentation: Include syntax that illustrates that bitmaps can be declared inline:

bichrome bitmap {	0, 0, 0, 0, 1,
				0, 0, 0, 1, 0,
				0, 0, 1, 0, 0,
				0, 1, 0, 0, 0,
				1, 0, 0, 0, 0 } at {100, 100} width 5 size 2 px.

]

Section - Extending bitmap fonts

It is possible to extend a bitmap font if it is missing characters we need. This is a two-step process. 

First, we need to add our new glyphs to the font's glyph map. This is done similarly to the drawing of a bichrome bitmap as discussed above, by specifying each bit of the font using an I7-style list, with 1's for on-bits and 0's for off-bits. However, we immediately preface the bitmap with the character code for the glyph. As with all other I7 lists, this code and each bit much be followed by a comma. The "starting the virtual machine" activity is probably the best place to add glyphs. Here is a glyph for a happy face, which we will place at character code 1:

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


