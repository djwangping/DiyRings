//
//  recordViewController.h
//  diyRings
//
//  Created by wangping on 12-10-22.
//  Copyright (c) 2012年 lcywp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WPAudioRecord.h"

@interface RecordViewController : UIViewController
{
    WPAudioRecord*   _record;
}

@property (nonatomic,retain) IBOutlet UIButton* btn_Record;

- (void)btnRecordAction:(id)sender;

@end
