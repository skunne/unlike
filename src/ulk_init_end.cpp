#include <curses.h>

void ulk_init(void)
{
	initscr();
	cbreak();
	noecho();
}

void ulk_end(void)
{
	endwin();
}
