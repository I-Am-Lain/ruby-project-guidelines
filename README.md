# CRUDAGOTCHI

A clone for the virtual pet Tamagotchi, a toy from the '90s that featured an egg-shaped design with an LCD 
screen on the front for viewing and interacting with your digital friend. 

Originally includes functions for viewing stats, feeding them, playing with them, cleaning them, and putting them to bed. Depending on how they are raised, they could also grow into new forms, or even pass away if neglected!

## Getting Started

https://github.com/I-Am-Lain/ruby-project-guidelines
Run "ruby bin/run.rb" from within the project folder to begin playing.



1. Upon startup, you are asked for a Username. 
2. If this Username is matching (case-sensitive) to a previous Username entered, will remember you.

3. You begin with no Tamagotchis. To start caring for one, select "Adopt" to take joint-custody of an 
already-created one, or select "Create New Egg" to start en entirely new one!

4. Once you have a Tama of your own:

	1. "View My Tamas"
		- Displays all tamas that you currently own. Tamas have a hunger and happy meter, = X/10
		- If either meter reaches 0, the Tama will pass.
  2. "Feed"
		- Increases all owned Tamas Hunger meter by 1
	3. "Play"
		- Increases all owned Tamas Happy meter by 1
	4. "Adopt"
		- Adopt an already-created (and still alive), granting User access to caring for the Tama
	5. "Create New Egg"
		- Create a brand-new Tamagotchi. First prompts for name, default name is "Lil' Bub"
	6. "Quit"
		- Quits application.
5. Your tama babies will lose 1 hunger every 1 minute, and 1 happiness every 2 minutes.

---
### Gems Required

gem 'artii' - Creates ASCII out of strings
gem 'rainbow' - Color text
gem "tty-box" - Create fully adjustable boxes in the CLI
gem "tty-prompt" - Implements Selector
gem "tty-table" - Creates ASCII-fied tables

### Authors

William Vetter - https://github.com/I-Am-Lain
Zack Carlson - https://github.com/ZaQuarius15
