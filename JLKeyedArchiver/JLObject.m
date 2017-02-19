//
//  JLObject.m
//  JLKeyedArchiver
//
//  Created by afyylong on 2017/2/19.
//  Copyright © 2017年 afyylong. All rights reserved.
//

#import "JLObject.h"
#import <objc/message.h>



@implementation JLObject



- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i++) {
        //单个成员变量
        Ivar ivar = ivars[i];
        //获取变量名
        const char *name = ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:name];
        //归档  kvc 由key获取对应的值 self是对象
        [aCoder encodeObject:[self valueForKey:key] forKey:key];
    }
    // C 中遇到copy create new 需要释放，因为返回的是指针
    free(ivars);
}

- (instancetype)initWithCoder:(NSCoder *)Decoder {
    
    if (self = [super init]) {
        //解档
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([self class], &count);
        for (int i = 0; i < count; i++) {
            //单个成员变量
            Ivar ivar = ivars[i];
            //获取变量名
            const char *name = ivar_getName(ivar);
            NSString *key = [NSString stringWithUTF8String:name];
            //解档  kvc 由key获取对应的值 self是对象
            id value = [Decoder decodeObjectForKey:key];
            //kvc 设置
            [self setValue:value forKey:key];
        }
        // C 中遇到copy create new 需要释放，因为返回的是指针
        free(ivars);
    }
    return self;
}








@end
