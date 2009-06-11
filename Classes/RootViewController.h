//
//  RootViewController.h
//  NavigationBased
//
// 
#import <UIKit/UIKit.h>
#import"TocurrencyController.h"
#import"parserController.h"

@interface RootViewController : UIViewController<UITextViewDelegate>
{    NSNumberFormatter *formatter;
	IBOutlet UILabel *output;

	IBOutlet UILabel *label1;
	IBOutlet UIButton *source;
	IBOutlet UIButton *target;
 	IBOutlet UILabel  *sourcelabel;
 	IBOutlet UILabel  *tagetlabel;
	IBOutlet UITextField *field1; 
	//IBOutlet UIPickerView *picker;
	//NSMutableArray *pickerItems;
	IBOutlet UIButton *convertor;
	parserController *parser;
	IBOutlet TocurrencyController *tocontroller;
}
-(IBAction)convertorclick:(id)sender;
-(IBAction)sourcecilck:(id)sender;
-(IBAction)targetclick:(id)sender;
+(int)tagglobal;


//-(IBAction)enter:(id)sender;
@property(nonatomic,retain)IBOutlet UITextField *field1; 
//@
//@property (nonatomic,retain)NSMutableArray *pickerItems;

@end
