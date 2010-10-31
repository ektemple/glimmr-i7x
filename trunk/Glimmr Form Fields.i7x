Version 1/101016 of Glimmr Form Fields (for Glulx only) by Erik Temple begins here.

[Look at zenter zfield zinput--still necessary now that Glulx Input Loops provides control over HandleGlkEvent?]


Chapter - Inclusion control

Include Glimmr Graphic Hyperlinks by Erik Temple.
Include Glimmr Canvas-Based Drawing by Erik Temple.
Include Glulx Input Loops by Erik Temple.


Chapter - Console settings
[This is a "macro" that allows the extension to identify itself in the Glimmr console window with fewer keystrokes on my part.]

To say FFs:
	say "[bracket]Glimmr FFs[close bracket]: ".


Chapter - Defining the window for char input (for use without Text Window Input-Output Control by Erik Temple)
[Char input (keypress input) is only accepted in text windows. While it will appear that we are receiving input in our graphics window, this is illusory. We need always to have at least one open text window that can receive the player's keypress input. We then process this input, ouputting characters, via a rendered string element, to our graphics-window. The input-accepting window will almost always be the main-window, but if we are using Text Window Input-Output Control, it might be some other text window.]

The current text input window is a g-window variable. The current text input window is usually the main-window.


Chapter - Input field definition
[Any element can in principle serve as an input field. An element will be treated as an input field if it has the "form input" property set. 

To make things easier, we allow the user to, if desired, use a kind to define input fields. The input field is defined generically as a kind of g-element. The author will need to specify a more specific kind in her story text, e.g.:

	An input field is a kind of stroked rectangle primitive.

Another option, as always, is to write a custom element display rule for input fields.]

A g-element can be form input. A g-element is usually not form input.

An input field is a kind of g-element. An input field is usually form input. The graphlink status of an input field is usually g-active.

The linked replacement-command of an input field is usually "zenter zfield zinput".

A g-element has a rendered string called the input-stream.
A g-element has a number called the maximum length. The maximum length is usually 1.
A g-element has a g-element called the next-field. The next-field is usually g-null-element.

The current field is a g-element variable.


Section - Accepted control input

[The accepted control input serves as a gatekeeper for special characters, such as arrow keys. Any character code listed in this list will be allowed, and we will need special keypress-to-string conversion activity to deal with them.

It would be far better if we could set this property initially to a variable (like "current input list"), but Inform does not currently allow for the initial definition of a property to be a variable.]

A g-element has a list of numbers called the accepted control input. The accepted control input is usually {-2, -3, 3, 127, -6, -7, -8, -9}.

[-2    left arrow
 -3    right arrow
 -4	up arrow
 -5	down arrow
 -6    return
 -7	backspace/delete
 -8    escape
 -9    tab
-10   page up
-11   page down
-12   home
-13   end
   3	return/enter
127   backspace/delete ]


Section - Accepted standard input
[The accepted standard input is optional. If we include any numbers in this list, they will act, alongside the accepted control input list, as a filter. No characters outside of these lists will be passed on to the keypress-to-string conversion rules.]

A g-element has a list of numbers called the accepted standard input. The accepted standard input is usually {}.


Section - Numerical fields and filter
[A field can be indentified as "numerical," in which case the typed string will automatically be converted into a number by the input interpretation rules (see below). Only numeric characters are counted—a pure text string will produce a value of 0.]

A g-element has a number called the associated value. A g-element can be numerical. A g-element is usually not numerical.

[A filter is provided that can be applied, if the author likes, to numerical fields. This filter will allow only digits and hyphen/en dash to be entered into the field. The filter itself can be customized as needed. Indeed, two phrases for customizing it are included; these will remove the hyphen/en dash from the allowed input—restricting the field to positive digits—or restore these characters to the filter if previously removed. To be effective, these phrases must be invoked before the numerical filter is applied to a field, e.g.:

When play begins:
	disallow negative values in numerical field input;
	repeat with item running through numerical g-elements[input fields, if using that kind]:
		now the accepted standard input of item is the numerical filter.]

The numerical filter is a list of numbers variable. The numerical filter is {45[hyphen for negative numbers], 63[en dash for negative numbers], 48, 49, 50, 51, 52, 53, 54, 55, 56, 57}.

To disallow negative values in numerical field input:
	remove 45 from the numerical filter;
	remove 63 from the numerical filter.

To allow negative values in numerical field input:
	add 45 to the numerical filter;
	add 63 to the numerical filter.


Chapter - Special input loop definition
[This creates an input loop especially for use with field input, using the Glulx Input Loops extension.]

The field char input is an input-loop. The focal event type is char-event.


Section - Input loop event handling rules
[These rules hook into the functionality provided by the Glulx input loops extension. They allow us to "pre-handle" input, flagging it as non-char input (which is what the field char input loop is primarily looking for), and then delay the handling of the event until we bounce back to the VM_ReadKeyboard input loop.]

First input loop event-handling rule for a mouse-event when the current input loop is field char input (this is the delay mouse handling during field input rule):
	now keystroke is the null char;
	delay input handling.

First input loop event-handling rule for a hyperlink-event when the current input loop is field char input (this is the delay hyperlink handling during field input rule):
	now keystroke is the null char;
	delay input handling.

First input loop event-handling rule for a timer-event when the current input loop is field char input (this is the delay timer handling during field input rule):
	now keystroke is the null char;
	delay input handling.


Chapter - Field input mode
[When we are in field-input mode, the game enters an input loop that awaits char input (single keypresses). The field-input mode flag tells us when we need to prepare for, carry out, and recover from this input loop.]

The field-input mode is a truth state that varies. Field-input mode is false.


Chapter - The accepting input field action
[Field input is accepted using the "accepting field input" action—an out of world action. It can be triggered either by the player clicking, or via the "initiate field input" phrase.]

Accepting field input is an action out of world applying to nothing. Understand "zenter zfield zinput" as accepting field input.

To initiate field input in (field - a g-element):
	if the field is form input:
		now the queued field is field;
		try accepting field input;
	otherwise:
		#if utilizing Glimmr debugging;
		say "[>console][FFs]***Warning: Attempted to initiate field input in [i][field][/i], which is a non-input element. The 'initiate field input in' phrase should only be used on g-elements with the 'form input' property.[<]";
		#end if;
		do nothing.


Chapter - Focusing and defocusing
[The field focusing rules and field defocusing rules are provided as a hook for authors. If, for example, we want a field to change appearance when activated or deactivated, these rules are the most convenient place to do that.]

The field focusing rules are an object based rulebook.[This rulebook is a hook for author customization.]

To remove focus from (element - a g-element):
	unless element is g-null-element:
		if the element is not a form input:
			#if utilizing Glimmr debugging;
			say "[>console][FFs]***Warning: Attempted to remove focus from [i][element][/i], a non-input g-element. The 'remove focus from' phrase should only be used on elements with the 'form input' property.[<]";
			#end if;
			do nothing;
		now the cursor of the input-stream of the element is -99;
		follow the input interpretation rules for the element;
		follow the field defocusing rules for the element.[Hook for authors]

The field defocusing rules are an object based rulebook.[This rulebook is a hook for author customization.]


Chapter - Handling mouse input on a field

Graphlink processing rule for a form input g-element (called the field) (this is the field activation graphlink processing rule):
	now the queued field is the field;
	unless the handling field input activity is going on:[We start the accepting field input action if it's not already in motion.]
		now the glulx replacement command is "zenter zfield zinput";
		change the text of the player's command to "zenter zfield zinput";
	rule succeeds.


Section - Allow the field input action to run silently from mouse input

A command-showing rule when glulx replacement command is "zenter zfield zinput" (this is the block command-showing for fake command rule):
	rule succeeds.


Chapter - Handling field input
[The handling field input activity runs during the accepting field input action. We can test whether we are receiving field input anywhere else in our code by checking the status of this activity.]

Handling field input is an activity.

The queued field is a g-element variable.[The queued field is set when we request to move to a new field, whether by clicking on that field or by typing enter or another termination key during field input.]

The field input interrupted is a truth state variable. Field input interrupted is false.[The field input interrupted flag is set to true when we want to restart the entire field-input process, but without completing the accepting field input action—basically, when we've moved to another field via "tab order" (e.g., the enter key)]


Carry out accepting field input:
	set JUMP POINT FieldInput;[we can test whether we arrived here by jumping using the "field input interrupted" flag, at least up until it's reset right before beginning the handling field input activity.]
	now field-input mode is true;
	if the current field is form input:
		follow the input interpretation rules for the current field;[we interpret input anytime a field is clicked on or "tabbed" away from.]
	if the current field is not the queued field:
		remove focus from the current field;[this also runs the input defocusing rules, a hook for authors]
	now the current field is the queued field;
	follow the field focusing rules for the current field;[hook for authors]
	follow the window-drawing rules for the assigned window of the current field;
	now field input interrupted is false;
	begin the handling field input activity;
	if handling the handling field input activity:
		now the cursor of the input-stream of the current field is the number of characters in the text-string of the input-stream of the current field;
		follow the window-drawing rules for the assigned window of the current field;
		while field-input mode is true:
			#if utilizing Glimmr debugging;
			say "[>console][FFs]Accepting keypress input for input field [i][current field][/i] (displayed in [assigned window of the current field]). Cursor placed at position [cursor of the input-stream of the current field].[<]";
			#end if;
			start field char input loop;
			#if utilizing Glimmr debugging;
			say "[>console]Character code entered: [keystroke]; text-string of field: [text-string of the input-stream of the current field] (note that this character will not be added to the text-string until it has been checked by the 'for keypress-to-string conversion' rulebook).[<]";
			#end if;
			if keystroke is the null char and the queued field is not the current field:[The player clicked on a field rather than enter a keystroke]
				break;
			if keystroke is the null char:[field input was interrupted, we must abort]
				remove focus from the current field;
				follow the window-drawing rules for the assigned window of the current field;
				now field-input mode is false;
				break;
			follow the keypress-to-string conversion rules for the current field;
			if the outcome of the rulebook is the terminate conversion outcome:[failure]
				remove focus from the current field;
				follow the window-drawing rules for the assigned window of the current field;
				now field-input mode is false;
				break;
			if the outcome of the rulebook is the restart conversion outcome:[failure]
				follow the window-drawing rules for the assigned window of the current field;
				now field-input mode is false;
				now field input interrupted is true;
				break;
			follow the window-drawing rules for the assigned window of the current field;
	end the handling field input activity;
	if field input interrupted is true:
		JUMP TO FieldInput.[If we have clicked on a field rather than type a keystroke, jump back to the beginning and restart the process with the new field.]

To set jump point FieldInput:
	(- .FieldInput; -)
	
To jump to FieldInput:
	(- jump FieldInput; -)


Chapter - Keypress-to-string conversion activity
[An object based rulebook, but objects are not used in the default rule headers; they can be utilized by authors to target particular fields or groups of fields.]

The keypress-to-string conversion rules are an object based rulebook. The keypress-to-string conversion rules have outcomes terminate conversion (failure), restart conversion (failure), and conversion complete (success). 

The keypress-to-string conversion rulebook has a number called len.


Section - Error-handling rules
[The field input error-handling rules are a hook for authors to provide behavior when an input into a field fails. This is where an error beep would be placed, for example. These rules fire when:

a) The player tries to exceed the maximum number of characters allowed in the field;
b) The player tries to enter a character that's disallowed for the field;
c) The player tries to use the horizontal arrow keys or delete key to move beyond the length of the field;
d) The player tries to enter a character not present in the font.

If we need to discover which of these issues led to the rules being run, we can test various conditions. See the keypress-to-string conversion rules themselves for the conditions that fire the error-handling rules.]

