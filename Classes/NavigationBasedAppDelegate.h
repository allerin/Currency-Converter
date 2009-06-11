//
//  NavigationBasedAppDelegate.h
//  NavigationBased
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"
#import"parserController.h"

@interface NavigationBasedAppDelegate : NSObject <UIApplicationDelegate> {
	NSMutableDictionary *currencyDictionary;
	parserController *parserview;
    UIWindow *window;
    UINavigationController *navigationController;
	IBOutlet RootViewController *rootViewController;
	NSMutableString * stringsource; 
	NSMutableString * stringtarget; 
	
	
}
//@property(nonatomic,retain)	IBOutlet RootViewController *rootViewController;
@property(nonatomic,retain)	parserController *parserview;

@property(nonatomic,retain)	NSMutableDictionary *currencyDictionary;

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property(nonatomic,retain)	NSMutableString *stringsource; 
@property(nonatomic,retain)	NSMutableString *stringtarget; 



@end

