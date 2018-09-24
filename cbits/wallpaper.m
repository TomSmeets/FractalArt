#include <stdlib.h>

@import AppKit;

NSSize getRootWindowSize() {
  @autoreleasepool {
    NSRect frame = [NSScreen mainScreen].frame;
    return frame.size;
  }
}

int get_screen_size_x() {
  return (int)getRootWindowSize().width;
}

int get_screen_size_y() {
  return (int)getRootWindowSize().height;
}

void set_wallpaper(const char *str) {
  @autoreleasepool {
    NSWorkspace *sws = [NSWorkspace sharedWorkspace];
    NSScreen *screen = [NSScreen mainScreen];
    NSURL *image = [NSURL fileURLWithPath:[NSString stringWithUTF8String:str]];

    NSDictionary *opts = [sws desktopImageOptionsForScreen:screen];
    [sws setDesktopImageURL:image forScreen:screen options:opts error:nil];
  }
}
