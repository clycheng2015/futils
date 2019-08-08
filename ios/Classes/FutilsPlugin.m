#import "FutilsPlugin.h"
#import "DeviceUID/DeviceUID.h"

@implementation FutilsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"com.toutie.flutter.utils"
            binaryMessenger:[registrar messenger]];
  FutilsPlugin* instance = [[FutilsPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if([@"getDeviceUID" isEqualToString:call.method]) {
      result([DeviceUID uid]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
