Version 1/091106 of Glimmr Canvas Text Input Fields (for Glulx only) by Erik Temple begins here.

[Consider changing the "input field" to a property: A g-element can be an input field.... Element display rule for an input field g-element.]
[Change the passive or in-focus to "selected" and "deselected" or something?]
[If the keypress-to-string rules becomes an activity, we can test whether it's ongoing or not...]


Chapter - Inclusion control

Include Glimmr Graphic Hyperlinks by Erik Temple.
Include Glimmr Canvas-Based Drawing by Erik Temple.


Chapter - Console settings
[This is a "macro" that allows the extension to identify itself in the Glimmr console window with fewer keystrokes on my part.]

To say CTIF:
	say "[bracket]Glimmr CTIF[close bracket]: ".


Chapter - Defining the window for input
[Char input (keypress input) is only accepted in text windows. While it will appear that we are receiving input in our graphics window, this is illusory. We need always to have at least one open text window that can receive the player's keypress input. We then process this input and output it via a rendered string element to our graphics-window. The input-accepting window will almost always be the main-window, which is the default value we set for this global variable. However, we can change this if need be.]

The char-accepting window is a g-window variable. The char-accepting window is usually the main-window.


Chapter - Input field definition
[Here we define the input field generically as a kind of g-element. The author will need to specify a more specific kind in her story text, e.g. (This is legal as of build 6Exx):

	An input field is a kind of stroked rectangle primitive.

Another option, as always, is to write a custom element display rule for input fields.]

An input field is a kind of g-element. The graphlink status of an input field is g-active.

An input field has a rendered string called the input-stream.
An input field has a number called the maximum length.

The current field is an input field that varies.


Section - Accepted control input

[The accepted control input serves as a gatekeeper for special characters, such as arrow keys. Any character code listed in this list will be allowed, and we will need special keypress-to-string conversion activity to deal with them.

It would be far better if we could set this property initially to a variable (like "current input list"), but Inform does not currently allow for the initial definition of a property to be a variable.]

An input field has a list of numbers called the accepted control input. The accepted control input is usually {-2, -3, 3, 127, -6, -7, -8, -9}.

[-2    left arrow
 -3    right arrow
 -4	up arrow
 -5	down arrow
 -6    return
 -7	backspace/delete
 -8    escape
 -9    tab
   3	return/enter
127   backspace/delete ]


Section - Accepted standard input

[The accepted standard input is optional. If we include any numbers in this list, they will act, alongside the accepted control input list, as a filter. No characters outside of these lists will be passed on to the keypress-to-string conversion activity.]

An input field has a list of numbers called the accepted standard input. The accepted standard input is usually {}.


Chapter - Flags

[These flags identify whether we are in input mode, and if so, which input field is being targeted.] 

The char-input mode is a truth state that varies. Char-input mode is false.
An input field can be passive or in-focus. An input field is usually passive.


Chapter - Focus on elements

To focus on (element - an input field):
	repeat with item running through the list of display-active input fields:
		remove focus from the item;
	now element is in-focus;
	now the current field is element;
	now char-input mode is true.
	
To remove focus from input fields:
	repeat with item running through the list of display-active input fields:
		remove focus from item;
	now char-input mode is false.

To remove focus from (element - an input field):
	now the element is passive;
	now the cursor of the input-stream of the element is -99;
	follow the input interpretation rules for the element;

The queued field is an input field variable.

First graphlink processing rule for an input field (called the field) (this is the focus on field on click rule):
	if the keypress-to-string conversion activity is going on and the field is not the current field:
		say "Option 1";
		change the queued field to the field;
		follow the char-input suspension rules for the current field;
	otherwise if the keypress-to-string conversion activity is going on:
		say "Option 2";
		do nothing;
	otherwise:
		say "Option 3";
		cancel character input in the char-accepting window;
		if the field is passive:
			focus on the field;
			follow the text field input rule;
	rule succeeds.

The char-input suspension rules are an object-based rulebook. The char-input suspension rules have outcomes exit (success) and continue (no outcome - the default).

The cached command prompt is a text variable.

A char-input suspension rule:
	say "Input was suspended.";
	continue.

Last char-input suspension rule:
	change the cached command prompt to the command prompt;
	change command prompt to "";
	rule succeeds.

[The problem is that we are returning to this routine after clicking--char input mode isn't enough of a hook.]
For reading a command:
	if char-input mode is true:
		say "getting input.";
		get glk input;
		change the command prompt to the cached command prompt;
		focus on the queued field;
		follow the text field input rule;
	otherwise:
		duplicate library keyboard routine.

To duplicate library keyboard routine:
(- Keyboard(buffer,parse); players_command = 100 + WordCount(); num_words = WordCount(); -)

To get glk input:
(- glk_select(gg_event); -)


Chapter - Phrase to cancel single-character input (for use without Text Window Input-Output Control by Erik Temple)
[When terminating char input to our field, we check to see whether we were awaiting input in the main window. If we were, we re-request input. There are two versions of this phrase, depending on whether we are using the Text Window Input-Output Control extension. If we are, then we do not assume the main-window; we use whatever the author has defined as the current text input window.]

To cancel special character input for (S - an input field):
	follow the window-drawing rules for the assigned window of S;
	if we are reading a command:
		request line input in the main-window;
		#if utilizing Glimmr debugging;
		say "[>console][CTIF]Requesting line input in the main-window after termination of char input for input field [i][current field][/i].[<]";
		#end if.


Chapter - Phrase to cancel single-character input (for use with Text Window Input-Output Control by Erik Temple)

To cancel special character input for (S - an input field):
	follow the window-drawing rules for the assigned window of S;
	if we are reading a command:
		request line input in the current text input window;
		#if utilizing Glimmr debugging;
		say "[>console][CTIF]Requesting line input in the [current text input window] after termination of char input for input field [i][current field][/i].[<]";
		#end if.


Chapter - The text field input rule (for use without Text Window Input-Output Control by Erik Temple)
[This rule, which does nothing unless char-input mode is set to true, sets the cursor to the end of the field's text string and starts a loop that reads and acts on single-character input until a terminating key--such as enter, escape, or tab--is pressed. The key is read and processed by the keypress-to-string conversion activity.]

This is the text field input rule:
	if char-input mode is true:
		if we are reading a command, cancel line input in the main-window;
		#if utilizing Glimmr debugging;
		say "[>console][CTIF]Input canceled in the main-window in anticipation of receiving keypress input for input field [i][current field][/i].[<]";
		#end if;
		now the cursor of the input-stream of the current field is the number of characters in the text-string of the input-stream of the current field;
		follow the window-drawing rules for the assigned window of the current field;
		while char-input mode is true:
			#if utilizing Glimmr debugging;
			say "[>console][CTIF]Accepting keypress input for input field [i][current field][/i] (displayed in [assigned window of the current field]). Cursor placed at position [cursor of the input-stream of the current field]. Character code of accepted input: [run paragraph on][<]";
			#end if;
			carry out the keypress-to-string conversion activity with the current field.


Chapter - The text field input rule (for use with Text Window Input-Output Control by Erik Temple)

This is the text field input rule:
	if char-input mode is true:
		if we are reading a command, cancel line input in the current text input window;
		#if utilizing Glimmr debugging;
		say "[>console][CTIF]Input canceled in the main-window in anticipation of receiving keypress input for input field [i][current field][/i].[<]";
		#end if;
		now the cursor of the input-stream of the current field is the number of characters in the text-string of the input-stream of the current field;
		follow the window-drawing rules for the assigned window of the current field;
		while char-input mode is true:
			#if utilizing Glimmr debugging;
			say "[>console][CTIF]Accepting keypress input for input field [i][current field][/i] (displayed in [assigned window of the current field]). Cursor placed at position [cursor of the input-stream of the current field]. Character code of accepted input: [run paragraph on][<]";
			#end if;
			carry out the keypress-to-string conversion activity with the current field.


Chapter - Keypress-to-string conversion activity

Keypress-to-string conversion of something is an activity. The keypress-to-string conversion activity has a number called key-press. The keypress-to-string conversion activity has a number called len.

[abandon the analysing activity with the pitchblende;]

[The keypress-to-string conversion rules are an object based rulebook. The keypress-to-string conversion rulebook has a number called key-press. The keypress-to-string conversion rulebook has a number called len. The keypress-to-string conversion rules have outcome exit (success) and continue (no outcome - the default).]


Section - Prepare keypress rule

Before keypress-to-string conversion (this is the prepare keypress rule):
	change key-press to the character code entered in the char-accepting window;
	#if utilizing Glimmr debugging;
	say "[>console][key-press].[<]";
	#end if;
	now len is the number of characters in the text-string of the input-stream of the current field;
	unless key-press is a char listed in the font table of the associated font of the input-stream of the current field or key-press is listed in the accepted control input of the current field:
		rule succeeds;
	if the number of entries in the accepted standard input of the current field > 0 and key-press is not listed in the accepted standard input of the current field and key-press is not listed in the accepted control input of the current field:
		rule succeeds;

Section - Termination key input

For keypress-to-string conversion when key-press terminates input (this is the keypress terminating input rule):
	remove focus from input fields;
	cancel character input in the char-accepting window;
	replace the regular expression "^\s+" in the text-string of the input-stream of the current field with "";[eliminate leading spaces]
	#if utilizing Glimmr debugging;
	say "[>console][CTIF]Received termination code [key-press] for input field element [i][current field][/i]. Canceling keypress input in the char-accepting window ([char-accepting window]).[<]";
	#end if;
	cancel special character input for the current field.
	[follow the window-drawing rules for the assigned window of the current field;
	if we are reading a command:
		request line input in the main-window;
	rule succeeds;]

To decide if (keychar - a number) terminates input:
	if keychar is listed in the input-termination commands of the current field, decide yes;
	decide no.

An input field has a list of numbers called the input-termination commands. The input-termination commands of an input field is usually {-6, -8, -9, 3}.


Section - Standard input

For keypress-to-string conversion when key-press is standard input (this is the keypress of standard input rule):
	if len < maximum length of the current field:
		if the cursor of the input-stream of the current field is 0:
			now the text-string of the input-stream of the current field is "[the string equivalent of key-press][the text-string of the input-stream of the current field]";
		otherwise:
			let temp-buffer be character number (cursor of the input-stream of the current field) in the text-string of the input-stream of the current field;
			replace character number (cursor of the input-stream of the current field) in the text-string of the input-stream of the current field with "[temp-buffer][the string equivalent of key-press]";
		increase the cursor of the input-stream of the current field by 1;
	continue the activity.

To decide if (keychar - a number) is standard input:
	if (keychar > 31 and keychar < 127) or (keychar > 127 and keychar < 177), decide yes;
	decide no.


Section - Delete key

For keypress-to-string conversion when key-press is a delete key (this is the keypress deleting rule):
	if cursor of the input-stream of the current field > 0:
		replace character number (cursor of the input-stream of the current field) in the text-string of the input-stream of the current field with "";
		decrease cursor  of the input-stream of the current field by 1;
	continue the action.

To decide if (keychar - a number) is a delete key:
	if keychar is 127 or keychar is -7, decide yes;
	decide no.


Section - Horizontal movement key (arrow keys)

For keypress-to-string conversion when key-press is a horizontal movement key (this is the keypress horizontal movement rule):
	if key-press is -2:[left arrow]
		decrease cursor of the input-stream of the current field by 1;
	if key-press is -3:[right arrow]
		increase cursor of the input-stream of the current field by 1;
	if cursor of the input-stream of the current field < 0, now cursor of the input-stream of the current field is 0;
	if cursor of the input-stream of the current field > len, now cursor of the input-stream of the current field is len.

To decide if (keychar - a number) is a horizontal movement key:
	if keychar > -4 and keychar < -1, decide yes;
	decide no.


Section - Draw the window (final keypress conversion rule)

After keypress-to-string conversion:
	consider the window-drawing rules for the assigned window of the current field;
	continue the action.


[Section - Arranging the keypress conversion rules

The prepare keypress rule is listed first in the keypress-to-string conversion rules.]


Chapter - Input interpretation rules

The input interpretation rules are an object based rulebook.

The input interpretation rules have outcome exit (success - the default) and continue (no outcome).


Section - Default input interpretation rule

An input interpretation rule (this is the default input interpretation rule):
	do nothing.

The default input interpretation rule is listed first in the input interpretation rules.


Section - Fields that accept only numbers
[This section allows for fields that output a number rather than an indexed text.]

An input field has a number called the associated value.

The numerical filter is a list of numbers variable. The numerical filter is {48, 49, 50, 51, 52, 53, 54, 55, 56, 57}.

An input interpretation rule for an input field (called the field) (this is the field to number conversion rule):
	let val be the the text-string of the input-stream of the field as a number;
	now the associated value of the field is val;
	exit;

To decide which number is (S - indexed text) as a number:
	replace the regular expression "\s" in S with "";
	replace the regular expression "^\+" in S with "";
	if character number 1 in S is "-":
		let is-negative be true;
		replace the regular expression "\-" in S with "";
	if S matches the regular expression "<^0-9>", decide on 0;
	let len be the number of characters in S;
	if len is 0, decide on 0;
	let result be 0;
	repeat with N running from 0 to (len - 1):
		let digit be character number (len - N) in S;
		let multiplier be 10 to the power N;
		if digit is "0":
			next;
		if digit is "1":
			let result be multiplier + result;
			next;
		if digit is "2":
			let result be (multiplier * 2) + result;
			next;
		if digit is "3":
			let result be (multiplier * 3) + result;
			next;
		if digit is "4":
			let result be (multiplier * 4) + result;
			next;
		if digit is "5":
			let result be (multiplier * 5) + result;
			next;
		if digit is "6":
			let result be (multiplier * 6) + result;
			say "Result: [result][paragraph break]";
			next;
		if digit is "7":
			let result be (multiplier * 7) + result;
			next;
		if digit is "8":
			let result be (multiplier * 8) + result;
			next;
		if digit is "9":
			let result be (multiplier * 9) + result;
			next;
		decide on 0;
	if is-negative is true, let result be 0 - result;
	say "The input corresponds to [result].";
	decide on result;


Section  - Helpful phrases

To say the string equivalent of (N - a number):
	(- print (char) {N}; -)

To decide whether glulx char input is supported:
	(- ( glk_gestalt(gestalt_CharInput, 0) ) -)

To decide whether we/-- are/-- reading a command:
	if handling the reading a command activity, decide yes;
	decide no.

To request line input in (win - a g-window):
(- glk_request_line_event({win}.ref_number, buffer+WORDSIZE, INPUT_BUFFER_LEN-WORDSIZE, 0);
 -)


Glimmr Canvas Text Input Fields ends here.
