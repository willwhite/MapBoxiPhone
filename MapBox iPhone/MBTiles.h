#import <Foundation/Foundation.h>
#import <PhoneGap/PGPlugin.h>

@interface MBTiles : PGPlugin {
    
    NSString* callbackID;  
}

@property (nonatomic, copy) NSString* callbackID;

//Instance Method  
- (void) getTile:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;

@end