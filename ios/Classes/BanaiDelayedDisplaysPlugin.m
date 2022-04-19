#import "BanaiDelayedDisplaysPlugin.h"
#if __has_include(<banai_delayed_displays/banai_delayed_displays-Swift.h>)
#import <banai_delayed_displays/banai_delayed_displays-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "banai_delayed_displays-Swift.h"
#endif

@implementation BanaiDelayedDisplaysPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBanaiDelayedDisplaysPlugin registerWithRegistrar:registrar];
}
@end
