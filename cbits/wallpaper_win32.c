#include "wallpaper.h"

#include <stdio.h>
#include <windows.h>

int get_screen_size_x() {
    return GetSystemMetrics(SM_CXVIRTUALSCREEN);
}

int get_screen_size_y() {
    return GetSystemMetrics(SM_CYVIRTUALSCREEN);
}

void set_wallpaper(const char *str) {
    printf("Setting Wallpaper on Windows\n");
    SystemParametersInfo(SPI_SETDESKWALLPAPER, 0, str, SPIF_UPDATEINIFILE);
}
