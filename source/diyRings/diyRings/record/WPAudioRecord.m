//
//  WPAudioRecord.m
//  DiyRings
//
//  Created by li chunyu on 12-11-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "WPAudioRecord.h"

@interface WPAudioRecord(private)
- (void)initSetting;
@end

@implementation WPAudioRecord(private)

- (void)initSetting {
    
    // 默认8k 16bit 双声道
    _formatIDKey = [NSNumber numberWithInt:kAudioFormatLinearPCM];
    _sampleRate  = [NSNumber numberWithFloat:8000.];
    _numberOfChannelsKey = [NSNumber numberWithInt:2];
    _linearPCMBitDepthKey = [NSNumber numberWithInt:16];
    _isFloatKey = [NSNumber numberWithBool:YES];
}

@end

@implementation WPAudioRecord
@synthesize delegate;
@synthesize sampleRate           = _sampleRate;
@synthesize formatIDkey          = _formatIDkey;
@synthesize numberOfChannelsKey  = _numberOfChannelsKey;
@synthesize linearPCMBitDepthKey = _linearPCMBitDepthKey;
@synthesize isFloatKey           = _isFloatKey;
@synthesize urlReconder          = _urlReconder;

- (id)init {
    self = [super init];
    
    [self initSetting];
    NSLog(@"init record parms finish");
    
    return self;
}

- (void)dealloc {
    
    [_recoder stop];
    [_recoder release];
    _recoder = nil;
    
    [super dealloc];
}

- (void)setUrl:(NSURL*)url {
    
    if (!url) {
        return;
    }
}

- (void)setSetting {
}

- (void)start {
    
    if (_recoder) {
        NSLog(@"录音实例已创建，请稍后重试。");
        return;
    }
    
    NSError *error = nil;
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord error:&error];
    
    if (error) {
        NSLog(@"Error setting category: %@", [error description]);
        return;
    }
    
    NSMutableDictionary *settingDict = [NSMutableDictionary dictionaryWithCapacity:5];
    [settingDict setObject:_formatIDKey forKey:AVFormatIDKey];
    [settingDict setObject:_sampleRate forKey:AVSampleRateKey];
    [settingDict setObject:_numberOfChannelsKey forKey:AVNumberOfChannelsKey];
    [settingDict setObject:_linearPCMBitDepthKey forKey:AVLinearPCMBitDepthKey];
    [settingDict setObject:_isFloatKey forKey:AVLinearPCMIsFloatKey];
    
    if (!_urlReconder) {
        _urlReconder = [NSURL URLWithString:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/temp.caf"]];
    }

    error = nil;
    _recoder = [[AVAudioRecorder alloc] initWithURL:_urlReconder settings:settingDict error:&error];
    if (error && error.code != 0) {
        NSLog(@"AVAudioRecorder alloc initwithURL error");
        return;
    }
    
    _recoder.meteringEnabled = YES;
    [_recoder prepareToRecord];
    [_recoder record];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.2f target:self selector:@selector(timer:) userInfo:nil repeats:YES];
}

- (void)stop {
    
    if (_recoder) {
        [_recoder stop];
        [_recoder release];
        _recoder = nil;
    }
    
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}

-(void)timer:(NSTimer *)theTimer {
    
    // 录音实例被释放，则停止定时器
    if (!_recoder) {
        [_timer invalidate];
        _timer = nil;
        return;
    }
    
    // 发送当前的录音大小
    if (delegate && [delegate respondsToSelector:@selector(progressRecord:)]) {
        [_recoder updateMeters];
        float avgPowerForChannel = pow(10, (0.05 * [_recoder averagePowerForChannel:0]));
        [delegate progressRecord:avgPowerForChannel];
        
    }
    
}

@end
