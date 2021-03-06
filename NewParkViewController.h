//
//  NewParkViewController.h
//  MPark
//
//  Created by Steffi Curran on 3/13/13.
//  Copyright (c) 2013 Steffi Curran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Database.h"
#import "Forwarding.h"

@interface NewParkViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>
{
    Database * d;
    CGFloat animatedDistance;
    NSArray * lots;
}
@property (weak, nonatomic) IBOutlet UIButton * Commit;
@property (weak, nonatomic) IBOutlet UIPickerView * LotPicker;
@property (weak, nonatomic) IBOutlet UITextField * NumberBox;
- (IBAction)editingDidBegin:(id)sender;
- (IBAction)editingDidEnd:(id)sender;
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender;
@end
