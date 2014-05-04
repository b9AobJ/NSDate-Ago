//
//  NSDate+Ago.m
//  LCAppliances
//
//  Created by Baby on 14-5-4.
//  Copyright (c) 2014年 *****. All rights reserved.
//

#import "NSDate+Ago.h"

@implementation NSDate_Ago

//比如说有当前文章的发表时间，那么theDate就是这个时间，然后这个方法返回的字符串就是你需要的时间，几分钟前，或者几小时前，具体的需求再重新修改就可以了
- (NSString*)intervalSinceNow: (NSString*) theDate
{
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *d=[date dateFromString:theDate];
    NSTimeInterval late=[d timeIntervalSince1970]*1;
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval now=[dat timeIntervalSince1970]*1;
    NSString *timeString=@"";
    NSTimeInterval cha= now - late;
    
    //发表在1小时之内
    if(cha / 3600 < 1) {
        if(cha / 60 < 1) {
            timeString = @"1";
        }
        else
        {
            timeString = [NSString stringWithFormat:@"%f", cha/60];
            timeString = [timeString substringToIndex:timeString.length-7];
        }
        
        timeString=[NSString stringWithFormat:@"%@分钟前", timeString];
    }
    //在一小时以上24小以内
    else if(cha / 3600 > 1 && cha / 86400 < 1) {
        timeString = [NSString stringWithFormat:@"%f", cha / 3600];
        timeString = [timeString substringToIndex:timeString.length - 7];
        timeString=[NSString stringWithFormat:@"%@小时前", timeString];
    }
    //发表在24以上10天以内
    else if(cha / 86400 > 1 && cha / 864000 < 1)
    {
        timeString = [NSString stringWithFormat:@"%f", cha / 86400];
        timeString = [timeString substringToIndex:timeString.length - 7];
        timeString=[NSString stringWithFormat:@"%@天前", timeString];
    }
    //发表时间大于10天
    else
    {
        //        timeString = [NSString stringWithFormat:@"%d-%"]
        NSArray *array = [theDate componentsSeparatedByString:@" "];
        //        return [array objectAtIndex:0];
        timeString = [array objectAtIndex:0];
        timeString = [timeString substringWithRange:NSMakeRange(5, [timeString length]-5)];
    }
    return timeString;
}

@end
