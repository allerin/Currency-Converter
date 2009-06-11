//
//  RootViewController.m
//  NavigationBased
//
//
#import"NavigationBasedAppDelegate.h"

#import "RootViewController.h"


int tagglobal;
static int  flag=0;

@implementation RootViewController
@synthesize field1;
- (void)viewDidLoad 
{		     
	NavigationBasedAppDelegate *appDelegate=(NavigationBasedAppDelegate *)[[UIApplication sharedApplication] delegate];
	//parser =[[parserController  alloc]init];

	///pickerItems = [[NSMutableArray  alloc] initWithObjects:@"USD United States Dollers",@"EUR Euro",@" AUD Australia Dollors",@"CAD Canada Doller",@"CHF Swizerland France",@"CNY China Yaar Renminbi",@"GBP United Kingdom ponds",@" JPY Japan yen",@"MXN Mexico Pesos",@"RUB Russian Rubles ",@"ZAR South Africa Rand", nil];
  	 //picker.showsSelectionIndicator=YES;//for showing the picker
	//UILabel *lsorce=[[UILabel alloc]initWithString:appDelegate.stringsource]; 
	//if(flag==0)
	//{
	appDelegate.stringsource=@"USD United States Dollors";
	appDelegate.stringtarget=@"EUR Euro";
	//}
	//else
//	{  
//		appDelegate.stringsource=sourcelabel.text;
//		
//	}
//	//sourcelabel=lsorce;
//	[lsorce release];
	[sourcelabel setText:appDelegate.stringsource];
	 //[appDelegate  stringsource];
	NSLog(@"tagetlabel.text%@",appDelegate.stringsource);

	[tagetlabel setText:appDelegate.stringtarget];

	//tagetlabel.text=appDelegate.stringtarget;
		NSLog(@"tagetlabel.text%@",tagetlabel.text);
	self.title =@" Currency Convertor ";
	
    [super viewDidLoad];
}
- (void)viewWillAppear:(BOOL)animated {
	
	//self.navigationController.navigationBarHidden= YES;
	
	//RootViewController *controlier=[[RootViewController alloc]init];
	//NSString *str=	[[NSString alloc]initWithString:controlier.passwordnumber.text];
	//	NSLog(@"passwordstring  -->%@",str);
	//	[controlier release];
	//[self.view reload];
	NavigationBasedAppDelegate *appDelegate=(NavigationBasedAppDelegate *)[[UIApplication sharedApplication] delegate];

	[sourcelabel setText:appDelegate.stringsource];

	[tagetlabel setText:appDelegate.stringtarget];

    [super viewWillAppear:animated];
}


- (BOOL)textFieldShouldReturn:(UITextField *)theTextField 
	{
		// When the user presses return, take focus away from the text field so that the keyboard is dismissed.
			[theTextField resignFirstResponder];
		return YES;
		}


