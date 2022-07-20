//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"",	"~/scripts/dwm-bar/bar-functions/dwm_resources.sh",	30,	0},
	{"",	"~/scripts/dwm-bar/bar-functions/dwm_battery.sh",	30,	0},
	{"",	"~/scripts/dwm-bar/bar-functions/dwm_alsa.sh",		5,	0},
	{"",	"~/scripts/dwm-bar/bar-functions/dwm_date.sh",		5,	0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
