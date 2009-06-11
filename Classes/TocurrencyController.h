//
//  TocurrencyController.h
//  NavigationBased
//
//

#import <UIKit/UIKit.h>


@interface TocurrencyController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource> {
	IBOutlet UIPickerView *picker1;
	NSMutableArray *pickerItem1;
	NSMutableString  *srt;
	
}
@property(nonatomic,retain)	NSString *srt;

@property (nonatomic,retain)NSMutableArray *pickerItem1;

-(void)Backclick:(id)sender;

-(void)saveclick:(id)sender;

@end
