#import "MmkvFlutterPlugin.h"
#import <MMKV/MMKV.h>

#define KEY @"key"
#define VALUE @"value"

@interface MmkvFlutterPlugin()
@property (strong,nonatomic) MMKV *mmkv;
@end

@implementation MmkvFlutterPlugin

-(MMKV*)mmkv{
    if(_mmkv==nil){
        _mmkv = [MMKV defaultMMKV];
    }
    return _mmkv;
}


+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"mmkv_flutter"
            binaryMessenger:[registrar messenger]];
  MmkvFlutterPlugin* instance = [[MmkvFlutterPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSString *method = [call method];
    NSDictionary *arguments = [call arguments];

    if([method isEqualToString:@"setBool"]){
        NSString *key = arguments[KEY];
        NSNumber *value = arguments[VALUE];
        [self.mmkv setBool:value.boolValue forKey:key];
        result(@YES);
    }else if([method isEqualToString:@"getBool"]){
        NSString *key = arguments[KEY];
        bool res = [self.mmkv getBoolForKey:key];
        result([NSNumber numberWithBool:res]);
    } else if([method isEqualToString:@"setInt"]){
        NSString *key = arguments[KEY];
        NSNumber *value = arguments[VALUE];
        [self.mmkv setInt32: value.intValue forKey:key];
        result(@YES);
    }else if([method isEqualToString:@"getInt"]){
        NSString *key = arguments[KEY];
        int res = [self.mmkv getInt32ForKey:key];
        result([NSNumber numberWithInt:res]);
    } else if([method isEqualToString:@"setLong"]){
        NSString *key = arguments[KEY];
        NSNumber *value = arguments[VALUE];
        [self.mmkv setInt64:value.longValue forKey:key];
        result(@YES);
    }else if([method isEqualToString:@"getLong"]){
        NSString *key = arguments[KEY];
        long res = [self.mmkv getInt64ForKey:key];
        result([NSNumber numberWithLong:res]);
    } else if([method isEqualToString:@"setDouble"]){
        NSString *key = arguments[KEY];
        NSNumber *value = arguments[VALUE];
        [self.mmkv setDouble:value.doubleValue forKey:key];
        result(@YES);
    }else if([method isEqualToString:@"getDouble"]){
        NSString *key = arguments[KEY];
        double res = [self.mmkv getDoubleForKey:key];
        result([NSNumber numberWithDouble:res]);
    } else if([method isEqualToString:@"setString"]){
        NSString *key = arguments[KEY];
        NSString *value = arguments[VALUE];
        [self.mmkv setObject:value forKey:key];
        result(@YES);
    }else if([method isEqualToString:@"getString"]){
        NSString *key = arguments[KEY];
        NSString *res = (NSString *)[self.mmkv getObjectOfClass:NSString.class forKey:key];
        if(res==nil){
            res=@"";
        }
        result(res);
    } else if([method isEqualToString:@"removeByKey"]){
        NSString *key = arguments[KEY];
        [self.mmkv removeValueForKey:key];
        result(@YES);
    }else if([method isEqualToString:@"clear"]){
        [self.mmkv clearAll];
        result(@YES);
    } else {
        result(FlutterMethodNotImplemented);
    }
}

@end
