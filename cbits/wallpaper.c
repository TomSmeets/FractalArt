#ifdef __linux
#include "wallpaper_x11.c"
#elif _WIN32
#include "wallpaper_win32.c"
#else
#error Unsuporrted OS
#endif
