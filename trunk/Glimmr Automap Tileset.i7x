Version 1/100131 of Glimmr Automap Tileset (for Glulx only) by Erik Temple begins here.

[Give automap files better filenames--i.e., starting with Glimmr Tileset or something.]

Include Glimmr Automap by Erik Temple.

The associated tileset of the map-renderer is usually the Glimmr Automap Tileset.


Section - Basic tileset object definition

The Glimmr Automap Tileset is a tileset. The translation-table is the Table of Automap Tiles. The tile-width is 25. The tile-height is 25.


Section - Zoom levels
[Tilesets need to provide a list of the zoom levels at which they can be viewed. The author of the tileset may choose any number of these, but they need to be listed in order from smallest to largest. They are expressed as decimal ratios of the full size of the tile, using the format for real numbers required by Michael Callaghan's Fixed Point Maths extension.]

The zoom-level set of the Glimmr Automap Tileset is {0.3600, 0.5600, 0.8000, 1.0000}.

The initial zoom level of the Glimmr Automap Tileset is 2.
		

Section - Figure List
[Mark Tilford's Automap does not yet utilize the automap dark and automap present dark tiles, so these have been commented out.]

Figure of automap in is the file "003.png".
Figure of automap out is the file "004.png".
Figure of automap inout is the file "005.png".
Figure of automap present in is the file "006.png".
Figure of automap present out is the file "007.png".
Figure of automap present inout is the file "008.png".
Figure of automap dark is the file "096.png".
Figure of automap present dark is the file "126.png".

Figure of north south path is the file "002.png".
Figure of east west path is the file "001.png".
Figure of ne sw path is the file "035.png".
Figure of nw se path is the file "036.png".
Figure of empty room center is the file "037.png".
Figure of diagonal cross is the file "090.png".
Figure of orthogonal cross is the file "091.png". 
Figure of south wall is the file "038.png".
Figure of north wall is the file "039.png".
Figure of east wall is the file "040.png".
Figure of west wall is the file "041.png".
Figure of north exit is the file "042.png".
Figure of south exit is the file "043.png".
Figure of east exit is the file "044.png".
Figure of west exit is the file "045.png".
Figure of sw corner is the file "046.png".
Figure of nw corner is the file "047.png".
Figure of ne corner is the file "048.png".
Figure of se corner is the file "049.png".
Figure of sw exit is the file "050.png".
Figure of nw exit is the file "051.png".
Figure of ne exit is the file "052.png".
Figure of se exit is the file "053.png".

Figure of up arrow is the file "092.png".
Figure of down arrow is the file "093.png".
Figure of up down arrow is the file "094.png".
Figure of question arrow is the file "096.png".

Figure of full room is the file "054.png".
Figure of empty room is the file "095.png".

Figure of full south wall is the file "055.png".
Figure of full north wall is the file "056.png".
Figure of full east wall is the file "057.png".
Figure of full west wall is the file "058.png".
Figure of full north exit is the file "059.png".
Figure of full south exit is the file "060.png".
Figure of full east exit is the file "061.png".
Figure of full west exit is the file "062.png".
Figure of full sw corner is the file "063.png".
Figure of full nw corner is the file "064.png".
Figure of full ne corner is the file "065.png".
Figure of full se corner is the file "066.png".
Figure of full sw exit is the file "067.png".
Figure of full nw exit is the file "068.png".
Figure of full ne exit is the file "069.png".
Figure of full se exit is the file "070.png".

[The corner fill tiles are not implemented by Automap, but Glimmr Automap optionally provides them via a post-processing routine.]
Figure of ne corner fill is the file "071.png".
Figure of se corner fill is the file "072.png".
Figure of sw corner fill is the file "073.png".
Figure of nw corner fill is the file "074.png".
Figure of n dual corner fill is the file "011.png".
Figure of e dual corner fill is the file "012.png".
Figure of s dual corner fill is the file "013.png".
Figure of w dual corner fill is the file "014.png".

Figure of full up arrow is the file "123.png".
Figure of full down arrow is the file "124.png".
Figure of full up down arrow is the file "125.png".
Figure of full question arrow is the file "126.png".


Section - Translation Table
[Avoid assigning a tile to char 32 (empty space) -- this will slow down map display and cause flickering. If you want the map to have a background, either assign a background-image to the associated canvas of the map-renderer, or assign a background-color to the map-renderer itself.]

Table of Automap Tiles
Char	Tile
number	figure-name
3	Figure of automap in
4	Figure of automap out
5	Figure of automap inout
6	Figure of automap present in
7	Figure of automap present out
8	Figure of automap present inout
9	Figure of automap dark
10	Figure of automap present dark
2	Figure of north south path
1	Figure of east west path
35	Figure of ne sw path
36	Figure of nw se path
37	Figure of empty room center
90	Figure of diagonal cross
91	Figure of orthogonal cross 
38	Figure of south wall
39	Figure of north wall
40	Figure of east wall
41	Figure of west wall
42	Figure of north exit
43	Figure of south exit
44	Figure of east exit
45	Figure of west exit
46	Figure of sw corner
47	Figure of nw corner
48	Figure of ne corner
49	Figure of se corner
50	Figure of sw exit
51	Figure of nw exit
52	Figure of ne exit
53	Figure of se exit
92	Figure of up arrow
93	Figure of down arrow
94	Figure of up down arrow
96	Figure of question arrow
54	Figure of full room
95	Figure of empty room
55	Figure of full south wall
56	Figure of full north wall
57	Figure of full east wall
58	Figure of full west wall
59	Figure of full north exit
60	Figure of full south exit
61	Figure of full east exit
62	Figure of full west exit
63	Figure of full sw corner
64	Figure of full nw corner
65	Figure of full ne corner
66	Figure of full se corner
67	Figure of full sw exit
68	Figure of full nw exit
69	Figure of full ne exit
70	Figure of full se exit
71	Figure of ne corner fill
72	Figure of se corner fill
73	Figure of sw corner fill
74	Figure of nw corner fill
11	Figure of n dual corner fill
12	Figure of e dual corner fill
13	Figure of s dual corner fill
14	Figure of w dual corner fill
123	Figure of full up arrow
124	Figure of full down arrow
125	Figure of full up down arrow
126	Figure of full question arrow


Glimmr Automap Tileset ends here.


---- DOCUMENTATION ---- 

Section: Contact info

If you have comments about the extension, please feel free to contact me directly at ek.temple@gmail.com.

Please report bugs on the Google Code project page, at http://code.google.com/p/glimmr-i7x/issues/list.

For questions about Glimmr, please consider posting to either the rec.arts.int-fiction newsgroup or at the infiction forum (http://www.intfiction.org/forum/). This allows questions to be public, where the answers can also benefit others. If you prefer not to use either of these forums, please contact me directly via email (ek.temple@gmail.com).
