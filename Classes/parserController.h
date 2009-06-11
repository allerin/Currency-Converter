//
//  parserController.h
//  NavigationBased
//
//  Created by Allerin on 03/06/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface parserController : UIViewController {
	NSMutableArray * m_pStories;
	NSMutableDictionary * Country;
	NSString *currentElement;
	NSString * currentname,*currentcurrency;
	NSString *currentvalue; 
	 NSXMLParser * rssParser;
	 NSMutableArray *enclosureAttributesArray;
	NSInteger i;

}
@property (nonatomic,retain)NSMutableArray *m_pStories;

- (void)parseXMLFileAtURL:(NSString *)URL;
@end
