Version 1/100805 of Glimmr Image Font (for Glulx only) by Erik Temple begins here.

"Provides a font made up of individual images for use with the Glimmr system of extensions."

Section - Use options

Use authorial modesty.


Section - The font object

Glimmr Lucidex is an image-based font. 

The font table of Glimmr Lucidex is the Table of Glimmr Lucidex Typeface Parameters.
The colophon of Glimmr Lucidex is "The letterforms of Glimmr Lucidex are based on Lucida Grande, a member of the Lucida family of typefaces designed by Charles Bigelow and Kris Holmes."

The font-height of Glimmr Lucidex is 56.
The background-margin of Glimmr Lucidex is 6.
The cursor-width of Glimmr Lucidex is 2.

Section - Figure declarations

Figure of Glimmr Lucidex 32 is the file "Glimmr Lucidex 032 Space.png".
Figure of Glimmr Lucidex 100 is the file "Glimmr Lucidex 100 Lowercase d.png".


Section - The font table

Table of Glimmr Lucidex Typeface Parameters
glyph	char	glyph-ref	yoffset	advance


Section - Associate image-rendered strings with font by default (for use with Glimmr Canvas-Based Drawing by Erik Temple)
[Replace this section if you are using your own font alongside this font and wish to make your font the default choice for image-rendered strings.]

The associated font of an image-rendered string is usually Glimmr Lucidex.


Glimmr Image Font ends here.


---- DOCUMENTATION ----

Glimmr fonts can be used in graphics windows, which otherwise don't allow text. This font requires a set of external images (PNG files) to function. You may download these from http://code.google.com/p/glimmr-i7x. It works by displaying an image for each character in your text string, and requires either Glimmr Drawing Commands or Glimmr Canvas-Based Drawing to work. 

This font, called Glimmr Lucidex, is based on Lucida Grande, designed by Charles Bigelow and Kris Holmes. Please see the documentation of Glimmr Drawing Commands or Glimmr Canvas-Based Drawing for instructions on using this font. For instructions on creating your own fonts for use with Glimmr, see Glimmr Drawing Commands.

This font will automatically be set as the preferred default font for image-rendered strings when it is included, so it will not be necessary to specify the associated font for a bitmap-rendered string unless you are intending to use a different font as your default. In that case, simply declare that font:

	The associated font of a bitmap-rendered string is My Cool Font.


Section: Including fonts

Fonts must be included after the main Glimmr extensions. For example, if you are using Glimmr Canvas-Based Drawing:

	Include Glimmr Canvas-Based Drawing by Erik Temple.
	Include Glimmr Graphic Hyperlinks by Erik Temple.
	Include Glimmr Bitmap Font by Erik Temple.



Section: Contact info

If you have comments about the extension, please feel free to contact me directly at ek.temple@gmail.com.

Please report bugs on the Google Code project page, at http://code.google.com/p/glimmr-i7x/issues/list.

For questions about Glimmr, please consider posting to either the rec.arts.int-fiction newsgroup or at the intfiction forum (http://www.intfiction.org/forum/). This allows questions to be public, where the answers can also benefit others. If you prefer not to use either of these forums, please contact me directly via email (ek.temple@gmail.com).