The field input error-handling rules are an object based rulebook.


Section - Set variables and check initial entry requirements

First keypress-to-string conversion rule (this is the field entry initial check rule):
	now len is the number of characters in the text-string of the input-stream of the current field;
	unless keystroke is a char listed in the font table of the associated font of the input-stream of the current field or keystroke is listed in the accepted control input of the current field:
		follow the field input error-handling rules for the field;
		rule succeeds;
	if the number of entries in the accepted standard input of the current field > 0 and keystroke is not listed in the accepted standard input of the current field and keystroke is not listed in the accepted control input of the current field:
		follow the field input error-handling rules for the field;
		rule succeeds.


Section - Termination key input

A keypress-to-string conversion rule when keystroke terminates input (this is the keypress terminating input rule):
	cancel character input in the current text input window;
	replace the regular expression "^\s+" in the text-string of the input-stream of the current field with "";[eliminate leading spaces]
	#if utilizing Glimmr debugging;
	say "[>console][FFs]Received termination code [keystroke] for input field element [i][current field][/i]. Canceling field input in the current text input window ([current text input window]).[<]";
	#end if;
	if the next-field of the current field is form input:
		if keystroke is not -8:[The ESC key (-8) always returns us to regular input—it does not skip to the next field.]
			now queued field is the next-field of the current field;
			restart conversion;
	now field-input mode is false;
	terminate conversion.
		
	
