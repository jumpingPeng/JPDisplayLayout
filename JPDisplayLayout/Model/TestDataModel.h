//
//  TestDataModel.h
//  DisplayLayout
//
//  Created by 贾鹏 on 2016/7/19.
//  Copyright © 2016年 贾鹏. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface TestDataModel : NSObject
@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *content;

@property (nonatomic, strong) NSAttributedString *attributeTitle;
@property (nonatomic, strong) NSAttributedString *attributeTime;
@property (nonatomic, strong) NSAttributedString *attributeContent;
@property (nonatomic, assign) float cellHeight;
@property (nonatomic, assign) float textHeight;
@end
