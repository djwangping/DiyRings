//
//  WPAudioRecord.h
//  DiyRings
//
//  Created by wangpingå on 12-11-7.
//  Copyright (c) 2012年 Wangping. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WPAudioRecordDeletate<NSObject>

// 录音声音大小
- (void)progressRecord:(float)value;

@end

@class AVAudioRecorder;
@interface WPAudioRecord : NSObject
{
    id<WPAudioRecordDeletate> delegate;
    
    NSNumber*             _formatIDKey;
    NSNumber*             _sampleRate;
    NSNumber*             _numberOfChannelsKey;
    NSNumber*             _linearPCMBitDepthKey;
    NSNumber*             _isFloatKey;
    
    NSURL*                _urlReconder;
    
    AVAudioRecorder*      _recoder;
    NSTimer*              _timer;
}

@property (nonatomic,assign) id<WPAudioRecordDeletate> delegate;
@property (nonatomic,copy) NSNumber* formatIDkey;
@property (nonatomic,copy) NSNumber* sampleRate;
@property (nonatomic,copy) NSNumber* numberOfChannelsKey;
@property (nonatomic,copy) NSNumber* linearPCMBitDepthKey;
@property (nonatomic,copy) NSNumber* isFloatKey;
@property (nonatomic,copy) NSURL*    urlReconder;

- (void)start;
- (void)stop;
- (void)timer:(NSTimer *)theTimer;
@end
