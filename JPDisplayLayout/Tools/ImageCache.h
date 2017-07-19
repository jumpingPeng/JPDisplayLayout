//
//  ImageCache.h
//  DisplayLayout
//
//  Created by 贾鹏 on 2016/7/19.
//  Copyright © 2016年 贾鹏. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface ImageCache : NSObject
+ (instancetype)shareInstance;
- (id)getCacheImage: (NSString *)key;
- (id)getCacheYYImage: (NSString *)key;
@end
