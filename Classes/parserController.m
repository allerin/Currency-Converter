//
//  parserController.m
//  NavigationBased
//
//  Created by Allerin on 03/06/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "parserController.h"


@implementation parserController
@synthesize m_pStories;

- (void)parseXMLFileAtURL:(NSString *)URL;

{   	
	m_pStories=[[NSMutableArray alloc]init]; 
	//rssParser=[[NSXMLParser alloc]initWithData:the_data];
	NSURL *xmlURL = [NSURL URLWithString:URL];

	rssParser =[[NSXMLParser alloc]initWithContentsOfURL:xmlURL];
	[ rssParser setDelegate:self];
	[ rssParser setShouldProcessNamespaces:YES];
	[ rssParser setShouldReportNamespacePrefixes:YES];
	[ rssParser setShouldResolveExternalEntities:YES];
	[ rssParser parse];
}
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
	NSString * errorString = [NSString stringWithFormat:@"Unable to download story feed from web site (Error code %i )", [parseError code]];
	NSLog(@"error parsing XML: %@", errorString);
	UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"Error loading content" message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[errorAlert show];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{			
	currentElement = [elementName copy];
	if ([elementName isEqual:@"Currency"]) {
		// clear out our story item caches...
		enclosureAttributesArray = [[NSMutableArray alloc] init];
	}
	if([elementName isEqual:@"Country"])
		
	{
		Country = [[NSMutableDictionary alloc] init];
		//currentname = [[NSMutableString alloc] init];
		////currentcurrency = [[NSMutableString alloc] init];
		///currentvalue=[[NSMutableString alloc]init];
		
		NSString * s=[attributeDict valueForKey:@"name"];
		NSLog(@"dscfsvsh%@",s);
		NSString *s2=[attributeDict valueForKey:@"CurrencyName"];
	NSLog(@"dscfsvsh%@",s);

		NSNumber *s3=[attributeDict valueForKey:@"value"];
		NSLog(@"dscfsvsh%@",s);
	}
		if([elementName isEqual:@"name"])
		{		
			currentname = [[NSString alloc] init];

		}		
		if([elementName isEqual:@"CurrencyName"])
		{		
			currentcurrency= [[NSString alloc] init];
			
		}	
		if([elementName isEqual:@"value"])
		{		
			currentcurrency= [[NSString alloc] init];
			
		}	
		
		//NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithDictionary:attributeDict];
//		[enclosureAttributesArray addObject:dic];
//		[dic release];
	
}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{     
	if ([elementName isEqual:@"name"]) 
	{
		// save values to an item, then store that item into the array...
		[Country setObject:currentname forKey:@"name"];
	}
	if ([elementName isEqual:@"CurrencyName"]) 
    {
		[Country setObject:currentcurrency forKey:@"CurrencyName"];
	}

if ([elementName isEqual:@"value"]) 
   {

		[Country setObject:currentvalue forKey:@"value"];
	   NSLog(@"dfghjjkk%@",Country);
	   //[m_pStories insertObject:Country  atIndex:i];
	   //i=i+1;
	   [m_pStories addObject:Country];
	    if([m_pStories count]==10)
		{ 
			NSLog(@"m_sghjkk%@",m_pStories);
		}
	}
	
	////[m_pStories addObject:Country]/// ERROR COMES ON THAT LINE 
	//NSLog(@"item :%@",Country);

}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
	
	if ([currentElement isEqual:@"name"]) {
		
		///[currentname setString:string];
		currentname=string;
		NSLog(@"currentname chkk%@",currentname);
	} 
	else if ([currentElement isEqual:@"CurrencyName"]) 
	{ 		currentcurrency=string;

		//[currentcurrency setString:string];
	} 
	else if ([currentElement isEqual:@"value"]) 
	{
		//[currentvalue  setString:string];
		currentvalue = string;
}
}




/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	i=0;
    [super viewDidLoad];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}


@end
