//
//  NewParkViewController.h
//  MPark
//
//  Created by Steffi Curran on 3/13/13.
//  Copyright (c) 2013 Steffi Curran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewParkViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSArray * lots;
}
@property (weak, nonatomic) IBOutlet UIButton * Commit;
@property (weak, nonatomic) IBOutlet UIPickerView * LotPicker;
@property (weak, nonatomic) IBOutlet UITextField * NumberBox;

@end
