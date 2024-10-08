/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom */
static int colorprompt = 1;                 /* -p  option; if 1, prompt uses SchemeSel, otherwise SchemeNorm */
static int centered = 1;                    /* -c option; centers dmenu on screen */
static int min_width = 500;                 /* minimum width when centered */
static const unsigned int alpha = 0xff;     /* Amount of opacity. 0xff is opaque */
/* -fn option overrides fonts[0]; default X11 font or font set */
static char font[] = "Iosevka:size=10";
static const char *fonts[] = {
       font,
       "NotoColorEmoji:pixelsize=8:antialias=true:autohint=true"
};

static char *prompt      = NULL;      /* -p  option; prompt to the left of input field */

static char normfgcolor[] = "#bbbbbb";
static char normbgcolor[] = "#222222";
static char selfgcolor[]  = "#eeeeee";
static char selbgcolor[]  = "#005577";
static char *colors[SchemeLast][2] = {
	/*               fg           bg         */
        [SchemeNorm] = { normfgcolor, normbgcolor },
        [SchemeSel]  = { selfgcolor,  selbgcolor  },
        [SchemeOut]  = { "#000000",   "#00ffff" },

};

static const unsigned int alphas[SchemeLast][2] = {
	[SchemeNorm] = { OPAQUE, alpha },
	[SchemeSel] = { OPAQUE, alpha },
	[SchemeOut] = { OPAQUE, alpha },
};
/* -l and -g options; controls number of lines and columns in grid if > 0 */
static unsigned int lines      = 8;
static unsigned int columns    = 3;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";

/* Size of the window border */
static unsigned int border_width = 2;

/*
 * Xresources preferences to load at startup
 */
ResourcePref resources[] = {
        { "color15",     STRING,  &normfgcolor },
        { "color0",      STRING,  &normbgcolor },
        { "color0",      STRING,  &selfgcolor },
        { "color4",      STRING,  &selbgcolor },
        { "prompt",      STRING,  &prompt },
};