To decide if (keychar - a number) terminates input:
	if keychar is listed in the input-termination commands of the current field, decide yes;
	decide no.

A g-element has a list of numbers called the input-termination commands. The input-termination commands of a g-element is usually {-6, -8, -9, 3}.


Section - Standard input

To say the string equivalent of (N - a number):
	(- print (char) {N}; -)

A keypress-to-string conversion rule when keystroke is standard input (this is the keypress of standard input rule):
	if len < maximum length of the current field:
		let field-input be the input-stream of the current field;
		if the cursor of the field-input is 0:
			now the text-string of the field-input is "[the string equivalent of keystroke][text-string of field-input]";
		otherwise:
			let temp-buffer be character number (cursor of field-input) in the text-string of field-input;
			replace character number (cursor of field-input) in the text-string of field-input with "[temp-buffer][the string equivalent of keystroke]";
		increase the cursor of the field-input by 1;
	otherwise:
		follow the field input error-handling rules for the current field.

To decide if (keychar - a number) is standard input:
	if (keychar > 31 and keychar < 127) or (keychar > 127 and keychar < 177), decide yes;
	decide no.


Section - Delete key

A keypress-to-string conversion rule when keystroke is a delete key (this is the keypress deleting rule):
	if cursor of the input-stream of the current field > 0:
		let field-input be the input-stream of the current field;
		replace character number (cursor of field-input) in text-string of field-input with "";
		decrease cursor of field-input by 1;
	otherwise:
		follow the field input error-handling rules for the current field;
	continue the action.

