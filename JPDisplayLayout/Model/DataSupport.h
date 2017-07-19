//
//  DataSupport.h
//  DisplayLayout
//
//  Created by 贾鹏 on 2016/7/19.
//  Copyright © 2016年 贾鹏. All rights reserved.
//


#import <Foundation/Foundation.h>
typedef void(^UpdateDataSourceBlock)(NSMutableArray *dataSource);
@interface DataSupport : NSObject
- (void)setUpdataDataSourceBlock:(UpdateDataSourceBlock) updateDataBlock;
- (void)addTestData;
@end
