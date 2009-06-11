//
//  TocurrencyController.m
//  NavigationBased
//
//  //

#import "TocurrencyController.h"
#import "RootViewController.h"
#import "NavigationBasedAppDelegate.h"


@implementation TocurrencyController
@synthesize pickerItem1, srt;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/
-(void)saveclick:(id)sender

{   	
	NavigationBasedAppDelegate *appDelegate=(NavigationBasedAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	int tagr=[RootViewController tagglobal];
	if(tagr==1)
	{
		//[appDelegate.stringsource setString:srt];
		appDelegate.stringsource=srt;
	}
	if(tagr==2)
	{  		appDelegate.stringtarget=srt;

		//[appDelegate.stringtarget setString:srt];
	}
	[self.navigationController popViewControllerAnimated:YES];
}

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

- (void)viewDidLoad 
{			
	pickerItem1 = [[NSMutableArray  alloc] initWithObjects:@"USD United States Dollors",@"INR Indian Rupees",@"EUR Euro",@"AUD Australia Dollors",@"CAD Canada Dollors",@"CHF Swizerland France",@"CNY China Yaar Renminbi",@"GBP United Kingdom ponds",@"JPY Japan yen",@"MXN Mexico Pesos",@"RUB Russian Rubles",@"ZAR South Africa Rand",@"DKK Denmark Kroner",@"HKD Hong Kong Dollors",@"HUF Hungary Forint",@"MYR Malaysia Ringgits",@"NOK Norway Kroner",@"NZD NewZealand Dollars",@"SEK Sweden Kroner",@"SGD Singapore Dollors",@"THB Thailand Baht",@"AFN Afghanistan",@"DZD Alglria Dinars",@"ARS Arglntina pesos",@"ATS Austria Schillings",@"BSD Bahamas Dollors",@"BSD Bahamas Dollors",@"BHD Bahrain Dinars",@"BBD Barbados Dollors",@"BEF Belgium Francs",@"BMD Bermuda Dollors",@"BRL Brazil Reais",@"BGN Bulgaria Leva",@"CLP Chile Pesos",@"RMB CNX China Yuan Renminbi",@"Cop Colombia Pesos",@"CRC Costa Rice Colones",@"HRK Croatia Kuna" ,nil];
	picker1.showsSelectionIndicator=YES;//for showing the picker
	
	//self.title =@" Convertor ";
	UIBarButtonItem *backButton  = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(Backclick:)];
	self.navigationItem.leftBarButtonItem = backButton;
	[backButton release];
	UIBarButtonItem *saveButton  = [[UIBarButtonItem alloc] initWithTitle:@"Select" style:UIBarButtonItemStylePlain target:self action:@selector(saveclick:)];
	self.navigationItem.rightBarButtonItem = saveButton;
	[saveButton release];
	[super viewDidLoad];
	
}

-(void)Backclick:(id)sender
{
	[self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{ 
	return [pickerItem1 count];
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	NSMutableString *currentItem = [pickerItem1 objectAtIndex:row];
	srt=currentItem;
	return currentItem ;
}

// gets called when the user settles on a row
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	
	NSMutableString *currentItem = [pickerItem1 objectAtIndex:row];
	srt=currentItem;
	NSLog(@"checkvabnnhujksecondpicker%@   vali%d",currentItem,row);
	printf("\n Accuracy set  :%s",[currentItem UTF8String]);
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