To decide if (keychar - a number) is a delete key:
	if keychar is 127 or keychar is -7, decide yes;
	decide no.


Section - Horizontal movement key (arrow keys)

A keypress-to-string conversion rule when keystroke is a horizontal movement key (this is the keypress horizontal movement rule):
	if keystroke is -2:[left arrow]
		decrease cursor of the input-stream of the current field by 1;
	if keystroke is -3:[right arrow]
		increase cursor of the input-stream of the current field by 1;
	if cursor of the input-stream of the current field < 0:
		follow the field input error-handling rules for the current field;
		now cursor of the input-stream of the current field is 0;
	if cursor of the input-stream of the current field > len:
		follow the field input error-handling rules for the current field;
		now cursor of the input-stream of the current field is len.

To decide whether (keychar - a number) is a horizontal movement key:
	if keychar > -4 and keychar < -1, decide yes;
	decide no.


Chapter - Input interpretation rules
[Input interpretation is mostly provided as a hook for author-written rules, though a routine for interpreting certain input fields as numbers is included.]

The input interpretation rules are an object based rulebook.

The input interpretation rules have outcome exit (success - the default) and continue (no outcome).


Section - Fields that accept only numbers

An input interpretation rule for a numerical g-element (called the field) (this is the field to number conversion rule):
	if the field is not form input:
		#if utilizing Glimmr debugging;
		say "[>console][FFs]***Warning: The g-element [i][field][/i] has been given the 'numerical' property, but only elements that also have the 'form input' property can be be acted on.[<]";
		#end if;
		continue;
	let val be the text-string of the input-stream of the field as a number;
	now the associated value of the field is val.

To decide which number is (S - indexed text) as a number:
	let is-negative be false;
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
	#if utilizing Glimmr debugging;
	say "[>console][FFs]The input received in numerical field element [i][current field][/i] was interpreted as the number [result].[<]";
	#end if;
	decide on result;


Section  - Helpful phrases

To decide whether glulx char input is supported:
	(- ( glk_gestalt(gestalt_CharInput, 0) ) -)



Glimmr Form Fields ends here.


---- DOCUMENTATION ---- 

Section: Contact info

If you have comments about the extension, please feel free to contact me directly at ek.temple@gmail.com.

Please report bugs on the Google Code project page, at http://code.google.com/p/glimmr-i7x/issues/list.

For questions about Glimmr, please consider posting to either the rec.arts.int-fiction newsgroup or at the infiction forum (http://www.intfiction.org/forum/). This allows questions to be public, where the answers can also benefit others. If you prefer not to use either of these forums, please contact me directly via email (ek.temple@gmail.com).

