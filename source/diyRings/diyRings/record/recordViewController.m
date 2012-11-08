//
//  recordViewController.m
//  diyRings
//
//  Created by wangping on 12-10-22.
//  Copyright (c) 2012年 lcywp. All rights reserved.
//

#import "RecordViewController.h"

@interface RecordViewController ()

@end

@implementation RecordViewController

@synthesize btn_Record;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"录制铃音";
    }
    return self;
}

- (void)dealloc {
    [super dealloc];
    [_record release];
    _record = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.btn_Record addTarget:self action:@selector(btnRecordAction:) forControlEvents:UIControlEventTouchDown];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)btnRecordAction:(id)sender {
    
    if (!_record) {
        
        [self.btn_Record setImage:[UIImage imageNamed:@"btn_record_on.png"] forState:UIControlStateNormal];
        
        _record = [[WPAudioRecord alloc] init];
        [_record start];
    }
    else {
        
        [self.btn_Record setImage:[UIImage imageNamed:@"btn_record_off.png"] forState:UIControlStateNormal];
        [_record stop];
        [_record release];
        _record = nil;
        
        //测试播放声音(todo)
        AVAudioPlayer * thePlayer  = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL URLWithString:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/temp.caf"]] error:nil];
        [thePlayer play];
    }
}

@end
