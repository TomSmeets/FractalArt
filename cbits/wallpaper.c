#include <stdio.h>

#ifdef _WIN32
#include <windows.h>
#elif __linux
#include <X11/Xlib.h>
#endif

#include "wallpaper.h"

#ifdef __linux
int getRootWindowSize(int *w, int *h)
{
    Display* pdsp = NULL;
    Window wid = 0;
    XWindowAttributes xwAttr;

    pdsp = XOpenDisplay( NULL );
    if ( !pdsp ) {
        fprintf(stderr, "Failed to open default display.\n");
        return -1;
    }

    wid = DefaultRootWindow( pdsp );
    if ( 0 > wid ) {
        fprintf(stderr, "Failed to obtain the root windows Id "
                        "of the default screen of given display.\n");
        return -2;
    }

    Status ret = XGetWindowAttributes( pdsp, wid, &xwAttr );
    *w = xwAttr.width;
    *h = xwAttr.height;

    XCloseDisplay( pdsp );
    return 0;
}

int
get_screen_size_x()
{
    unsigned int w, h;
    getRootWindowSize(&w,&h);
    return w;
}

int
get_screen_size_y()
{
    unsigned int w, h;
    getRootWindowSize(&w,&h);
    return h;
}

void
set_wallpaper(char *str)
{
    printf("can't automatically set wallpaper on Linux, please set your wallpaper path to ~/.fractalart/wallpaper.bmp\n");
}

#elif _WIN32

int
get_screen_size_x()
{
    return GetSystemMetrics(SM_CXVIRTUALSCREEN);
}

int
get_screen_size_y()
{
    return GetSystemMetrics(SM_CYVIRTUALSCREEN);
}

void
set_wallpaper(char *str)
{
    printf("Setting Wallpaper on Windows\n");
    SystemParametersInfo(SPI_SETDESKWALLPAPER, 0, str, SPIF_UPDATEINIFILE);
}
#else
#error Unsuporrted OS
#endif
