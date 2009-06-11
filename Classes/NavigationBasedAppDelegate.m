//
//  NavigationBasedAppDelegate.m
//  NavigationBased
//
//  
//  
//

#import "NavigationBasedAppDelegate.h"

@implementation NavigationBasedAppDelegate

@synthesize window;
@synthesize navigationController;
@synthesize stringtarget,stringsource,currencyDictionary; 


- (void)applicationDidFinishLaunching:(UIApplication *)application 
{     
	NSMutableArray *the_pPathArray =[[NSMutableArray alloc] initWithArray:NSSearchPathForDirectoriesInDomains (NSDocumentDirectory,NSAllDomainsMask ,YES)];
	NSString *the_pDocPath=[the_pPathArray objectAtIndex:0];
	NSString *the_pDocplistPath=[the_pDocPath stringByAppendingString:@"/Currencydata.plist"];
	// Check for data in Documents directory. Copy default appData.plist to Documents if not found.
 	NSFileManager *the_pFileManager = [NSFileManager defaultManager];
	NSString * the_pPath = [[NSBundle mainBundle] pathForResource:@"Currencydata" ofType:@"plist"];
	NSLog(@"%@",the_pPath);
    if ([the_pFileManager fileExistsAtPath:the_pPath] == YES) 
	{
	[the_pFileManager copyItemAtPath:the_pPath toPath:the_pDocplistPath error:NULL];
//		Data *the_pData = [[Data alloc] initWithDictionary:[NSDictionary dictionaryWithContentsOfFile:the_pDocplistPath ]];
//		self.m_pData = the_pData;
//		[the_pData release];
		NSMutableDictionary *data=[[NSMutableDictionary alloc]initWithDictionary:[NSMutableDictionary dictionaryWithContentsOfFile:the_pDocplistPath]];
		self.currencyDictionary=data;
		NSLog(@"data dixc%@",currencyDictionary);
		[data release];
	}
	
	
	self.stringtarget=@"EUR Euro";
	self.stringsource=@"USD United States Dollors";
	//NSLog(@"alles%@",self.stringtarget);
	//NSLog(@"alleta%@",self.stringsource);

	[navigationController pushViewController:rootViewController animated:NO];
	// Configure and show the window
	[window addSubview:[navigationController view]];
	[window makeKeyAndVisible];
}

- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


- (void)dealloc {
	[stringtarget release];
	[stringsource release];
	[navigationController release];
	[window release];
	[super dealloc];
}

@end
