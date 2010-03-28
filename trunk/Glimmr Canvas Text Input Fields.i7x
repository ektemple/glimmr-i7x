Version 1/091106 of Glimmr Canvas Text Input Fields (for Glulx only) by Erik Temple begins here.

[Change the passive or receptive to "selected" and "deselected" or something?]
[Adjust the char input to work with the new version to be provided by Flexible Windows.]

Section 0 - Inclusion control (for use without Primitive Drawing Classes by Erik Temple)

Include Glimmr Canvas-Based Drawing by Erik Temple.


Chapter - Input field definition

An input field is a kind of sprite. The graphlink status of an input field is g-active.
An input field has a rendered string called the input-stream.
An input field has a number called the maximum length.

The current field is an input field that varies.


Section - Accepted control input

[The accepted control input serves as a gatekeeper for special characters, such as arrow keys. Any character code listed in this list will be allowed, and we will need special keypress-to-string conversion rules to deal with them.

It would be far better if we could set this initially to a variable (like "current input list"), but Inform does not currently allow for the initial definition of a property to be a variable.]

An input field has a list of numbers called the accepted control input. The accepted control input is usually {-2, -3, 127, -6, -8, -9}.

[-2    left arrow
 -3    right arrow
 -6    
 -8    
 -9    
127   delete


]


Section - Accepted standard input

[The accepted standard input is optional. If we include any numbers in this list, they will act, alongside the accepted control input list, as a filter. No characters outside of these lists will be passed on to the keypress-to-string conversion rules.]

An input field has a list of numbers called the accepted standard input. The accepted standard input is usually {}.


Chapter - Flags

[These flags identify whether we are in input mode, and if so, which input field is being targeted.] 

The char-input mode is a truth state that varies. Char-input mode is false.
An input field can be passive or receptive. An input field is usually passive.


Chapter - Focus on elements

To focus on (element - a sprite):
	repeat with item running through the list of input fields:
		now the item is passive;
	now element is receptive;
	now the current field is element;
	now char-input mode is true.
	
To remove focus from input fields:
	repeat with item running through the list of input fields:
		now the item is passive;
		now the cursor of the input-stream of the item is -99;
		follow the input interpretation rules for the item;
	now char-input mode is false;


Chapter - Phrase to cancel single-character input

To cancel special character input for (S - a sprite):
	follow the drawing rule of the assigned window of S;
	if we are reading a command:
		request line input in main window.


Chapter - The text field input rule

[This rule, which does nothing unless char-input mode is set to true, sets the cursor to the end of the field's text string and starts a loop that reads and acts on single-character input until a terminating key--such as enter, escape, or tab--is pressed. The key is read and processed by the keypress-to-string conversion rules.]

This is the text field input rule:
	if char-input mode is true:
		if we are reading a command, cancel line input in the main window;
		now the cursor of the input-stream of the current field is the number of characters in the text-string of the input-stream of the current field;
		follow the drawing rule of the assigned window of the current field;
		while char-input mode is true:
			follow the keypress-to-string conversion rules for the current field;


Chapter - Keypress-to-string conversion rules

The keypress-to-string conversion rules are an object-based rulebook. The keypress-to-string conversion rulebook has a number called key-press. The keypress-to-string conversion rulebook has a number called len. The keypress-to-string conversion rules have outcome exit (success) and continue (no outcome - the default).


Section - Prepare keypress rule

A keypress-to-string conversion rule (this is the prepare keypress rule):
	now key-press is the chosen letter;
	now len is the number of characters in the text-string of the input-stream of the current field;
	unless key-press is a char listed in the font table of the associated font of the input-stream of the current field or key-press is listed in the accepted control input of the current field:
		exit;
	if the number of entries in the accepted standard input of the current field > 0 and key-press is not listed in the accepted standard input of the current field and key-press is not listed in the accepted control input of the current field:
		exit;

Section - Termination key input

A keypress-to-string conversion rule for an input field when key-press terminates input (this is the keypress terminating input rule):
	remove focus from input fields;
	cancel character input in main window;
	follow the drawing rule of the assigned window of the current field;
	if we are reading a command:
		request line input in main window;
	rule succeeds;

To decide if (keychar - a number) terminates input:
	if keychar is -8 or keychar is -6 or keychar is -9, decide yes;
	decide no.


Section - Standard input

A keypress-to-string conversion rule for an input field when key-press is standard input (this is the keypress of standard input rule):
	if len < maximum length of the current field:
		if the cursor of the input-stream of the current field is 0:
			now the text-string of the input-stream of the current field is "[the string equivalent of key-press][the text-string of the input-stream of the current field]";
		otherwise:
			let temp-buffer be character number (cursor of the input-stream of the current field) in the text-string of the input-stream of the current field;
			replace character number (cursor of the input-stream of the current field) in the text-string of the input-stream of the current field with "[temp-buffer][the string equivalent of key-press]";
		increase the cursor of the input-stream of the current field by 1;

To decide if (keychar - a number) is standard input:
	if (keychar > 31 and keychar < 127) or (keychar > 127 and keychar < 177), decide yes;
	decide no.


Section - Delete key

A keypress-to-string conversion rule for an input field when key-press is a delete key (this is the keypress deleting rule):
	if cursor of the input-stream of the current field > 0:
		replace character number (cursor of the input-stream of the current field) in the text-string of the input-stream of the current field with "";
		decrease cursor  of the input-stream of the current field by 1;

To decide if (keychar - a number) is a delete key:
	if keychar is 127 or keychar is -7, decide yes;
	decide no.


Section - Horizontal movement key (arrow keys)

A keypress-to-string conversion rule for an input field when key-press is a horizontal movement key (this is the keypress horizontal movement rule):
	if key-press is -2:[left arrow]
		decrease cursor of the input-stream of the current field by 1;
	if key-press is -3:[right arrow]
		increase cursor of the input-stream of the current field by 1;
	if cursor of the input-stream of the current field < 0, now cursor of the input-stream of the current field is 0;
	if cursor of the input-stream of the current field > len, now cursor of the input-stream of the current field is len;

To decide if (keychar - a number) is a horizontal movement key:
	if keychar > -4 and keychar < -1, decide yes;
	decide no.


Section - Draw the window (final keypress conversion rule)

The last keypress-to-string conversion rule:
	consider the drawing rule of the assigned window of the current field;


Section - Arranging the keypress conversion rules

The prepare keypress rule is listed first in the keypress-to-string conversion rules.


Chapter - Input interpretation rules

The input interpretation rules are an object-based rulebook.

The input interpretation rules have outcome exit (success - the default) and continue (no outcome).


Section - Default input interpretation rule

An input interpretation rule (this is the default input interpretation rule):
	do nothing.

The default input interpretation rule is listed first in the input interpretation rules.


Section - Fields that accept only numbers

[This section allows for fields that output a number rather than an indexed text.]

An input field has a number that varies called the associated value.

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

To request line input in the/-- main window:
(- glk_request_line_event(gg_mainwin, buffer+WORDSIZE, INPUT_BUFFER_LEN-WORDSIZE, 0);
 -)


Glimmr Canvas Text Input Fields ends here.
