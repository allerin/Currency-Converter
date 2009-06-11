//
//  URLCacheConnection.h
//  NavigationBased
//
//  Created by Allerin on 08/06/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol URLCacheConnectionDelegate;

@interface URLCacheConnection : NSObject 
{
			
	id <URLCacheConnectionDelegate> delegate;
	NSMutableData *receivedData;
	NSDate *lastModified;
		//NSMutableArray *m_pReceivedImages;
		//	
}
@property (nonatomic, assign) id delegate;
@property (nonatomic, retain) NSMutableData *receivedData;
@property (nonatomic, retain) NSDate *lastModified;
//@property (nonatomic, retain) NSMutableArray *m_pReceivedImages;
- (id) initWithURL:(NSURL *)theURL delegate:(id<URLCacheConnectionDelegate>)theDelegate;
@end

@protocol URLCacheConnectionDelegate<NSObject>

- (void) connectionDidFail:(URLCacheConnection *)theConnection;
- (void) connectionDidFinish:(URLCacheConnection *)theConnection;
@end

