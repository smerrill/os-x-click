// File:
// click.m
//
// Compile with:
// gcc -o click click.m -framework ApplicationServices -framework Foundation
//
// Usage:
// ./click -x pixels -y pixels
// At the given coordinates it will click and release.

#import <Foundation/Foundation.h>
#import <ApplicationServices/ApplicationServices.h>

int main(int argc, char *argv[]) {
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
  NSUserDefaults *args = [NSUserDefaults standardUserDefaults];

  // grabs command line arguments -x and -y
  int x = [args integerForKey:@"x"];
  int y = [args integerForKey:@"y"];

  // The data structure CGPoint represents a point in a two-dimensional
  // coordinate system.  Here, X and Y distance from upper left, in pixels.
  //
  CGPoint pt;
  pt.x = x;
  pt.y = y;

  //  CGEventRef CGEventCreateMouseEvent (
  //    CGEventSourceRef source,
  //    CGEventType mouseType,
  //    CGPoint mouseCursorPosition,
  //    CGMouseButton mouseButton
  //  );
  CGEventRef clickEvent = CGEventCreateMouseEvent(NULL, kCGEventLeftMouseDown, pt, kCGMouseButtonLeft);
  CGEventPost(kCGHIDEventTap, clickEvent);
  CFRelease(clickEvent);

  clickEvent = CGEventCreateMouseEvent(NULL, kCGEventLeftMouseUp, pt, kCGMouseButtonLeft);
  CGEventPost(kCGHIDEventTap, clickEvent);
  CFRelease(clickEvent);

  [pool release];
  return 0;
}

