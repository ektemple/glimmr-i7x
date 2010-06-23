Version 1/100302 of Glimmr Simple Graphics Window (for Glulx only) by Erik Temple begins here.

[This extension must be included AFTER either Glimmr Canvas-Based Drawing or Glimmr Drawing Commands.]
[Fix the canvas width/height. Before supplying a default width/height, we need to also check that there is no background image that will supply it instead.]

The graphics-window is a graphics g-window spawned by the main-window. 

After starting the virtual machine:
	if the back-colour of the graphics-window is g-placeNULLcol:
		change the back-colour of the graphics-window to g-black;


Section - Canvas (for use with Glimmr Canvas-Based Drawing by Erik Temple)

The graphics-canvas is a g-canvas. 
The associated canvas of a graphics g-window is the graphics-canvas.
The associated canvas of a g-element is the graphics-canvas.

After starting the virtual machine:
	if the background image of graphics-canvas is Figure of Null:
		if the canvas-width of graphics-canvas is 0 or the canvas-height of graphics-canvas is 0:			change the canvas-width of graphics-canvas to 600;
			change the canvas-height of graphics-canvas to 300;


Section - Very basic drawing rule (for use without Glimmr Canvas-Based Drawing by Erik Temple)

[If we aren't using Canvas-Based Drawing, then we want to provide a stub rule, one that everyone is likely to use. This will clear the window to its background color on our behalf. ]

First window-drawing rule for the graphics-window:
	clear the graphics-window.


Section - Enable graphic hyperlinks (for use with Glimmr Graphic Hyperlinks by Erik Temple)

The graphics-window is g-graphlinked.


Glimmr Simple Graphics Window ends here.
