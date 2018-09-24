#include <stdio.h>
#include <X11/Xlib.h>

static int getRootWindowSize(int *w, int *h) {
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

int get_screen_size_x() {
  unsigned int w, h;
  getRootWindowSize(&w,&h);
  return w;
}

int get_screen_size_y() {
  unsigned int w, h;
  getRootWindowSize(&w,&h);
  return h;
}

void set_wallpaper(const char *str) {
  printf("can't automatically set wallpaper on Linux, please set your wallpaper path to ~/.fractalart/wallpaper.bmp\n");
}