-(IBAction)convertorclick:(id)sender
{
	//////commend portion done by .plist file
	
	//NavigationBasedAppDelegate *appDelegate=(NavigationBasedAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	//if ( formatter == nil ) {
//		// Specify that I want the modern 10.4 behavior
//		[NSNumberFormatter setDefaultFormatterBehavior:NSNumberFormatterBehavior10_4];
//		// Now allocate our formatter
//		formatter = [[NSNumberFormatter alloc] init];		
//	}
//	// Convert the string into a number first
//	// We set the conversion style each time in case it has changed.
//	//[formatter setNumberStyle:[self conversionMode]];
//	======================.plist=============
/*	NSString *textstring= field1.text;
	NSLog(@"tsghsu%@",field1.text);
	NSLog(@"textsghjj%@",textstring);
	formatter=[[NSNumberFormatter alloc]init];
	NSNumber *textnumber=[[NSNumber alloc]init];
	textnumber =[formatter numberFromString:textstring];
	NSLog(@"%@",textnumber);
	double textn=[textnumber doubleValue];
	//NSLog(@"%l",textn);
   NSNumber *sourceno =[appDelegate.currencyDictionary valueForKey:sourcelabel.text];
double sn = [sourceno doubleValue];
	//NSLog(@"%f",sn);
double product= textn * sn;
//	NSNumber *pro= textnumber* sourceno;
	NSNumber *targetno=[appDelegate.currencyDictionary valueForKey:tagetlabel.text ];
	double tn=[targetno doubleValue];
	
//	NSNumber z=[[NSNumber alloc]init];
double z= product / tn ;
	//NSLog(@"ourgy%f",z);
	NSNumber *outputdata=[NSNumber numberWithDouble:z];
	NSLog(@"fvhgaanmajmak%@",outputdata);
//NSNumber outputdata=
//	[NSNumber numberWithFloat:z];
	NSString *outputstr=[formatter stringFromNumber:outputdata];
//	//output.text=outputstr;
	NSLog(@"%@",outputstr);
	NSLog(@"text%@",output.text);
	//NSString *totalstring=[[NSString alloc] init];
	NSString *sorceContent =[sourcelabel.text substringToIndex:3];
	NSString *targetContent =[tagetlabel.text substringToIndex:3];


	//NSString *baseString = @"Base string.";
	NSString *string2 = [field1.text stringByAppendingFormat:@" %@  =  %@ %@",sorceContent,outputstr,targetContent];
	[output setText:string2];
 ============================/*/
//by	parserControllerclass BY pooja on 6 june by using nsxmlparser=====================
	//BOOL sorceflag = YES;
	///BOOL targetFlag = YES;
	NSString *textstring= field1.text;
	NSLog(@"tsghsu%@",field1.text);
	NSLog(@"textsghjj%@",textstring);
	formatter=[[NSNumberFormatter alloc]init];
	NSNumber *textnumber=[[NSNumber alloc]init];
	textnumber =[formatter numberFromString:textstring];
	NSLog(@"%@",textnumber);
	double textn=[textnumber doubleValue];
	NSLog(@"textn==>%lf",textn);
	//NSData *data=[[NSData alloc]initWithContentsOfFile:@"http://192.168.1.212:4000/pooja/Newcurrency.xml "];
//	NSLog(@"hjllll%@",data);
	//NSMutableDictionary *d=[[NSMutableDictionary alloc]initWithObjects
	//NSLog(@"hjldata%@",d);
	parser =[[parserController  alloc]init];
	//[parser parseXMLFileData:data];
	[parser parseXMLFileAtURL:@"http://192.168.1.212:4000/pooja/Newcurrency.xml"];
   NSMutableArray *array=[[NSMutableArray alloc]init];
	NSMutableDictionary * dic=[[NSMutableDictionary alloc]init];
	array=parser.m_pStories;
	NSNumber *sourceno;
	NSNumber *targetno;
	double tn;
	double sn;
	double z;
	NSString *sorucexmlvalue=[[NSString alloc]init];
	NSString *targetxmlvalue=[[NSString alloc]init];
    
	NSLog(@"====array%@",array);
	int c=[array count];
	int si =0;
	int ti =0;
	while(si<c)
	{   NSString *macthstr=[[NSString alloc]init];
		dic=[array objectAtIndex: si];
		macthstr =[dic valueForKey:@"CurrencyName"];
	
		if([macthstr  isEqual:sourcelabel.text])
		    {
			sorucexmlvalue=[dic valueForKey:@"value"];
			sourceno=[formatter numberFromString:sorucexmlvalue];
			sn=[sourceno doubleValue];
			//sorceflag = NO;
			
			break;
		 }
		else
		{
		 si=si+1; 
		}
	 	
	}
	
	
 while(ti< c)
	{  NSString *macthst=[[NSString alloc]init];
		dic=[array objectAtIndex:ti];
		 macthst =[dic valueForKey:@"CurrencyName"];
			
		if([macthst  isEqual:tagetlabel.text])
		{
			targetxmlvalue=[dic valueForKey:@"value"];
			targetno =[formatter numberFromString:targetxmlvalue];
			tn = [targetno doubleValue];
			NSLog(@"tag tn%lf",tn);
			//sorceflag = NO;
			break;
		}
		else
		{
		ti=ti+1; 
		}
	
	     	
	}
	
	double product= textn * sn;
	NSLog(@"produ%lf",product);
	//if([tagetlabel.text isEqual:@"INR Indian Rupees"])
//	{
//		z= product *tn;
//	}
//	else
	//{  
		z= product / tn ;
	//}
  
NSLog(@"ourgy%lf",z);
	NSNumber *outputdata=[NSNumber numberWithDouble:z];
	NSLog(@"fvhgaanmajmak%@",outputdata);
	//NSNumber outputdata=
	//	[NSNumber numberWithFloat:z];
	NSString *outputstr=[formatter stringFromNumber:outputdata];
	//	//output.text=outputstr;
	NSLog(@"%@",outputstr);
	//NSLog(@"text%@",output.text);
	//NSString *totalstring=[[NSString alloc] init];
	NSString *sorceContent =[sourcelabel.text substringToIndex:3];
	NSString *targetContent =[tagetlabel.text substringToIndex:3];
	
	
	//NSString *baseString = @"Base string.";
	NSString *string2 = [field1.text stringByAppendingFormat:@" %@  =  %@ %@",sorceContent,outputstr,targetContent];
	[output setText:string2];
	

	
	//NSLog(@"%l",textn);
	//NSNumber *sourceno =[appDelegate.currencyDictionary valueForKey:sourcelabel.text];
//	double sn = [sourceno doubleValue];
//	

	
	
	
 
	}

-(IBAction)sourcecilck:(id)sender


{    flag=flag+1;
	int tag=[sender tag];
	NSLog(@"tagso%d",tag);
	tagglobal=tag;
	
	[self.navigationController pushViewController:tocontroller animated:YES];
 
}
-(IBAction)targetclick:(id)sender

{    flag=flag+1;
	int tag=[sender  tag];
	tagglobal=tag;
	NSLog(@"tagtar%d",tag);

	[self.navigationController pushViewController:tocontroller animated:YES];

}
+(int)tagglobal
{
	return tagglobal;
	
}



//- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
//{
//	return 1;
//}
//- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
//{ 
//	return [pickerItems count];
//}
//- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
//{
//	NSString *currentItem = [pickerItems objectAtIndex:row];
//	return currentItem ;
//}
//
//// gets called when the user settles on a row
//- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
//{
//	
//	NSString *currentItem = [pickerItems objectAtIndex:row];
//	NSLog(@"chjecxhjkofirstpiccker%@   vali%d",currentItem,row);
//
//	printf("\n Accuracy set  :%s",[currentItem UTF8String]);
//}
///*
//// The designated initializer. Override to perform setup that is required before the view is loaded.
//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
//    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
//        // Custom initialization
//    }
//    return self;
//}
//*/
//
///*
//// Implement loadView to create a view hierarchy programmatically, without using a nib.
//- (void)loadView {
//}
//*/
//
///*
//// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
//- (void)viewDidLoad {
//    [super viewDidLoad];
//}
//*/
//
///*
//// Override to allow orientations other than the default portrait orientation.
//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
//    // Return YES for supported orientations
//    return (interfaceOrientation == UIInterfaceOrientationPortrait);
//}
//*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	//[pickerItems release];
    [super dealloc];
}


@end
